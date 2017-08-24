class Invoice < ApplicationRecord

  def self.delete_old
    @old_invoice = Invoice.where('date < ?', 30.days.ago)
    @old_invoice.delete_all
  end

  has_attached_file: image
  has_attached_file: resource
end
