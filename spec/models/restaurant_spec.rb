require 'rails_helper'
require 'spec_helper'

RSpec.describe Restaurant, type: :model do
  it { is_expected.to have_many :reviews }

  it 'is not valid with a name of less than three characters' do
    restaurant = Restaurant.new(name: "Ha")
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end
end
