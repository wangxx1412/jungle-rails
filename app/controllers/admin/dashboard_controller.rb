class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["NAME"], password: ENV["PASSWORD"]

  def show
    fetch_data
  end

  private
    def fetch_data
      @product_count = Product.all.count()
      @category_count = Category.all.count()
    end
end
