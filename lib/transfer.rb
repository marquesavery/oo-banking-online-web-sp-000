require 'pry'
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
    # binding.pry
    if @sender.balance < self.amount || @receiver.status == "closed"
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif self.status == "pending"
      @receiver.deposit(self.amount)
      @sender.balance -= self.amount
      self.status = "complete"
    end
  end

  def reverse_transfer
    
  end

end
