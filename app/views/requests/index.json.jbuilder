json.array!(@requests) do |request|
  json.extract! request, :title, :description, :budget, :date_response_by, :date_request_executed, :location, :company_name, :address, :category, :sub_category
  json.url request_url(request, format: :json)
end