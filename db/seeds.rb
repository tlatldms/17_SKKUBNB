puts "Inserting..."
[   
    ["1점"],
    ["2점"],
    ["3점"],
    ["4점"],
    ["5점"],
    ["6점"],
    ["7점"],

    ].each do |x| 
        Rate2.create(rateinteger: x[0])
    end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
