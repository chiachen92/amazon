class ContactController < ApplicationController

  def contact
  end

  def thanks
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
  end

end
