require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'Check association' do
    it { is_expected.to have_many(:articles) }
  end
end
