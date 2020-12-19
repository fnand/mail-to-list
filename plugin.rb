# frozen_string_literal: true

# name: MailList
# about: To add functionality to send a mail to a mailing list when a new post/topic is created in a specific category
# version: 0.1
# authors: fnand
# url: https://github.com/fnand

register_asset 'stylesheets/common/mail-list.scss'
register_asset 'stylesheets/desktop/mail-list.scss', :desktop
register_asset 'stylesheets/mobile/mail-list.scss', :mobile


require_relative 'mailing_list_mailer'

enabled_site_setting :mail_list_enabled

PLUGIN_NAME ||= 'MailList'

load File.expand_path('lib/mail-list/engine.rb', __dir__)

after_initialize do

  class ListMailer < ActionMailer::Base
    def.self.mail_list(entry)
      # I'm not sure how to access the address, but it is sctored as 
      # email_in under category: https://github.com/discourse/discourse/blob/a0bbc346cb5d5b89d1a3efdfa89869349a8b067f/spec/fabricators/category_fabricator.rb#L35  	    
      address = entry.category.email_in
    end

    def.self.mail_staged(entry)
      entry.post.users do |address|
        # Is this line really neccessary? 
        if address != SiteSetting.pop3_polling_username do
          user = User.find_by_email(address)
	  if user.staged do
	    
          end
        end
      end
    end
  end

    # If a new topic is created, mail the relevant mailing list
  DiscourseEvent.on(:topic_created) do |entry|
    if entry.category.mailinglist_mirror
      ::ListMailer.mail_list(entry)
    end
  end

  # If a new post is created, mail the relevant mailing list as well as all staged users who are involved
  DiscourseEvent.on(:post_created) do |entry|
    if entry.category.mailinglist_mirror
      ::ListMailer.mail_list(entry)
      ::ListMailer.mail_staged(entry)
    end
  end
end
