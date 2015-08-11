require 'ffaker'

# Create dummy users
User.destroy_all
5.times do
  User.create!(
    name: FFaker::Name.name,
    email: FFaker::Internet.email,
    city: FFaker::Address.city,
    state: FFaker::AddressUS.state,
    phone: FFaker::PhoneNumber.phone_number,
    password: "please"
  )
end


# Create dummy listings
Listing.destroy_all
user_ids = User.pluck(:id)
30.times do
  p = Listing.new(
    model: ["Flying Cloud", "International", "Safari", "Classic"].sample,
    year: (1936..Date.today.year).to_a.sample,
    length: (15..35).to_a.sample,
    state: FFaker::AddressUS.state,
    status: 'open',
    flagged: false,
    kind: ["private", "dealer"].sample,
    description: FFaker::Lorem.paragraphs.slice(0, 2).join("\n\n"),
    user_id: user_ids.sample,
    price: (10_000..60_000).to_a.sample
  )
  p.title = "#{p.year} #{p.length} #{p.model}"
  p.save!

end