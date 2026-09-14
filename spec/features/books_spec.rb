require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'book[title]', with: 'Harry Potter'
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