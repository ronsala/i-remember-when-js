# frozen_string_literal: true

require 'faker'

User.destroy_all
Event.destroy_all
Memory.destroy_all

20.times do
  User.create(
    username: Faker::Name.unique.name,
    bio: Faker::Lorem.paragraph(sentence_count: 2),
    email: Faker::Internet.email,
    password: '123456'
  )
end

40.times do
  Event.create(
    name: Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 2).gsub('.', '').titleize,
    country: Faker::Address.country,
    date: Faker::Date.between(from: 120.years.ago, to: Date.today),
    description: Faker::Lorem.paragraphs(number: 1, supplemental: true).to_s.gsub(/"|\[|\]/, '')
  )
end

200.times do
  Memory.create(
    event_id: Faker::Number.between(from: 1, to: 40),
    user_id: Faker::Number.between(from: 1, to: 20),
    title: Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 2).gsub('.', '').titleize,
    body: Faker::Lorem.paragraphs(number: 1, supplemental: true).to_s.gsub(/"|\[|\]/, '')
  )
end
