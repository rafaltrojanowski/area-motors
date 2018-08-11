class Enquiry::EnquiryStateMachine
  include Statesman::Machine

  state :pending, initial: true
  state :done
  state :not_valid
  state :edited

  state :archived

  transition from: :pending, to: [:not_valid, :done]

  transition from: :done, to: [:archived]
  transition from: :not_valid, to: [:archived]

  transition from: :not_valid, to: [:edited]
  transition from: :edited, to: [:done]

  # guard_transition(to: :done) do |enquiry|
    # TODO: add necessary logic here
  # end

  # before_transition(from: :pending, to: :done) do |order, transition|
    # TODO: add necessary logic here
  # end

  # before_transition(to: :done) do |order, transition|
    # TODO: add necessary logic here
  # end

  # after_transition(to: :done) do |order, transition|
    # TODO: add necessary logic here
    # MailerService.enquiry_confirmation(enquiry).deliver
  # end

  after_transition do |model, transition|
    model.state = transition.to_state
    model.save!
  end

end
