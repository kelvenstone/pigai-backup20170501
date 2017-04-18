json.array!(:admin,@writings) do |writing|
  json.extract! writing, :id :content
  json.url writing_url(writing, format: :json)
end
