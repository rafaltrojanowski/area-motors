class EnquiryTransition < ActiveRecord::Base
  include Statesman::Adapters::ActiveRecordTransition

  validates :to_state, inclusion: { in: Enquiry::EnquiryStateMachine.states }

  belongs_to :enquiry, inverse_of: :transitions
end
