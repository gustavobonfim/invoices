class AddAttachmentResourceToInvoices < ActiveRecord::Migration[5.1]
  def self.up
    change_table :invoices do |t|
      t.attachment :resource
    end
  end

  def self.down
    remove_attachment :invoices, :resource
  end
end
