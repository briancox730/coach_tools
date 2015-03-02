json.cache! wod do
  json.name wod.name
  json.workouts workouts, :id, :name, :description
end
