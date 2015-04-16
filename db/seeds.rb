# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

=begin
50.times do |x|
  Animal.create(
    name: "Animal#{x}",

    is_tall: [true, false].sample,
    is_fast: [true, false].sample,
    has_sharp_teeth: [true, false].sample,
    has_forward_facing_eyes: [true, false].sample,
    has_spots: [true, false].sample,
    has_stripes: [true, false].sample,
    has_shell: [true, false].sample,
    has_tail: [true, false].sample,
    eats_meat: [true, false].sample,
    lives_in_sea: [true, false].sample,
    lives_on_land: [true, false].sample,
    can_fly: [true, false].sample,
    can_swim: [true, false].sample

  )
end
=end

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
