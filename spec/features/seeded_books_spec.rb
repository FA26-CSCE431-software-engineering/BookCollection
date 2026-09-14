require 'rails_helper'

RSpec.describe 'Seeded books in the test database', type: :feature do
  scenario 'the Home Page lists books created by db/seeds.rb' do
    visit books_path

    expect(page).to have_content('Harry Potter and the Sorcerer\'s Stone')
    expect(page).to have_content('The Hobbit')
    expect(page).to have_content('1984')
    expect(page).to have_content('Pride and Prejudice')
    expect(page).to have_content('The Great Gatsby')
  end

  scenario 'the seed file created at least 5 books' do
    expect(Book.count).to be >= 5
  end
end