This a subset of my code trying to replicate the issue I was having with resque_spec.  I think I have some weird configuration issue with cucumber, since it works in RSpec


Original Post:

> I'm not quite sure what I'm doing wrong.  I can get enqueue_at to work in RSpec, but not cucumber.  
> 
> Resque.enqueue works properly in cucumber (and RSpec) but I always get "Invalid argument - connect(2) (Errno::EINVAL)" when I try to run Resque.enqueue_at in cucumber
> 
> .env
> ``` ruby
> require 'rubygems'
> require 'spork'
> 
> Spork.prefork do
>   require 'resque_spec/cucumber'
>   require 'resque_spec/scheduler'
> end
> ```
> phone_poll_steps.rb (doesn't work)
> ``` ruby
> When(/^It is time to be called$/) do
> 
>   PhonePollTaker.should have_schedule_size_of(0)
>   Resque.enqueue_at(DateTime.now + 2.seconds, PhonePollTaker,  1) # line that fails
>   PhonePollTaker.should have_schedule_size_of(1)
> end
> ```
> 
> phone_poll_spec.rb (works)
> ``` ruby
> describe PhonePoll do
>   it 'should be able to make a call' do
>     ...
>     PhonePollTaker.should have_schedule_size_of(0)
>     Resque.enqueue_at(DateTime.now + 2.seconds, PhonePollTaker,  1)
>     PhonePollTaker.should have_schedule_size_of(1)
>   end
> end
> ```
> 
> Works in both
> ``` ruby
>   Resque.enqueue(PhonePollTaker,  1)
> ```


Since the original post I've changed .env to
.env
``` ruby
require 'rubygems'
require 'spork'
require 'resque_spec/cucumber'
require 'resque_spec/scheduler'

Spork.prefork do
end
```


