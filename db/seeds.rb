# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

if Rails.env.production?
  # Production catalog, with Product tag for the sake of being 100% obvious
  books = [
    { title: 'Production: The Pragmatic Programmer', author: 'Andrew Hunt',       price: 49.99, published_date: Date.new(1999, 10, 30) },
    { title: 'Production: Clean Code',               author: 'Robert C. Martin',   price: 44.99, published_date: Date.new(2008, 8, 1) },
    { title: 'Production: The Rails Way',            author: 'Obie Fernandez',     price: 54.99, published_date: Date.new(2007, 11, 16) }
  ]
else
  # Development
  books = [
    { title: 'Harry Potter and the Sorcerer\'s Stone', author: 'J.K. Rowling',        price: 19.99, published_date: Date.new(1997, 6, 26) },
    { title: 'The Hobbit',                             author: 'J.R.R. Tolkien',      price: 14.99, published_date: Date.new(1937, 9, 21) },
    { title: '1984',                                   author: 'George Orwell',       price: 12.99, published_date: Date.new(1949, 6, 8) },
    { title: 'Pride and Prejudice',                    author: 'Jane Austen',         price:  9.99, published_date: Date.new(1813, 1, 28) },
    { title: 'The Great Gatsby',                       author: 'F. Scott Fitzgerald', price: 10.99, published_date: Date.new(1925, 4, 10) }
  ]
end

# Seed the data above based on the example, albeit with more due to the extra attributes from Part 2 of Book Collection
books.each do |attrs|
  Book.find_or_create_by(title: attrs[:title]) do |b|
    b.author         = attrs[:author]
    b.price          = attrs[:price]
    b.published_date = attrs[:published_date]
  end
end

# Debug line to see if all is well
puts "Seeded #{Book.count} books in #{Rails.env}"