#Placeholder class until I switch over to yml
module Display
  extend ActiveSupport::Concern

  #  %i - "Is this animal <content>?"
  #  %d - "Does this animal <content>?"
  #  %h - "Does this animal have <content>?"
  #  %l - "Does this animal live <content>?"
  #  %c - "Can this animal <content>?"
  def self.list
    {
      #True/False
        #Appearance
          is_tall: { text: "%i tall" },
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
          lives_in_river: { text: "%l in a river"},
        #Ability
          can_fly: { text: "%c fly" },
          can_swim: { text: "%c swim" },
        is_predator: { text: "%i a predator" },
        is_scavenger: { text: "%i a scavenger" },
        is_common_pet: { text: "%i a common pet" },
        is_insect: { text: "%i an insect" },
        is_mammal: { text: "%i a mammal" },
        is_reptile: { text: "%i a reptils" },
        raised_for_food: { text: "%i normally rasied for food" },
        nocturnal: { text: "%i mostly nocturnal" },
        used_for_entertainment: { text: "%i very commonly used for entertainment purposes" },
        can_be_poisonous: { text: "%c be poisonous" },
    }
  end
end
