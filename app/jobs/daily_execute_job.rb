class DailyExecuteJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Log the completion of the job
    Rails.logger.info "Daily job completed successfully."
  end
end
