module AI
  extend ActiveSupport::Concern
  include Display
  include QuestionUtils

  #Call this method when a new game begins to make sure old data is cleared
  def init_game
    session[:possibilities] = Animal.all.map{|x| x.name}
    session[:template] = Animal.new
    session[:template_assume] = Animal.new
    session[:history] = Array.new
    set_current_question(Question.new(nil))
  end

  def refresh
    session[:template] = Animal.new(session[:template])
    session[:template_assume] = Animal.new(session[:template_assume])

    session[:current_question] = get_current_question
  end

  #Returns false if the answer eliminates all chocies
  def answer_question(question, answer)
    return false if will_deplete_all?(question, answer)
    add_characteristic(question.name, answer)
    session[:history] << [question.get_text, answer]
    screen(question, answer)
    true
  end

  def complete?(question)
    session[:possibilities].count == 1 || question.nil?
  end

  def update
    session[:possibilities].each do |animal_name|
      animal = Animal.where(name: animal_name).first
      session[:possibilities].delete(animal_name) unless animal.compare(session[:template])
    end
  end

  private

  #Name = attr name; Value = choice/truefalse
  def clone_and_test(template, name, value)
    template = template.clone
    template.send("#{name}=", value)
    rejects = 0
    session[:possibilities].each do |animal_name|
      animal = Animal.where(name: animal_name).first
      rejects += 1 unless animal.compare(template)
    end
    return rejects
  end

  def add_characteristic(key, value)
    session[:template].send("#{key}=", value)
    update
  end

end
