require 'ffaker'

# Create dummy users
User.destroy_all
5.times do
  User.create(
    name: FFaker::Name.name,
    email: FFaker::Internet.email,
    city: FFaker::Address.city,
    state: FFaker::AddressUS.state,
    phone: FFaker::PhoneNumber.phone_number
  )
end


# Create dummy postings
Posting.destroy_all
user_ids = User.pluck(:id)
10.times do
  Posting.create(
    model: ["Flying Cloud", "International", "Safari", "Classic"].sample,
    year: (1936..Date.today.year).to_a.sample,
    length: (15..35).to_a.sample,
    zip_code: FFaker::AddressUS.zip_code,
    state: FFaker::AddressUS.state,
    status: 'open',
    flagged: false,
    dealer: false,
    description: FFaker::Lorem.paragraphs.first,
    user_id: user_ids.sample
  )

end