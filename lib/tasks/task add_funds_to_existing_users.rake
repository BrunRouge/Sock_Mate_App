task add_funds_to_existing_users: :environment do
  puts 'Retrieving all users with no funds ...'
  users = User.where(funds_cents: nil)

  puts "#{users.count} retrieved !"

  puts 'Starting to add funds to those users ...'
  users.each do |user|
    user.update(funds_cents: 10000)
    puts "This #{user.email} has been uptated with a 100 euros"
  end

  puts 'Funds correctly added'
end
