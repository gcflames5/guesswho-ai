class Animal
  include Mongoid::Document

  field :name,                type: String

  #True/False
    #Appearance
      field :is_tall,                type: Boolean
      field :is_fast,                 type: Boolean
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
      field :lives_on_land,       type: Boolean
    #Ability
      field :can_fly,             type: Boolean
      field :can_swim,            type: Boolean

  #Returns true if template fits animal, false if it does not
  def compare(template)
    Animal.attrs_template.each do |name|
      value = self.send(name)
      next if template.send(name).nil?
      return false unless template.send(name) == value
    end
    true
  end

  def self.attrs_template
    [:is_tall, :is_fast, :has_sharp_teeth, :has_forward_facing_eyes, :has_spots, :has_stripes, :has_shell, :has_tail, :eats_meat, :lives_in_sea, :lives_on_land, :can_fly, :can_swim]
  end

end
