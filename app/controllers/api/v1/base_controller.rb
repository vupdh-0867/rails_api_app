class Api::V1::BaseController < ApplicationController
  include BaseConcern
  before_action :authenticate_user!
end
