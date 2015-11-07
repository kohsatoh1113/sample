# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'
ActiveRecord::Base.transaction do
  csv = CSV.read('db/y.csv', encoding: "Shift_JIS:UTF-8")
  csv.each do |line|
    code = line[2]
    name = line[4]
    MedicineMaster.create(code: code, name: name)
    puts "#{code} #{name}"
  end
end
