require 'rails_helper'

RSpec.describe "a user can open a trip" do
  it "and see the city the trip starts in" do
    user = create(:user_with_trips)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    trip = user.trips.first

    visit user_trips_path
    click_on trip1.start_city

    expect(page).to have_content trip1.start_city
    within first(".attraction-preview") do
      expect(page).to have_selector(".add-attraction-button")
      expect(page).to have_selector(".attraction-image-container")
      expect(page).to have_selector(".attraction-preview-name")
    end
  end
end