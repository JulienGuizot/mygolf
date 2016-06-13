json.array!(@score_by_holes) do |score_by_hole|
  json.extract! score_by_hole, :id
  json.url score_by_hole_url(score_by_hole, format: :json)
end
