RailsAdmin.config do |config|
  config.authorize_with do
    authenticate_or_request_with_http_basic('Site Message') do |username, password|
      username == 'admin' && password == 'admin'
    end
  end

  config.main_app_name { ['MyGolf', 'Admin'] }

   config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    history_show
    show_in_app
  end

  config.model Game do

  end
  config.model Golfer do

  end
  config.model ScoreByHole do

  end
  config.model Hole do

  end
  config.model Score do

  end
  config.model Stage do

  end

end