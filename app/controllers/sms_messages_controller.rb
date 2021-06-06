require 'twilio-ruby'
require './environment'

class SmsMessagesController < ApplicationController
  def create
    client = Twilio::REST::Client.new(
      Rails.application.credentials[:ACCOUNT_SID],
      Rails.application.credentials[:AUTH_TOKEN]
    )

    client.messages.create(
      from: Rails.application.credentials[:TWILIO_NUMBER],
      to: sms_message_params['mobile_number'],
      body: sms_message_params['message']
    )
    render json: client
  end

  private

  def sms_message_params
    params.require(:sms_message).permit(:mobile_number, :message)
  end
end
