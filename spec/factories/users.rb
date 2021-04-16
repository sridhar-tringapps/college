FactoryBot.define do
    factory :user do
        name { "sridhar" }
        password { "123123@1" }
        email { Faker::Internet.email }
        created_at { Date.today }
    end
end