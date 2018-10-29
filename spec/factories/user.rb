FactoryBot.define do
  factory :user do
    sequence(:email) { |i| "email#{i}@example.com" }
    name {Faker::Name.first_name }
    password {"test1234"}

    trait :admin do
      after(:build) do |user|
        user.roles.build(name: "admin")
      end
    end

    trait :publisher do
      after(:build) do |user|
        user.roles.build(name: "publisher")
      end
    end

    trait :creator do
      after(:build) do |user|
        user.roles.build(name: "creator")
      end
    end

  end
end