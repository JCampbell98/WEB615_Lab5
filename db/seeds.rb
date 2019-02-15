# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Comment.delete_all
Article.delete_all
User.delete_all

for i in 1..50
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  name = "#{first_name} #{last_name}"

  user = User.new
  user.name = name
  user.email = Faker::Internet.free_email(name)

  if user.save
    article = Article.new
    article.title = Faker::Book.title
    article.content = Faker::Lorem.paragraph
    article.user = user
    if article.save

    end
  end

end

for article in Article.all
  for user in User.all
    for i in 1..10
      comment = Comment.new
      comment.message = Faker::Lorem.sentence
      comment.article = article
      comment.user = user
      comment.save
    end
  end
end