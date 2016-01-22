require 'rails_helper'

feature 'reviewing' do
  before {Restaurant.create name: 'Hawksmoor'}

  scenario 'allows users to leave a review using a form' do
    sign_up
    expect(current_path).to eq '/'
    click_link 'Review Hawksmoor'
    fill_in "Thoughts", with: "Amazing"
    select '5', from: 'Rating'
    click_button 'Leave Review'
    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('Amazing')
  end


  scenario 'displays an average rating for all reviews' do
    sign_up
    leave_review('So so', '3')
    leave_review('Amazing', '5')
    expect(page).to have_content('Average rating: ★★★★☆')
  end


end
