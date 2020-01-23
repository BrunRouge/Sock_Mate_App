puts 'Creating users...'

User.create!({
  email: 'malekith@naggarond.us',
  password: '4000yearoldvirgin'
})


User.create!({
  email: 'chucknorris@norrismail.norris',
  password: 'chuck9001'
})

User.create!({
  email: 'thereaper@styx.hades',
  password: 'dontjudgeme404'
})


users = User.all
socktextiles = ['silk', 'wool', 'cotton', 'wool/cotton mix', 'kashmir', 'spider-web', 'synthetic', 'straw', 'virgin\'s hair', 'tears of joy', 'duct tape']
sockcolors = ['white', 'gray', 'orange', 'black', 'ginger', 'potato', 'red', 'green', 'blue', 'beige', 'pink', 'neon', 'psychedelic', 'brown', 'yellow', 'kenny']

socktextiles.each do |string|
  string.capitalize!
end

sockcolors.each do |string|
  string.capitalize!
end

puts 'Creating socks...'

users.each do |user|
  5.times do
    Sock.create!({
    textile: socktextiles.sample,
    color: sockcolors.sample,
    size: rand(1..20),
    price: rand(1..100),
    user_id: user.id
    })
  end
end

puts 'Finished!'
