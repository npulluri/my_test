# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.create!({name: "James Neff", email: "james_neff@gmail.com", password: "test1234", password_confirmation: "test1234"})
creator = User.create!({name: "Peter Lynch", email: "peter_lynch@gmail.com", password: "test1234", password_confirmation: "test1234"})
publisher = User.create!({name: "Graham Benjiman", email: "benjiman_graham@gmail.com", password: "test1234", password_confirmation: "test1234"})

Roles = ['admin', 'creator', 'publisher']

users = User.where(email: ["james_neff@gmail.com", "peter_lynch@gmail.com", "benjiman_graham@gmail.com"])

users.each_with_index do |user, i|
  user.roles.build(name: Roles[i])
  user.save!
end

user = User.find_by(email: "peter_lynch@gmail.com")

user.articles.build({title: "Strong Financial Fundamentals", name: "article_123", content: "High-growth industries have a tendency of letting you down. For example, over the past ten years personal computer and mobile phone demand has rocketed, but shares in these sectors have struggled. Every time a company comes out with an innovation rival manufacturers, whether in China, the US or Finland, put thousands of engineers on the task of figuring out how to make it cheaper and better, and a new product will be on the market in six months."})
user.save!
