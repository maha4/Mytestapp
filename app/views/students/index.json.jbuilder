json.array!(@students) do |student|
  json.extract! student, :id, :name, :email, :gender, :bio
  json.url student_url(student, format: :json)
end
