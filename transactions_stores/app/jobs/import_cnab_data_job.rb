class ImportCnabDataJob < ApplicationJob
  queue_as :import

  def perform(file)
    ActiveRecord::Base.transaction do
      FinancialTransactionsHelper.read_file_to_save_data(file)
    end
  end
end
