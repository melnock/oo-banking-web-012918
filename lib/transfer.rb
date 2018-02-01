class Transfer
  attr_reader :sender, :receiver, :amount, :status
  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
      @sender.balance -= @amount
      @receiver.balance += @amount
    if sender.valid? && @status == "pending"
      @status= "complete"
    else
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end

end
