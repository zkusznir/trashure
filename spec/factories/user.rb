# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email)    { |n| "hunter_#{n}@email.com" }
    sequence(:username) { |n| "treasure_hunter_#{n}" }
  end
end
