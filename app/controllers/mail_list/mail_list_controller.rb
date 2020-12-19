module MailList
  class MailListController < ::ApplicationController
    requires_plugin MailList

    before_action :ensure_logged_in

    def index
    end
  end
end
