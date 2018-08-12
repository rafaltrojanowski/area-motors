class ImportsController < ApplicationController

  def create
    service = EnquiriesProcessorService.new
    service.process

    if service.success?
      redirect_to enquiries_path, notice: "Processing #{service.enquiries_count} enquiries."
    else
      redirect_to enquiries_path, notice: "No new customer enquiries."
    end
  end

end
