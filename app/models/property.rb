class Property < ApplicationRecord
  DEFAULT_RADIUS = 5000.freeze
  MARKETING_TYPES = %w(sell rent).freeze
  PROPERTY_TYPES = %w(apartment apartment_roof_storey apartment_maisonette
                      penthouse villa multi_family_house single_family_house
                      mid_terrace_house semi_detached_house end_terrace_house).freeze

  acts_as_geolocated

  def self.find_nearest(options)
    within_radius(DEFAULT_RADIUS, options[:lat], options[:lng])
      .where(property_type: options[:property_type], offer_type: options[:marketing_type])
  end

  def to_h
    attributes
      .slice('house_number', 'street', 'city', 'zip_code', 'state', 'lat', 'lng', 'price')
  end
end
