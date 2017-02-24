class EnquiriesController < ApplicationController

  def create
    @enquiry = Enquiry.new(enquiry_params)
    if @enquiry.save
      render status: :ok, nothing: true
    else
      render status: :unprocessable_entity, json: { errors: @enquiry.errors.full_messages }
    end
  end

  private

  def enquiry_params
    params.permit(:name, :email, :message)
  end

end