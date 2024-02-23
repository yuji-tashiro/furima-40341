class ItemsController < ApplicationController
  def index
    
  end

  def new

  end

  def create

  end

  private

  def message_params
    params.require(:item).permit(:image).merge()
  end
  
end
