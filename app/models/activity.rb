class Activity < ActiveRecord::Base
  belongs_to :user
  has_attached_file :avatar,
                    storage: :s3,
                      s3_credentials: {access_key_id: "", secret_access_key: ""},
                    bucket: ""
  do_not_validate_attachment_file_type :avatar


end
