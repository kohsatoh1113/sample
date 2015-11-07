# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'
require 'nkf'

ActiveRecord::Base.transaction do
  csv = CSV.read('db/y.csv', encoding: "Shift_JIS:UTF-8")
  csv.each do |line|
    code = line[2]
    name = line[4]
    kanayomi = line[6]
    yomi = NKF.nkf('-w --hiragana', kanayomi)
    MedicineMaster.create(code: code, name: name, yomi: yomi)
    puts "#{code} #{name} #{yomi}"
  end
end
