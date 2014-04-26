require 'faker'

# Create Users
5.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save
end
users = User.all

# Create Topics
20.times do
  Topic.create(
   title: Faker::Commerce.color,
   about: Faker::Lorem.paragraph
  )
end
topics = Topic.all


50.times do
  Question.create(
    user: users.sample,
    title:  Faker::Lorem.sentence,
    body:   Faker::Lorem.paragraph
  )
end
questions = Question.all

# Create Answers by picking a random question to associate with each question
100.times do
  Answer.create(
    user: users.sample,
    question: questions.sample,
    body: Faker::Lorem.paragraph
  )
end

100.times do
  QuestionTopic.create(
    topic: topics.sample,
    question: questions.sample
    )
end

#modify one user which you can use to login
User.first.update_attributes(
  name: 'Alex Hawkins',
  password: 'helloworld',
)

puts "Seed finished"
puts "#{QuestionTopic.count} question topics created"
puts "#{User.count} users created"
puts "#{Topic.count } topics created"
puts "#{Question.count} questions created"
puts "#{Answer.count} answer created"