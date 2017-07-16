FactoryGirl.define do
  factory :message do
    body {Faker::Lorem.sentence}
    user
    group
    image {
       ActionDispatch::Http::UploadedFile.new(
         :tempfile => File.new(Rails.root.join("spec/fixtures/files/test.png")),
         :filename => File.basename(File.new(Rails.root.join("spec/fixtures/files/test.png")))
    )
  }
  end
end

