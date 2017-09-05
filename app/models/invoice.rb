class Invoice < ApplicationRecord

  def self.delete_old
    @old_invoice = Invoice.where('date < ?', 30.days.ago)
    @old_invoice.delete_all
  end

  has_attached_file :image
  has_attached_file :resource

  validates_attachment :image, presence: true,
  content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
  message: "Only images allowed!"

  validates_attachment :resource, presence: true,
  content_type: { content_type: "application/pdf" },
  message: "Only PDF allowed!"
end
