require 'rails_helper'

RSpec.describe "a user can sign in" do
  it "signs in without exisiting trips" do
    user = create(:user, password: 'password')

    visit root_path
    find(".sign-in-link").click

    expect(current_path).to eq login_path
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")

    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    find(".btn-sign-in").click

    expect(user.trips.count).to eq(0)
    expect(current_path).to eq(new_user_trip_path(user.id))
  end
end


# # As a user
# # With existing account
# # And no existing trips
# # I visit root path
# # When I click “sign in”
# # I see a button to sign in with google *
# # I see a button to sign in with FB*
# # I see a button to sign in with email
# # I click on “sign in using email”
# # I see a form with field for:
# # ‘Email’
# # ‘Password’
# # And I fill in fields with correct user information
# # And I click on “sign in”
# # And I should be redirected to a prompt page asking to make a new trip form