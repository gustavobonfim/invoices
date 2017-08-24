class AddAttachmentImageToInvoices < ActiveRecord::Migration[5.1]
  def self.up
    change_table :invoices do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :invoices, :image
  end
end
