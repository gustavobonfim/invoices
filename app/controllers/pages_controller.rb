class PagesController < ApplicationController

  def home
    @invoice = Invoice.last
  end

  def test
    @invoice = Invoice.last
  end

end
