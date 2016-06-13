json.array!(@holes) do |hole|
  json.extract! hole, :id
  json.url hole_url(hole, format: :json)
end
