# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'validations check' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:article) }

    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:article) }
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_length_of(:body).is_at_most(10_000) }
  end
end
