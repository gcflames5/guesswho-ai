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
          has_sharp_teeth: {text: "%h sharp teeth",  assume: {same: :eats_meat} },
          has_forward_facing_eyes: { text: "%h forward facing eyes"},
          has_spots: { text: "%h spots", assume: {diff: :has_stripes, if: true}},
          has_stripes: { text: "%h stripes", assume: {diff: :has_spots, if: true}},
        #Body Parts
          has_shell: { text: "%h a shell"},
          has_tail: { text: "%h a tail"},
        #Behavior
          eats_meat: { text: "%d eat meat", assume: {same: :has_sharp_teeth} },
          lives_in_sea: { text: "%l in the sea", assert: {same: :can_swim, if: true}},
          lives_on_land: { text: "%l on land"},
        #Ability
          can_fly: { text: "%c fly", assume: {diff: :has_shell, if: true} },
          can_swim: { text: "%c swim", assert: {same: :lives_in_sea, if: false} }
    }
  end
end
