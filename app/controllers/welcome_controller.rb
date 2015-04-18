class WelcomeController < ApplicationController

  def index
    @animals = Animal.all.map{ |animal| animal.name }
  end

  def show_relations
    @assumption = Assumption.first
  end

  def how_it_works
  end

end
