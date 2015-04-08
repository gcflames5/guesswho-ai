module QuestionUtils
  extend ActiveSupport::Concern

  class Question

    attr_accessor :name

    def initialize(name)
      @name = name
    end

    def get_text
      (list[@name]
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

end
