RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true


  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model AeroPlan do
    create do
      field :name
      field :aero_plans_seat_configurations
    end
    edit do
      field :name
      field :aero_plans_seat_configurations
    end
    list do
      field :id
      field :name
      field :created_at
      field :aero_plans_seat_configurations
    end
  end

  config.model Flight do
    create do
    end
  end



  config.model SeatConfiguration do
    create do
      field :seat_type
      field :number_of_rows
      field :seats_in_rows
    end
    edit do
      field :seat_type
      field :number_of_rows
      field :seats_in_rows
    end
    list do
      field :id
      field :seat_type
      field :number_of_rows
      field :seats_in_rows
    end
  end
end
