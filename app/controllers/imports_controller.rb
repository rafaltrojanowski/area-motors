class ImportsController < ApplicationController


  def create
    service = EnquiriesProcessorService.new
    service.process

    redirect_to enquiries_path, notice: "Processing your enquiries."
  end

end
