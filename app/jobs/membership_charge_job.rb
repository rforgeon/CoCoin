class MembershipChargeJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    puts "Enter Perform"
  end
end
