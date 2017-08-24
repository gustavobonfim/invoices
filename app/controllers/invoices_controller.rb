class InvoicesController < ApplicationController

  def index
    @search = Invoice.ransack(params[:q])
    @invoices = @search.result
  end

  def search
    index
    render :index
  end

  def new
    @invoice = Invoice.new
  end

  def create
    @invoice = Invoice.new(invoices_params)
    if @invoice.save
      flash[:success] = "Invoice successfully created"
      redirect_to invoices_path
    else
      render 'new'
    end
  end

  def show
    @invoice = Invoice.find(params[:id])
  end

  def edit
    @invoice = Invoice.find(params[:id])
  end

  def update
    @invoice = Invoice.find(params[:id])
    if @invoice.update(invoices_params)
      flash[:success] = "Invoice successfully updated"
      redirect_to invoices_path
    else
      flash[:danger] = "Invoice was not updated"
      render 'edit'
    end
  end



  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy
    redirect_to invoices_path
  end

  private
  def invoices_params
    params.require(:invoice).permit(:amount, :company, :contragent, :currency, :date, :image, :resource)
  end
end
