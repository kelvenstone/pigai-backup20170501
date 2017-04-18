json.array!(@compositions) do |composition|
  json.extract! composition, :id, :grade, :content, user_id, :com_title
  json.url composition_url(composition, format: :json)
end
