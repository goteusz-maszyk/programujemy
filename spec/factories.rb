FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.org" }
    sequence(:username) { |n| "username#{n}"}
    password { 'test12' }
    password_confirmation { 'test12' }
    sequence(:description) { |n| "user ##{n}"}
  end
end
