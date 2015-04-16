#Template
#Animal.create(name: "", is_tall: false, is_fast: false, has_sharp_teeth: false, has_forward_facing_eyes: false, has_spots: false, has_stripes: false, has_shell: false, has_tail: false, eats_meat: false, lives_in_sea: false, lives_on_land: false, can_fly: false, can_swim: false)

#Land Animals
  Animal.create(name: "Giraffe", is_tall: true, is_fast: true, has_sharp_teeth: false, has_forward_facing_eyes: true, has_spots: true, has_stripes: false, has_shell: false, has_tail: true, eats_meat: false, lives_in_sea: false, lives_on_land: true, can_fly: false, can_swim: false)
  Animal.create(name: "Tiger", is_tall: false, is_fast: true, has_sharp_teeth: true, has_forward_facing_eyes: true, has_spots: false, has_stripes: true, has_shell: false, has_tail: true, eats_meat: true, lives_in_sea: false, lives_on_land: true, can_fly: false, can_swim: false)
  Animal.create(name: "Dog", is_tall: false, is_fast: false, has_sharp_teeth: true, has_forward_facing_eyes: true, has_spots: false, has_stripes: false, has_shell: false, has_tail: true, eats_meat: true, lives_in_sea: false, lives_on_land: true, can_fly: false, can_swim: false)
  Animal.create(name: "Pengiun", is_tall: false, is_fast: false, has_sharp_teeth: false, has_forward_facing_eyes: true, has_spots: false, has_stripes: false, has_shell: false, has_tail: true, eats_meat: true, lives_in_sea: true, lives_on_land: true, can_fly: false, can_swim: true)
  Animal.create(name: "Elephant", is_tall: true, is_fast: false, has_sharp_teeth: false, has_forward_facing_eyes: true, has_spots: false, has_stripes: false, has_shell: false, has_tail: true, eats_meat: true, lives_in_sea: false, lives_on_land: false, can_fly: false, can_swim: false)

#Sea Animals
  Animal.create(name: "Clown Fish", is_tall: false, is_fast: false, has_sharp_teeth: false, has_forward_facing_eyes: false, has_spots: false, has_stripes: true, has_shell: false, has_tail: true, eats_meat: false, lives_in_sea: true, lives_on_land: false, can_fly: false, can_swim: true)
  Animal.create(name: "Turtle", is_tall: false, is_fast: false, has_sharp_teeth: false, has_forward_facing_eyes: true, has_spots: false, has_stripes: false, has_shell: true, has_tail: false, eats_meat: false, lives_in_sea: true, lives_on_land: false, can_fly: false, can_swim: true)
  Animal.create(name: "Shark", is_tall: false, is_fast: true, has_sharp_teeth: true, has_forward_facing_eyes: true, has_spots: false, has_stripes: false, has_shell: false, has_tail: true, eats_meat: true, lives_in_sea: true, lives_on_land: false, can_fly: false, can_swim: true)

#Flying Animals
  Animal.create(name: "Hawk", is_tall: false, is_fast: true, has_sharp_teeth: false, has_forward_facing_eyes: true, has_spots: false, has_stripes: false, has_shell: false, has_tail: false, eats_meat: true, lives_in_sea: false, lives_on_land: false, can_fly: true, can_swim: false)
  Animal.create(name: "Parakeet", is_tall: false, is_fast: true, has_sharp_teeth: false, has_forward_facing_eyes: false, has_spots: false, has_stripes: false, has_shell: false, has_tail: false, eats_meat: false, lives_in_sea: false, lives_on_land: false, can_fly: true, can_swim: false)

Analyzer.inject_relations
