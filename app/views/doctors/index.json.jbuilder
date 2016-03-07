json.array!(@doctors) do |doctor|
  json.extract! doctor, :id, :doctor_name, :years_of_experience, :doctor_email
  json.url doctor_url(doctor, format: :json)
end
