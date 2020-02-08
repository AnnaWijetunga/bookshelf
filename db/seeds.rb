require 'faker'
include Faker

30.times do
    User.create(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: Faker::Internet.password
    )
end

30.times do
    Genre.create(
        name: Faker::Book.genre
    )
end

30.times do
    Review.create(
        content: Faker::Restaurant.review,
        book_id: Faker::Number.within(range: 1..30),
        user_id: Faker::Number.within(range: 1..30)
    )
end

30.times do
    Book.create(
        title: Faker::Book.title,
        author_first: Faker::Name.first_name,
        author_last: Faker::Name.last_name,
        genre_id: Faker::Number.within(range: 1..30)
    )
end


# Pre faker gem:

User.create(name: "Banana Gal", email: "banana@email.com", password: "goat", password_confirmation: "goat")
Genre.create(name: "Non-Fiction")
Book.create(title: "Dear Mother" , author_first: "Bunmi", author_last: "Laditan" , genre_id: 1)
Review.create(content: "This is the review #1 in the seed file! This book will bring you to tears of joy and laughter." , book_id: 1, user_id: 1)
