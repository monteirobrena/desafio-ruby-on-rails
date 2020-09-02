require 'rails_helper'

RSpec.describe FinancialTransactionsController, type: :request do
  describe 'GET index' do
    it 'returns a 200' do
      get '/v1/financial_transactions'

      expect(response).to have_http_status(:ok)
      expect(response.body).to eql('{}')
    end
  end
end
