class WelcomeController < ApplicationController

  def index
    @animals = Animal.all.map{ |animal| animal.name }
  end

end
