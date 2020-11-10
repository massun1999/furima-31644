FactoryBot.define do
  factory :purchase_address do
    postal { '510-1323' }
    prefecture_id { 3 }
    city { '菰野町' }
    house_number { '小島' }
    building { 'AIコンフォート' }
    phone { '09063979349' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
