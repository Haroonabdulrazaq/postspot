FactoryBot.define do
  factory :comment do
    body { 'MyText' }
    article { nil }
  end
end
