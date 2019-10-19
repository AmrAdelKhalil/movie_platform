RailsAdmin.config do |config|

  config.authenticate_with do
    redirect_to main_app.unauthenticated_root_path unless current_user.try(:admin?)
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  config.actions do
    dashboard
    index
    new do
      except ['Celebrity']
    end
    export
    bulk_delete
    show
    edit do
      except ['Celebrity']
    end
    delete
    show_in_app
  end

  config.model 'Actor' do
    list do
      configure :type do
        hide
      end
    end
    create do
      configure :type do
        hide
      end
    end
    edit do
      configure :type do
        hide
      end
    end
  end

  config.model 'Director' do
    list do
      configure :type do
        hide
      end
    end
    create do
      configure :type do
        hide
      end
    end
    edit do
      configure :type do
        hide
      end
    end
  end

  config.model 'Movie' do
    list do
      configure :ratings do
        hide
      end
    end
    create do
      configure :ratings do
        hide
      end
      configure :rated_by do
        hide
      end
    end
    edit do
      configure :ratings do
        hide
      end
      configure :rated_by do
        read_only true
      end
      configure :watchlisted_by do
        read_only true
      end
    end
  end

  config.model 'User' do
    list do
      configure :reset_password_sent_at do
        hide
      end
      configure :remember_created_at do
        hide
      end
      configure :reset_password_token do
        hide
      end
      configure :admin do
        hide
      end
      configure :encrypted_password do
        hide
      end
      configure :ratings do
        hide
      end
    end
    create do
      configure :reset_password_sent_at do
        hide
      end
      configure :remember_created_at do
        hide
      end
      configure :reset_password_token do
        hide
      end
      configure :admin do
        hide
      end
      configure :ratings do
        hide
      end
      configure :provider do
        hide
      end
      configure :uid do
        hide
      end
    end
    edit do
      configure :reset_password_sent_at do
        hide
      end
      configure :remember_created_at do
        hide
      end
      configure :reset_password_token do
        hide
      end
      configure :admin do
        hide
      end
      configure :ratings do
        hide
      end
      configure :provider do
        hide
      end
      configure :uid do
        hide
      end
    end
  end
end
