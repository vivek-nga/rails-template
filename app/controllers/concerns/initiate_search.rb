module InitiateSearch
  extend ActiveSupport::Concern
  included do
    def search_params
      	params.try(:[], :search).try(:permit!)
    end

    def search?
      
    end
  end
end