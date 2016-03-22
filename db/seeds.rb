# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Course.create([{ name: 'Test Course 1', active: true, slots: 8 },
               { name: 'Test Course 2', active: true, slots: 12 },
               { name: 'Test Course 3', active: false, slots: 6 }])

Member.create!(
  [
    { email: 'test1@eg.ca',
      password: 'golfer11',
      password_confirmation: 'golfer11',
      fname: 'Test',
      lname: 'Account 1',
      number: 1222
    },
    { email: 'test2@eg.ca',
      password: 'golfer12',
      password_confirmation: 'golfer12',
      fname: 'Test',
      lname: 'Account 2',
      number: 1234
    },
    { email: 'test3@eg.ca',
      password: 'golfer13',
      password_confirmation: 'golfer13',
      fname: 'Test',
      lname: 'Account 3',
      number: 1235
    }
  ]
)
