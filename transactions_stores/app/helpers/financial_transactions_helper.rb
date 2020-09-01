module FinancialTransactionsHelper
  STORE_SIZE = 18
  OWNER_SIZE = 14
  DIVISOR_CURRENCY = 100.00

  def read_file_to_save_data(filename)
    File.open(filename, 'r').each_line do |line|
      data = split(line)

      save({ cpf: data[:cpf],
             type: data[:type],
             card: data[:card],
             store_name: extract_store(data[:store]),
             store_owner: extract_owner(data[:store]),
             amount: parse_to_currency(data[:amount]),
             occurred_in: parse_to_datetime(data[:date], data[:time]) })
    end
  end

  def save(transaction)
    transaction_type = TransactionType.find(transaction[:type])

    recipient = Recipient.find_or_create_by(cpf: transaction[:cpf], 
                                            card: transaction[:card])
    
    store = Store.find_or_create_by(name: transaction[:store_name], 
                                    owner: transaction[:store_owner])

    transaction = Transaction.create(store: store,
                                     recipient: recipient,
                                     amount: transaction[:amount],
                                     transaction_type: transaction_type,
                                     occurred_in: transaction[:occurred_in])
  end

  def split(line)
    /(?<type>.)(?<date>........)(?<amount>..........)(?<cpf>...........)(?<card>............)(?<time>......)(?<store>.*)/.match(line)
  end

  def extract_store(names)
    names.last(STORE_SIZE).squish
  end

  def extract_owner(names)
    names.first(OWNER_SIZE).squish
  end

  def parse_to_currency(amount)
    amount.to_d / DIVISOR_CURRENCY
  end

  def parse_to_datetime(date, time)
    DateTime.parse("#{date}#{time}")
  end
end
