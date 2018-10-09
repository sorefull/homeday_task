class PropertySearchRequest < Dry::Validation::Schema
  configure do
    config.messages_file = Rails.root.join('config', 'dry_errors.yml')

    def coordinate?(value)
      ! /^([-+]?)([\d]{1,2})((\.)(\d+))$/.match(value).nil?
    end
  end

  define! do
    required(:lng).value(:coordinate?)
    required(:lat).value(:coordinate?)

    required(:property_type).value(included_in?: Property::PROPERTY_TYPES)
    required(:marketing_type).value(included_in?: Property::MARKETING_TYPES)
  end
end
