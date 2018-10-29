FactoryBot.define do
  factory :article do
    title {Faker::Name.first_name }
    content {"Content"}
    name {"content_1"}
  end


end