class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if sender.balance < self.amount
      "Transaction rejected. Please check your account balance."
    else
      receiver.deposit(self.amount)
      self.status = "complete"
      sender.balance -= self.amount
      self.status = "complete"
    end
  end

end
