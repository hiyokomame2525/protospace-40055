FactoryBot.define do
  factory :user do
        email                 {Faker::Internet.email}
        password              {Faker::Internet.password(min_length:6 )}
        password_confirmation {password}
        name                  {Faker::Name.name}
        profile               {Faker::Lorem.sentences}
        occupation            {Faker::Lorem.sentence}
        position              {Faker::Lorem.sentence}
  end
end
