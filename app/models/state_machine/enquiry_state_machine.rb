class EnquiryStateMachine
  include Statesman::Machine

  state :new, initial: true
  state :done

  transition from: :new, to: [:done]

  guard_transition(to: :done) do |enquiry|
    # TODO: add necessary logic here
  end

  before_transition(from: :new, to: :done) do |order, transition|
    # TODO: add necessary logic here
  end

  before_transition(to: :done) do |order, transition|
    # TODO: add necessary logic here
  end

  after_transition(to: :purchased) do |order, transition|
    # TODO: add necessary logic here
    # MailerService.enquiry_confirmation(enquiry).deliver
  end
end
