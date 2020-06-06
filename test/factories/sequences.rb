FactoryBot.define do
  sequence :numeric, aliases: [:price] do |n|
    0 + n
  end

  sequence :string, aliases: %i[name address first_name sur_name last_name password] do |n|
    "teststring#{n}"
  end

  sequence :text, aliases: %i[requisites description short_description] do |n|
    "sometext#{n}"
  end

  sequence :email do |n|
    "email-#{n}@email.com"
  end

  sequence :phone_number do
    "8800#{rand(10**6..10**7)}"
  end
  sequence :date_start do
    Time.zone.now
  end

  sequence :date_end do
    Time.zone.now + 86_400
  end

  sequence :position do |n|
    "1/#{n}"
  end

  sequence :review do
    rand(0.0..5.0)
  end
end
