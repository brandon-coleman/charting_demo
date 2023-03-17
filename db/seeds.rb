# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'csv'

datapoints_csv = File.read(Rails.root.join("lib", "seeds", "datapoints.csv"))
# puts datapoints_csv
points = CSV.parse(datapoints_csv, :headers => true)

points.each do |row|
  timestamp = row['dt']
  value = row['value']
  value = 0 if value.blank?

  point = DataPoint.create!(timestamp: timestamp, value: value)
end
