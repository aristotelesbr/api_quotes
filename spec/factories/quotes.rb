FactoryBot.define do
  factory :quote do
    quote { Faker::Lorem.sentence(2) }
    author { Faker::Name.name }
    author_about { Faker::Internet.url }
    tags 3.times.map { Faker::ProgrammingLanguage.name }
  end
end