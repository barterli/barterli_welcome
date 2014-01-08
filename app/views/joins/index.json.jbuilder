json.array!(@joins) do |join|
  json.extract! join, :id, :email, :association_type, :message
  json.url join_url(join, format: :json)
end
