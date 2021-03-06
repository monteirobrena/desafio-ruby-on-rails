require 'rails_helper'

RSpec.describe Recipient, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:cpf) }
    it { should validate_presence_of(:card) }

    it { should validate_uniqueness_of(:cpf).scoped_to(:card) }
  end

  describe 'associations' do
    it { should have_many(:transactions) }
  end
end
