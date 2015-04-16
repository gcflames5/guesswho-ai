class Animal
  include Mongoid::Document

  field :name,                type: String

  #True/False
    #Appearance
      field :is_tall,                type: Boolean
      field :has_sharp_teeth,         type: Boolean
      field :has_forward_facing_eyes, type: Boolean
      field :has_spots,               type: Boolean
      field :has_stripes,             type: Boolean
    #Body Parts
      field :has_shell,           type: Boolean
      field :has_tail,            type: Boolean
    #Behavior
      field :eats_meat,           type: Boolean
      field :lives_in_sea,        type: Boolean
      field :lives_in_river,        type: Boolean
      field :lives_on_land,       type: Boolean
    #Ability
      field :can_fly,             type: Boolean
      field :can_swim,            type: Boolean

    field :is_predator,                       type:Boolean
    field :is_scavenger,                      type:Boolean
    field :is_common_pet,                     type:Boolean
    field :is_insect,                         type:Boolean
    field :is_mammal,                         type:Boolean
    field :is_reptile,                        type:Boolean
    field :raised_for_food,                   type:Boolean
    field :nocturnal,                         type:Boolean
    field :used_for_entertainment,            type:Boolean
    field :can_be_poisonous,                  type:Boolean

  #Returns true if template fits animal, false if it does not
  def compare(template)
    Animal.attrs_template.each do |name|
      value = self.send(name)
      next if value.nil? || template.send(name).nil?
      return false unless template.send(name) == value
    end
    true
  end

  def self.attrs_template
    Display.list.keys
  end

end
