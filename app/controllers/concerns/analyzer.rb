module Analyzer
  extend ActiveSupport::Concern

  def self.analyze_database
    @animals = Animal.all
    hash = Hash.new #{ {<attr_name>: {<sub_attr_name>: <results> } } }
    Animal.attrs_template.each do |main_attr|
      hash[main_attr] = Hash.new
      Animal.attrs_template.each do |sub_attr|
        next if main_attr == sub_attr
        #results[:true][:false] --> # of occurences when main attr is true and sub_attr false
        results = {true: {true: 0, false: 0}, false: {true: 0, false: 0}}#[#true, #false]
        @animals.each do |animal|
          next if animal.send(main_attr).nil? || animal.send(sub_attr).nil?
          results[boolean_to_sym(animal.send(main_attr))][boolean_to_sym(animal.send(sub_attr))] += 1
        end
        results.each do |key, value|
          total = results[key][:true] + results[key][:false]
          value.each do |key2, value2|
            results[key][key2] /= total.to_f
          end
        end
        hash[main_attr][sub_attr] = results
      end
    end
    hash
  end

  def self.find_range(hash, min, max)
    matches = Array.new # {main_attr: <true/false>, sub_attr: <true/false>, percent: <0.0-1.0>}
    Animal.attrs_template.each do |main_attr|
      Animal.attrs_template.each do |sub_attr|
        next if main_attr == sub_attr
        results = hash[main_attr][sub_attr]
        results.each do |key, value|
          value.each do |key2, value2|
            percent = results[key][key2]
            matches << { main_attr => key, sub_attr => key2, percent: percent } if percent >= min/100.0 && percent <= max/100.0
          end
        end
      end
    end
    matches
  end

  def self.inject_relations
    analyzed_hash = Analyzer.analyze_database

    hash = Hash.new
    hash[:best] = Analyzer.find_range(analyzed_hash, 90, 100)
    hash[:good] = Analyzer.find_range(analyzed_hash, 70, 89)
    hash[:bad] = Analyzer.find_range(analyzed_hash, 0, 69)

    assumption = Assumption.new
    assumption.relations = hash
    assumption.save
  end

  private

  def self.boolean_to_sym(boolean)
    boolean ? :true : :false
  end

end
