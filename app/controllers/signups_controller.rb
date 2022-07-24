class SignupsController < ApplicationController

  def create
    signup = Signup.create!(allowed_params)
    render json: signup.activity, status: :created 
  rescue ActiveRecord::RecordInvalid => e
    render json: { errors: e.record.errors.full_messages}, status: :unprocessable_entity
  end

  private

  def allowed_params
    params.permit(:time, :camper_id, :activity_id)
  end
end
