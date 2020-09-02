class API::V1::FinancialTransactionsController < ApplicationController
  def index
    render json: {}, status: :ok
  end
end