FactoryGirl.define do

  factory :message do
    text   "casa me casa"
    image Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/morocco.jpeg')))
    user
    group
  end
end

