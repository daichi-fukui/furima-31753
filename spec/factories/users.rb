FactoryBot.define do
  factory :user do
    nickname              {"fukui"}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {"福井"}
    first_name            {"大地"}
    family_name_alias     {"フクイ"}
    first_name_alias      {"ダイチ"}
    birthday              {Faker::Date.between_except(from: '2014-09-23', to: '2015-09-25', excepted: '2015-01-24')}
  end
end