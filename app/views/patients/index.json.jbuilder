json.array!(@patients) do |patient|
  json.extract! patient, :id, :patient_name, :disease, :contact, :patient_email
  json.url patient_url(patient, format: :json)
end
