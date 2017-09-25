FactoryGirl.define do

  factory :message do
  	id     1
    text   "casa me casa"
    image Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/morocco.jpeg')))
    user_id 1
    group_id 1
  end
end
