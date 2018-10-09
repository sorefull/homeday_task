FactoryBot.define do
  factory :property do
    offer_type        { 'sell' }
    property_type     { 'apartment' }
    zip_code          { '13189' }
    city              { 'Berlin' }
    street            { 'Thulestraße' }
    house_number      { '1' }
    lng               { 13.38815072 }
    lat               { 52.53177508 }
    construction_year { 1964 }
    number_of_rooms   { 2 }
    currency          { 'eur' }
    price             { 124000.00 }
  end
end
