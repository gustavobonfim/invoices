class PagesController < ApplicationController

  def home
    @invoice = Invoice.last
  end

  def test
    @invoice = Invoice.last
  end

  def new_invoices

    render json: Invoice.group_by_month(:created_at).sum(:amount)

  end

end
