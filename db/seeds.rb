# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

p "Delete and generating new Task"
Task.destroy_all

10.times do
  realizations = Realization.all
  p = Task.create(
    title: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph,
    deadline: Faker::Time.between(from: DateTime.now, to: DateTime.now + 30),
  )
  puts "generating - product - #{p.title}"
end