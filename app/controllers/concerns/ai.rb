module AI
  extend ActiveSupport::Concern
  include Display
  include QuestionUtils

  #Call this method when a new game begins to make sure old data is cleared
  def init_game
    session[:possibilities] = Animal.all.map{|x| x.name}
    session[:template] = Animal.new
    set_current_question(Question.new(nil))
  end

  def refresh
    session[:template] = Animal.new(session[:template])
    session[:current_question] = get_current_question
  end

  def answer_question(question, answer)
    add_characteristic(question.name, answer)
  end

  def update
    session[:possibilities].each do |animal_name|
      animal = Animal.where(name: animal_name).first
      session[:possibilities].delete(animal_name) unless animal.compare(session[:template])
      puts animal.compare(session[:template])
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

  def choose_question
    max_propensity = -1
    max_question = nil
    session[:template].attrs_template.each do |name|
      value = session[:template].send(name)
      next if name == "_id" || !value.nil?
      propensity = [clone_and_test(session[:template], name, false), clone_and_test(session[:template], name, true)].max
      question = Question.new(name)
      if propensity > max_propensity
        max_question = question
        max_propensity = propensity
      end
    end
    return session[:current_question] = max_question
  end

end
