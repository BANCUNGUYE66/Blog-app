Rails.application.routes.draw do
  get '/recede_historical_location', to: 'navigation#recede'
  get '/resume_historical_location', to: 'navigation#resume'
  get '/refresh_historical_location', to: 'navigation#refresh'
  post '/rails/action_mailbox/mailgun/inbound_emails/mime', to: 'action_mailbox/ingresses/mailgun/inbound_emails#create'
end
