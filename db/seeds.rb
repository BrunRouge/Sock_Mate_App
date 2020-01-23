puts 'Creating users...'

User.create!({
  email: 'Malekith@Naggaroth.us',
  password: '4000yearoldvirgin'
})


User.create!({
  email: 'ChuckNorris@NorrisMail.Norris',
  password: 'Chuck9001'
})

User.create!({
  email: 'TheReaper@styx.hades',
  password: 'DontJudgeMe404'
})


users = User.all
socktextiles = ['silk', 'wool', 'cotton', 'wool/cotton mix', 'kashmir', 'spider-web', 'synthetic', 'straw', 'virgin hair', 'Jack Sparrow\'s backhair', 'duct tape']
sockcolors = ['white', 'gray', 'orange', 'black', 'ginger', 'potato', 'red', 'green', 'blue', 'beige', 'pink', 'neon', 'psychedelic', 'brown', 'yellow', 'Kenny']

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
