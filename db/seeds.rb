20.times do |n|
  Board.create!(
    title: Faker::Games::Pokemon.name,
    body: Faker::Games::Pokemon.move,
    user_id: [1,2,3].sample
  )
end