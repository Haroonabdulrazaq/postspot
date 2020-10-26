FactoryBot.define do
  factory :article do
    title { Faker::Lorem.characters }
    text { Faker::Lorem.paragraphs }
    category_id { Faker::Number.digit }
    image { Faker::LoremPixel.image }
  end
end
