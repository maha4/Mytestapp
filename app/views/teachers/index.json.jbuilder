json.array!(@teachers) do |teacher|
  json.extract! teacher, :id, :name, :course
  json.url teacher_url(teacher, format: :json)
end
