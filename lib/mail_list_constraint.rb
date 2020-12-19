class MailListConstraint
  def matches?(request)
    SiteSetting.mail_list_enabled
  end
end
