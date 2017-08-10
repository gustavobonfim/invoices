class Invoice < ApplicationRecord

  def self.delete_old
    @old_invoice = Invoice.where('date < ?', 30.days.ago)
    @old_invoice.delete_all
  end
end
