# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validates check' do
    it { is_expected.to validate_length_of(:name).is_at_most(35) }
  end

  describe '#set_name' do
    subject { create(:user, name: '') }
    it 'should set random name' do
      expect(subject.name).to include 'Comrade'
    end
  end
end
