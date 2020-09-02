require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:store) }
    it { should validate_presence_of(:amount) }
    it { should validate_presence_of(:recipient) }
    it { should validate_presence_of(:occurred_in) }
    it { should validate_presence_of(:transaction_type) }
  end

  describe 'associations' do
    it { should belong_to(:store) }
    it { should belong_to(:recipient) }
    it { should belong_to(:transaction_type) }
  end

  describe 'should return the transactions by store' do
    let(:amazon) { Store.create(name: 'Amazon', owner: 'Jeff Bezos') }
    let(:target) { Store.create(name: 'Target', owner: 'George Draper Dayton') }

    before do
      recipient = Recipient.create(cpf: '12345678900', card: '4753****3153')
      transaction_type = TransactionType.create(id: 1, description: 'Débito', origin: 0)
      Transaction.create(store: amazon,
                         amount: 550.00,
                         recipient: recipient,
                         occurred_in: DateTime.now,
                         transaction_type: transaction_type)
    end

    it { expect(Transaction.by_store(amazon)).to_not be_empty }
    it { expect(Transaction.by_store(amazon).count).to eql(1) }

    it { expect(Transaction.by_store(target)).to be_empty }
    it { expect(Transaction.by_store(target).count).to eql(0) }
  end
end
