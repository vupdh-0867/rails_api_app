class Api::V1::HomesController < Api::V1::BaseController
  def index
    render json: {
      success: true,
      data: {
      }
    }
  end
end
