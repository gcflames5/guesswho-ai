# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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
