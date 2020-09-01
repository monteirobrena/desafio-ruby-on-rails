require 'rails_helper'

RSpec.describe ImportCnabDataJob, type: :job do
  describe 'perform later job added to queue' do
    it 'added job to queue' do
      ActiveJob::Base.queue_adapter = :test
      
      expect { ImportCnabDataJob.perform_now(file_fixture('cnab.txt')) }.to have_enqueued_job
    end
  end

  describe 'job executed' do
    before {
      Transaction.destroy_all
      TransactionType.create(id: 1, description: 'Débito', origin: 0)

      ImportCnabDataJob.perform_now(file_fixture('cnab.txt'))
    }

    it { expect(Transaction.first).to_not eql(nil) }
  end
end
