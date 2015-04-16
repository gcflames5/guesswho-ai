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
    @possibilities = session[:possibilities].map{ |name| Animal.where(name: name).first }
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
    to_delete = Array.new

    session[:possibilities].each do |animal_name|
      animal = get_animal_by_name(animal_name)
      to_delete << animal_name unless animal.compare(session[:template])
    end

    to_delete.each do |animal|
      session[:possibilities].delete(animal)
    end
  end

  private

  #Name = attr name; Value = choice/truefalse
  def clone_and_test(template, name, value)
    template = template.clone
    template.send("#{name}=", value)
    rejects = 0
    session[:possibilities].each do |animal_name|
      animal = get_animal_by_name(animal_name)
      rejects += 1 unless animal.compare(template)
    end
    return rejects
  end

  def add_characteristic(key, value)
    session[:template].send("#{key}=", value)
    update
  end

  def get_animal_by_name(name)
    @possibilities.detect{|animal| animal.name == name}
  end

end
