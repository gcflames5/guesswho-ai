#Placeholder class until I switch over to yml
module Display
  extend ActiveSupport::Concern

  #  %i - "Is this animal <content>?"
  #  %d - "Does this animal <content>?"
  #  %h - "Does this animal have <content>?"
  #  %l - "Does this animal live <content>?"
  #  %c - "Can this animal <content>?"

  def list
    {
      #True/False
        #Appearance
          is_tall: "%i tall",
          is_fast: "%i fast",
          has_sharp_teeth: "%h sharp teeth",
          has_forward_facing_eyes: "%h forward facing eyes",
          has_spots: "%h spots",
          has_stripes: "%h stripes",
        #Body Parts
          has_shell: "%h a shell",
          has_tail: "%h a tail",
        #Behavior
          eats_meat: "%d eat meat",
          lives_in_sea: "%l in the sea",
          lives_on_land: "%l on land",
        #Ability
          can_fly: "%c fly",
          can_swim: "%c swim"
    }
  end
end
