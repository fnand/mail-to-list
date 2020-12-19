require_dependency "mail_list_constraint"

MailList::Engine.routes.draw do
  get "/" => "mail_list#index", constraints: MailListConstraint.new
  get "/actions" => "actions#index", constraints: MailListConstraint.new
  get "/actions/:id" => "actions#show", constraints: MailListConstraint.new
end
