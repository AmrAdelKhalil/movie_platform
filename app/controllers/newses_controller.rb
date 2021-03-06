class NewsesController < ApplicationController
  def index
    @news = NewsServices::List.call
    respond_to do |format|
      format.json { render json: @news, status: :ok }
    end
  end

  def search
    @newses = NewsServices::Filter.call(filter_params)
    respond_to do |format|
      format.js
    end
  end

  private

  def filter_params
    params.permit(:by_description)
  end
end
