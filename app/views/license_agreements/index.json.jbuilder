json.array!(@license_agreements) do |license_agreement|
  json.extract! license_agreement, :id, :name, :domain, :user_id
  json.url license_agreement_url(license_agreement, format: :json)
end
