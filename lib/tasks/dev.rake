namespace :dev do
  desc 'Config environment devolopment'
  task setup: :environment do
    20.times do |contact|
      puts 'Create contacts...'

      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 30.years.ago, to: 18.years.ago)
      )
    end

    puts 'Success when registering contacts!!!'
  end
end
