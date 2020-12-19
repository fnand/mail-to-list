require 'email'
require 'email/build_email_helper'

class NewEventMailer < ActionMailer::Base

  def send_email(template, to_address, target_username, topic)
    if target_username.nil?
      build_email(
        to_address,
        template: template,
        topic: topic
      )
    else
      build_email(
        to_address,
        template: template,
        target_username: target_username,
        topic: topic
      )
    end
  end
end

