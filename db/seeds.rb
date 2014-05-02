require 'faker'

# Create Users
5.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: 'helloworld'
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
  answer = Answer.create(
    user: users.sample,
    question: questions.sample,
    body: Faker::Lorem.paragraph
  )
end

  # create n number of votes for answer
 # 10.times do
   # val = Random.new.rand(-1..1)
 #   val = val == 0 ? 1 : val 
  #  vote = answer.answer_votes.create(
  #    value: val,
  #    user: users.sample
  #  ) 
 # end
#end

100.times do
  QuestionTopic.create(
    topic: topics.sample,
    question: questions.sample
    )
end

#modify one user which you can use to login
# Create an admin user
admin = User.new(
  name:     'Admin User',
  email:    'admin@example.com',
  password: 'helloworld',
  role:     'admin'
)
admin.skip_confirmation!
admin.save

# Create a moderator
moderator = User.new(
  name:     'Moderator User',
  email:    'moderator@example.com', 
  password: 'helloworld',
  role:     'moderator'
)
moderator.skip_confirmation!
moderator.save

# Create a member
member = User.new(
  name:     'Member User',
  email:    'member@example.com',
  password: 'helloworld',
)
member.skip_confirmation!
member.save

puts "Seed finished"
puts "#{QuestionTopic.count} question topics created"
puts "#{User.count} users created"
puts "#{Topic.count } topics created"
puts "#{Question.count} questions created"
puts "#{Answer.count} answer created"