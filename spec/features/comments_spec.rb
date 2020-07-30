# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Comment', type: :feature, js: true do
  context 'as an authenticated user' do
    let(:user) { create(:user) }
    let(:article) { create(:article) }

    before { sign_in_as user }

    scenario 'creates a comment' do
      visit "/articles/#{article.id}"

      within('#submit-comment-form') do
        fill_in 'Body', with: 'My first comment'
        click_button 'Save'
      end

      aggregate_failures do
        expect(page).to have_content(user.name.to_s)
        expect(page).to have_content('My first comment')
        expect(page).to have_content('Comment has been created!')
      end

      accept_alert do
        click_link 'delete'
      end

      expect(page).to have_content('Comment has been deleted!')
    end
  end

  context 'as an unauthenticated user' do
    let(:user) { create(:user) }
    let(:article) { create(:article) }

    scenario 'does not create a comment' do
      visit "/articles/#{article.id}"

      within('#submit-comment-form') do
        fill_in 'Body', with: 'My first comment'
        click_button 'Save'
      end

      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end
  end
end
