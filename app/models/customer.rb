class Customer < ApplicationRecord
  has_one_attached :image
  validates :full_name, presence: true
  validates :phone_number, presence: true
  validates :email_address, allow_blank: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  # Define searchable associations
  def self.ransackable_associations(auth_object = nil)
    [ "image_attachment", "image_blob" ] # Include any other associations you want to be searchable
  end

  # Allowlist attributes for searching
  def self.ransackable_attributes(auth_object = nil)
    [ "full_name", "phone_number", "email_address", "notes", "created_at", "updated_at" ]
  end
end
