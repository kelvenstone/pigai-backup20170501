json.array!(@corrections) do |correction|
  json.extract! correction, :id :content
  json.url correction_url(correction, format: :json)
end
