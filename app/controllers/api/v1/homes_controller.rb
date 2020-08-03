class Api::V1::HomesController < ApplicationController
  def index
    render json: {
      success: true,
      data: {
      }
    }
  end
end
