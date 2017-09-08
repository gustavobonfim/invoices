class PagesController < ApplicationController

  def home
    if current_user
      redirect_to invoices_path

    end
  end

  def test
    @invoice = Invoice.last
  end

  def new_invoices

    render json: Invoice.group_by_month(:created_at).sum(:amount)

  end

  private

end
