FactoryGirl.define do
  factory :message do
     body "aaa"
     group_id 1
     user_id 1
     image {
       ActionDispatch::Http::UploadedFile.new(
         :tempfile => File.new(Rails.root.join("spec/fixtures/files/test.png")),
         :filename => File.basename(File.new(Rails.root.join("spec/fixtures/files/test.png")))
    )
  }
  end
end






