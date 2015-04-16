class Assumption
  include Mongoid::Document

  #relations[:best, :good, :bad]
  field :rel_hash,          type: Hash

  class << self

    #Returns all relations that involve the specified key/value
    def get_relations(key, value)
      matches = Array.new
      Assumption.first.rel_hash[:best].each do |hash|
        next unless hash.keys[0] == key && !hash[hash.keys[0]].nil? && hash[hash.keys[0]] == boolean_to_sym(value)
        matches << { hash.keys[1] => hash[hash.keys[1]], percent: hash[percent] }
      end
      matches
    end

    def number_of_unmade_assumptions(question, boolean, template)
      num = 0
      get_relations(question.name, boolean).each do |hash|
        num += 1 if template.send(hash.keys[0]).nil?
      end
      num
    end

    def boolean_to_sym(boolean)
      boolean ? :true : :false
    end

  end

end
