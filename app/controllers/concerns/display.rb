#Placeholder class until I switch over to yml
module Display
  extend ActiveSupport::Concern

  #  %i - "Is this animal <content>?"
  #  %d - "Does this animal <content>?"
  #  %h - "Does this animal have <content>?"
  #  %l - "Does this animal live <content>?"
  #  %c - "Can this animal <content>?"

  # assert/assume
    # [same/diff/true/false]: <attr>
      # if true/false
  def list
    {
      #True/False
        #Appearance
          is_tall: { text: "%i tall" },
          is_fast: { text: "%i fast" },
          has_sharp_teeth: {text: "%h sharp teeth" },
          has_forward_facing_eyes: { text: "%h forward facing eyes"},
          has_spots: { text: "%h spots" },
          has_stripes: { text: "%h stripes" },
        #Body Parts
          has_shell: { text: "%h a shell"},
          has_tail: { text: "%h a tail"},
        #Behavior
          eats_meat: { text: "%d eat meat" },
          lives_in_sea: { text: "%l in the sea" },
          lives_on_land: { text: "%l on land"},
        #Ability
          can_fly: { text: "%c fly" },
          can_swim: { text: "%c swim" },
    }
  end
end
