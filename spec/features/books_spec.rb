require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'book[title]', with: 'Harry Potter'
    fill_in 'book[author]', with: 'J.K. Rowling'
    fill_in 'book[price]', with: '19.99'
    select '1997', from: 'book_published_date_1i'
    select 'June', from: 'book_published_date_2i'
    select '26', from: 'book_published_date_3i'
    click_on 'Create Book'

    expect(page).to have_content('Book was successfully created.')
    expect(page).to have_content('Harry Potter')
  end

  scenario 'blank title (rainy day)' do
    visit new_book_path
    fill_in 'book[title]', with: ''
    click_on 'Create Book'

    expect(page).to have_content('Book could not be created')
  end
end