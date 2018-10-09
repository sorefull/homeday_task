class PropertiesController < ActionController::API
  PERMITTED_PARAMS = %i(lng lat property_type marketing_type)

  def search
    if validation_schema.success?
      properties = Property.find_nearest(property_search_params).map(&:to_h)
      results = properties.any? ? properties : 'Nothing found in that area.'

      render json: { results: results }, status: :ok
    else
      render json: { errors: validation_schema.messages }, status: :bad_request
    end
  end

  private

  def property_search_params
    params.permit(PERMITTED_PARAMS)
  end

  def validation_schema
    PropertySearchRequest.new.call(property_search_params)
  end
end
