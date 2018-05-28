FactoryBot.define do
    factory :idea do
      association :user, factory: :user
      sequence(:title) { |n| Faker::Simpsons.quote + " #{n}"  }
      description { Faker::Hacker.say_something_smart } 
    end
  end