FactoryBot.define do
  factory :product do
    name                  {Faker::name}
    explanation           {Faker::Lorem.sentence}
    category_id           {2}
    condition_id          {2}
    postage_id            {2}
    source_id             {2}
    shipping_day_id       {2}
    price                 {5000}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'tst_image.png')
    end
  end
end
