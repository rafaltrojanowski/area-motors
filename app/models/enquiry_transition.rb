class EnquiryTransition < ActiveRecord::Base
  include Statesman::Adapters::ActiveRecordTransition

  validates :to_state, inclusion: { in: EnquiryStateMachine.states }

  belongs_to :enquiry, inverse_of: :enquiry_transitions
end
