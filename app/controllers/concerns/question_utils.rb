module QuestionUtils
  extend ActiveSupport::Concern

  class Question

    attr_accessor :name

    def initialize(name)
      @name = name
    end

    def get_text
      (list[@name.to_sym][:text]
      .gsub('%i', 'Is this animal')
      .gsub('%h', 'Does this animal have')
      .gsub('%l', 'Does this animal live in')
      .gsub('%d', 'Does this animal')
      .gsub('%c', 'Can this animal')) + "?"
    end

  end

  def set_current_question(question)
    session[:q_name] = question.name
  end

  def get_current_question
    Question.new(session[:q_name])
  end

  #### QUESTION CHOOSING UTILS ####
  def choose_question
    p_list = Array.new
    Animal.attrs_template.each do |name|
      question = Question.new(name)
      value = session[:template].send(name)
      next if name == "_id" || !value.nil? || inconsequential?(question)
      propensity = [clone_and_test(session[:template], name, false), clone_and_test(session[:template], name, true)].max
      p_list << [propensity, question, !session[:template_assume].send(question.name).nil?]
    end
    @p_list = p_list
    return find_max(p_list)
  end

  def find_max(list)
    #max = [propensity, question, already_assumed?]
    max = [-1, nil, true]
    list.each do |item|
      next if !max[2] && item[2]
      max = item if (item[0] > max[0]) || (max[2] && !item[2])
    end
    return max[1]
  end

  def screen(question, answer)
    Assumption.get_relations(question, answer).each do |hash|
      key = hash.keys.first
      value = hash[key]

      next unless session[:template].send(key.to_sym).nil?

      if hash[:percent] >= 1.0
        #assert
        session[:template].send("#{key}=", value)
      else
        #assume
        session[:template_assume].send("#{key}=", value) if session[:template_assume].send(key.to_sym).nil?
      end
    end
  end

  def will_deplete_all?(question, answer)
    clone_and_test(session[:template], question.name, answer) >= session[:possibilities].count
  end

  def inconsequential?(question)
    [true, false].each do |boolean|
      return true if clone_and_test(session[:template], question.name, boolean) <= 0
    end
    return false
  end
  ##################################

end
