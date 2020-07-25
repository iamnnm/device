require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'validates check' do
    it { is_expected.to belong_to :user }

    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :post }
    it { is_expected.to validate_length_of(:title).is_at_most(100) }
    it { is_expected.to validate_length_of(:post).is_at_most(10_000) }
  end
end
