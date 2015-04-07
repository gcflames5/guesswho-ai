class Animal
  include Mongoid::Document

  #Multiple Choices
  field :diet,                type: Symbol  #[:carnivore, :herbivore, :omnivore]
  field :environment,         type: Symbol  #[:air, :land, :sea]
  field :primary_color,       type: Symbol  #[:red, :blue, :green, :orange, :brown, :black, :gray, :white, :yellow]
  field :pattern,             type: Symbol  #[:none, :spots, :stripes]

  #True/False
    #Appearance
      field :tall,                type: Boolean
      field :fast,                type: Boolean
      field :sharp_teeth,         type: Boolean
    #Body Parts
      field :has_shell,           type: Boolean
      field :has_tail,            type: Boolean

end
