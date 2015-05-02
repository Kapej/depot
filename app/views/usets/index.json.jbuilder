json.array!(@usets) do |uset|
  json.extract! uset, :id, :name
  json.url uset_url(uset, format: :json)
end
