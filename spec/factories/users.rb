FactoryBot.define do
    factory :user do
        # not generating a unique email like example
        # email { Faker::Internet.unique.email }
      name { Faker::Name.name }
      password { "abcd@1234" }
    end
end