# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'User', type: :feature, js: true do
  scenario 'creates your profile' do
    user = create(:user)
    sign_in_as user
    aggregate_failures do
      expect(page).to have_content('Signed in successfully.')
      expect(page).to have_content('Comrade')
    end
  end

  scenario 'changes his name on the profile' do
    user = create(:user)
    sign_in_as user

    visit '/users/1'
    aggregate_failures do
      expect(page).to have_content('Edit profile')
      expect(page).to have_content('Comrade')
    end

    click_link 'Edit profile'
    fill_in 'Name', with: 'John'
    click_button 'Save'

    aggregate_failures do
      expect(page).to have_content('Edit profile')
      expect(page).to have_content('John')
    end
  end
end
