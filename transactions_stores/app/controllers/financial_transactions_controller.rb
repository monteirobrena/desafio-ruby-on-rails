class FinancialTransactionsController < ApplicationController
  def create
    file_upload(params[:cnab_file]
  end

  private

  def file_upload(file)
    File.open(File.join('tmp', file.original_filename), 'wb') do |f|
      f.write(file.read)
    end
  end
end
