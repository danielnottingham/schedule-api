namespace :dev do
  desc 'Config environment devolopment'
  task setup: :environment do
    puts 'Creating kinds...'

    kinds = %w(Friend Commercial Known)

    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end

    puts 'Success when registering kinds!!!'
  end

  task setup2: :environment do
    puts 'Creating contacts...'

    20.times do
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 30.years.ago, to: 18.years.ago),
        kind_id: Kind.all.sample.id
      )
    end

    puts 'Success when registering contacts!!!'
  end
end
