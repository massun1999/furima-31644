FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"yamada123"}
    password_confirmation {password}
    first_name            {"太ろウ"}
    last_name             {"やマ田"}
    first_name_ruby       {"カタカナ"}
    last_name_ruby        {"カタカナ"}
    birthday              {"2020-01-01"}
  end
end