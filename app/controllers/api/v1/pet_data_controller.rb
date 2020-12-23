class Api::V1::PetDataController < ApplicationController

  def create 
    data = PetData.new(pet_data_params.merge(user: current_user))

    if data.save
      head :ok
    else
      render json: { error: data.errors.full.messages }
    end
  end

  def index
    collection = current_user.pet_data
    render json: { entires: collection }
  end

  private

  def pet_data_params
    params.require(:pet_data).permit!
  end
end