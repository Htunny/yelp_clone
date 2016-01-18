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
end
