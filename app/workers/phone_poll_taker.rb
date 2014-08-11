# This is a Resque scheduler worker, which allows for asynchronously executed scheduled outbound phone polls

class PhonePollTaker 
  @queue = :phone_calls_queue  
  def self.perform(user_id)
    # PhonePoll.start_outbound_phone_poll(user_id)
    temp = 1 + user_id
  end
end  