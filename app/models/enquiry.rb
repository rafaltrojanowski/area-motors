class Enquiry < ApplicationRecord

  SOURCES = %w(AMDirect CarsForSale)

  include Statesman::Adapters::ActiveRecordQueries

  has_one_attached :file

  has_many :transitions, class_name: "EnquiryTransition", autosave: false

  enum state: [:pending, :done, :not_valid, :archived]

  scope :active, -> { where.not(state: Enquiry.states[:archived]) }

  def file_path
    ActiveStorage::Blob.service.send(:path_for, file.blob.key)
  end

  def self.create_from!(path)
    website = if path.include?('amdirect')
      'amdirect'
    elsif path.include?('carsforsale')
      'carsforsale'
    end

    filename = path.split('/').last

    record = self.create!(website: website)
    record.file.attach(
      io: File.open(path),
      filename: filename
    )
    record
  end

  def state_machine
    @state_machine ||= Enquiry::EnquiryStateMachine.new(self,
                                               transition_class: EnquiryTransition,
                                               association_name: :transitions
                                              )
  end

  delegate :can_transition_to?, :transition_to!, :transition_to, :current_state,
    to: :state_machine

  def self.transition_class
    EnquiryTransition
  end

  def self.initial_state
    :new
  end
  private_class_method :initial_state
end
