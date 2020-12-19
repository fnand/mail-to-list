module MailList
  class Engine < ::Rails::Engine
    engine_name "MailList".freeze
    isolate_namespace MailList

    config.after_initialize do
      Discourse::Application.routes.append do
        mount ::MailList::Engine, at: "/mail-list"
      end
    end
  end
end
