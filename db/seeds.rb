User.create(first_name: 'John', last_name: 'Tomoshige', email: 'john@example.com', password: '1234', password_confirmation: '1234')
User.create(first_name: 'Jim', last_name: 'Tomoshige', email: 'j@example.com', password: '1234', password_confirmation: '1234')
User.create(first_name: 'Pyonkichi', last_name: 'Pyonta', email: 'p@example.com', password: '1234', password_confirmation: '1234')
User.create(first_name: 'Moco', last_name: 'Moca', email: 'm@example.com', password: '1234', password_confirmation: '1234')
User.create(first_name: 'Test', last_name: 'D', email: 't@example.com', password: '1234', password_confirmation: '1234')

20.times do |n|
  Board.create!(
    title: Faker::Games::Pokemon.name,
    body: Faker::Games::Pokemon.move,
    user: User.offset(rand(User.count)).first
  )
end