class ChartsController < ApplicationController

  def new_invoices_sum
    i = Invoice.group_by_month(:date).sum(:amount)
    render json: i
  end

  def new_invoices_count
    render json: Invoice.group_by_month(:date).count
  end

  def new_invoices_company
    render json: Invoice.pluck(:company).uniq.map{|c| {name: c, data: Invoice.where(company: c).group_by_day(:date).count}}
  end

  def new_invoices_sum_count
    sum = Invoice.group_by_month(:date).sum(:amount)
    count = Invoice.group_by_month(:date).count

    # chart = []
    # chart << {:name => "Faturamento", :data => sum}
    # chart << {:name => "# Recibos", :data => count}

    sum1 = Invoice.where(company: "MedCapital").group_by_month(:date).sum(:amount)
    sum2 = Invoice.where(company: "Company").group_by_month(:date).sum(:amount)

    chart = []
    chart << {:name => "Fat MedCapital R$", :data => sum1}
    chart << {:name => "Fat Company R$", :data => sum2}

    render :json => chart.map
  end


end
