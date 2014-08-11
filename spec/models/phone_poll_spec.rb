require 'spec_helper'

describe PhonePoll do
  it 'should be able to use enqueue' do

    ResqueSpec.reset!
    PhonePollTaker.should have_queue_size_of(0)
    Resque.enqueue(PhonePollTaker,  1)
    PhonePollTaker.should have_queue_size_of(1)
  end



  it 'should be able to use enqueue_at' do

    ResqueSpec.reset!
    PhonePollTaker.should have_schedule_size_of(0)
    Resque.enqueue_at(DateTime.now, PhonePollTaker,  1)
    PhonePollTaker.should have_schedule_size_of(1)
  end

end
