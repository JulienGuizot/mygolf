json.array!(@golfers) do |golfer|
  json.extract! golfer, :id
  json.url golfer_url(golfer, format: :json)
end
