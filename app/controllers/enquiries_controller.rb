class EnquiriesController < ApplicationController

  def import
    service = EnquiriesProcessorService.new
    service.process

    redirect_to enquiries_path
  end

end
