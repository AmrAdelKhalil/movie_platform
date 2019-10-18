class NewsesController < ApplicationController
  def index
    @news = NewsServices::List.call
    respond_to do |format|
      format.json { render json: @news, status: :ok }
    end
  end
end
