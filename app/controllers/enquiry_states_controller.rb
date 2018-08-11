class EnquiryStatesController < ApplicationController
  before_action :set_enquiry, only: [:done]

  def done
    @enquiry.done!

    redirect_to enquiries_path, notice: "Done!"
  end

  private

    def set_enquiry
      @enquiry = Enquiry.find(params[:id])
    end
end
