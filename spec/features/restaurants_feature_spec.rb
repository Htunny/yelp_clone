require 'rails_helper'

feature 'restaurants' do
  context 'no restaurants have been added' do
    scenario 'shouls display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add a restaurant'
    end
  end

  context 'restaurants have been added' do
    before do
      Restaurant.create(name: 'Hawksmoor')
    end

    scenario 'display reataurants' do
      visit '/restaurants'
      expect(page).to have_content('Hawksmoor')
      expect(page).not_to have_content('No restauarants yet')
    end
  end

  context 'creating restaurants' do
    scenario 'promts user to fill out a form, then displays the new restaurant' do
      visit '/restaurants'
      click_link 'Add a restaurant'
      fill_in 'Name', with: 'Hawksmoor'
      click_button 'Create Restaurant'
      expect(page).to have_content 'Hawksmoor'
      expect(current_path).to eq '/restaurants'
    end
  end

  context 'viewing restaurants' do

    let!(:hawksmoor){Restaurant.create(name:'Hawksmoor')}

    scenario 'lets a user view a restaurant' do
      visit '/restaurants'
      click_link 'Hawksmoor'
      expect(page).to have_content 'Hawksmoor'
      expect(current_path).to eq "/restaurants/#{hawksmoor.id}"
    end
  end

  context 'editing restaurants' do
    before {Restaurant.create name: "Hawksmoor"}

    scenario 'let user edit a restaurant' do
      visit '/restaurants'
      click_link 'Edit Hawksmoor'
      fill_in 'Name', with: 'The Hawksmoor'
      click_button 'Update Restaurant'
      expect(page).to have_content 'The Hawksmoor'
      expect(current_path).to eq '/restaurants'
    end
  end
end
