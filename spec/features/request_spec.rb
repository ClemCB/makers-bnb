feature 'As a user' do
  scenario 'I can request a booking for a property' do
    visit '/'
    user_sign_up
    click_link('List a New Property')
    expect(current_path).to eq '/property/new'
    list_a_new_property
    click_button('Log Out')
    click_link 'Sign up'
    fill_in 'name', with: 'Eva'
    fill_in 'email', with: 'eva@immsinns.com'
    fill_in 'password', with: 'secret123'
    click_button "Submit"
    click_button('request_booking8')
    expect(page).to have_content("Request Booking")
    fill_in 'start_date', with: '2017-11-12'
    fill_in 'end_date', with: '2017-11-13'
    click_button 'Submit Booking'
    expect(page).to have_current_path '/submit_request'
    expect(page).to have_content 'Request sent'
    expect(page).to have_content '1'
  end
end
