require 'rails_helper'

feature 'reviewing' do
  before {Restaurant.create name: 'Hawksmoor'}

  scenario 'allows users to leave a review using a form' do
    visit '/restaurants'
    click_link 'Sign up'
    fill_in 'Email', with: 'steve@email.com'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    click_button 'Sign up'
    expect(current_path).to eq '/'
    click_link 'Review Hawksmoor'
    fill_in "Thoughts", with: "Amazing"
    select '5', from: 'Rating'
    click_button 'Leave Review'

    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('Amazing')
  end
end
