FactoryBot.define do
  factory :enquiry do
    website "carsforsale"

    after(:create) do |enquiry, _|
      enquiry.file.attach(io: File.open(Rails.root.join('public/carsforsale-1.html')), filename: 'carsforsale-1.jpg')
    end
  end
end
