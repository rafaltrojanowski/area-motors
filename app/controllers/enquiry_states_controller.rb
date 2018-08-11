class EnquiryStatesController < ApplicationController
  before_action :set_enquiry

  def done
    @enquiry.transition_to!(:done)
    redirect_to enquiries_path, notice: "Done"
  rescue Statesman::TransitionFailedError => e
    redirect_to enquiries_path, notice: e
  end

  def not_valid
    @enquiry.transition_to!(:not_valid)
    redirect_to enquiries_path, notice: "Enquiry has been marked as invalid."
  rescue Statesman::TransitionFailedError => e
    redirect_to enquiries_path, notice: e
  end

  def archived
    @enquiry.transition_to!(:archived)
    redirect_to enquiries_path, notice: "Enquiry has been archived."
  rescue Statesman::TransitionFailedError => e
    redirect_to enquiries_path, notice: e
  end

  private

    def set_enquiry
      @enquiry = Enquiry.find(params[:id])
    end
end
