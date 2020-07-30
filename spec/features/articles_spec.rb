# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Article', type: :feature do
  context 'as an authenticated user' do
    let(:user) { create(:user) }

    before do
      sign_in_as user
    end

    scenario 'creates a new post' do
      visit root_path
      click_link '+ New Post'
      fill_in 'Title', with: 'New title'
      fill_in 'Post', with: 'New post'
      click_button 'Save'

      aggregate_failures do
        expect(page).to have_content('Post has been created!')
        expect(page).to have_content('New title')
        expect(page).to have_content('New post')
      end
    end
  end

  context 'as an unauthenticated user' do
    scenario 'should not create a new post' do
      visit root_path
      click_link '+ New Post'

      aggregate_failures do
        expect(page).to have_content('You need to sign in or sign up before continuing.')
        expect(page).to have_content('Email')
        expect(page).to have_content('Password')
      end
    end
  end
end
