class Enquiry::EnquiryStateMachine
  include Statesman::Machine

  state :new, initial: true
  state :done
  state :not_valid

  state :archived

  transition from: :new, to: [:done]
  transition from: :new, to: [:not_valid]

  transition from: :done, to: [:archived]
  transition from: :not_valid, to: [:archived]

  # guard_transition(to: :done) do |enquiry|
    # TODO: add necessary logic here
  # end

  before_transition(from: :new, to: :done) do |order, transition|
    # TODO: add necessary logic here
  end

  before_transition(to: :done) do |order, transition|
    # TODO: add necessary logic here
  end

  after_transition(to: :done) do |order, transition|
    # TODO: add necessary logic here
    # MailerService.enquiry_confirmation(enquiry).deliver
  end

  after_transition do |model, transition|
    model.state = transition.to_state
    model.save!
  end

end
