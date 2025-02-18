@transactions = [10, -15, 25, 30, -24, -70, 999]

def transaction_statement
  formatted_transactions = []
  @transactions.each do |transaction|
    formatted_transactions << yield(transaction)
  end

  p formatted_transactions
end

transaction_statement do |transaction|
  "%0.2f" % transaction
end
