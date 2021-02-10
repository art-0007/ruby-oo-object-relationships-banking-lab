#require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize (sender, receiver, amount, status = "pending")
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status
  end

  def valid?
    if sender.valid? == false || receiver.valid? == false
      false
      else
        true
      end
  end

  def execute_transaction 
    #binding.pry
    if self.valid? == false || sender.balance < amount 
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif self.status == "complete"
      return
    else 
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    end
  end

    def reverse_transfer
      #binding.pry
      if self.status == "complete"
        sender.balance += self.amount
      receiver.balance -= self.amount
      self.status = "reversed" 
        
      end
      
    end

end
