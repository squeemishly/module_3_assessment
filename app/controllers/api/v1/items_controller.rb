class Api::V1::ItemsController < ApplicationController
  skip_before_action :protect_from_forgery
  protect_from_forgery with: :null_session

  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end
end
