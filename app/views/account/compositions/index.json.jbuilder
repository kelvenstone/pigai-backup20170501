json.array!(@compositions) do |composition|
  json.extract! composition, :id, :title, :summary, :content
  json.url composition_url(composition, format: :json)
end
