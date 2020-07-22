# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'User', type: :feature do
  scenario 'creates your profile' do
    user = create(:user)

    visit root_path
    click_link 'Sign in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    sleep 1
    click_button 'Log in'
    sleep 1
    # expect(page).to have_content('Signed in successfully.')
    visit '/users/1'
    sleep 2
    expect(page).to have_content('Comrade')

    # save_and_open_page
  end

  # scenario 'view own profile' do
  #   visit root_path
  #   click_link 'Sign up'
  #   fill_in 'Email', with: '123@ya.ru'
  #   fill_in 'Password', with: '123123'
  #   fill_in 'Password confirmation', with: '123123'
  #   click_button 'Sign up'
  #   sleep 1
  #   click_link 'Gizeh'
  #   sleep 1
  #   visit '/users/1'
  #   sleep 2
  #   expect(page).to have_content('Comrade')
  # end
end
