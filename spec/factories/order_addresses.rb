FactoryBot.define do
  factory :order_address do

    postal_code       {"123-4567"}
    area_id           {2}
    city              {"横浜"}
    house_number      {"青山1-1-1"}
    building_name     {"建物"}
    phone_number      {"09012345678"}
    token             {"sample_token"}
    user_id           {2}
    item_id           {2}
  end
end
