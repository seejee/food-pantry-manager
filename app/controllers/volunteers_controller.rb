# -*- encoding : utf-8 -*-
class VolunteersController < ApplicationController
  expose(:volunteer)
  expose(:volunteers)

  def create
    if volunteer.save
      redirect_to volunteer, notice: 'Volunteer was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    if volunteer.save
      redirect_to volunteer, notice: 'Volunteer was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    volunteer.destroy

    redirect_to volunteers_url
  end

  def sign_in
    volunteer.sign_in

    redirect_to time_clock_path
  end

  def sign_out
    volunteer.sign_out

    redirect_to time_clock_path
  end

  private

  def allowable
    [ 
      :city, :email, :first_name, :last_name, :phone, :state,
      :status, :street, :zip
    ]
  end

  def volunteer_params 
    params.require(:volunteer).permit(*allowable)
  end
end
