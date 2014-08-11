Given(/^I want to use enqueue$/) do
  ResqueSpec.reset!
  PhonePollTaker.should have_queue_size_of(0)
  Resque.enqueue(PhonePollTaker,  1)
end


Then(/^it should add a job to the queue$/) do
  PhonePollTaker.should have_queue_size_of(1)
end

Given(/^I want to use enqueue_at$/) do
  ResqueSpec.reset!
  PhonePollTaker.should have_schedule_size_of(0)
  Resque.enqueue_at(DateTime.now, PhonePollTaker,  1)
end

Then(/^it should add a job to the schedule$/) do
  PhonePollTaker.should have_schedule_size_of(1)
end