class Authentication::SessionsController < Devise::SessionsController

  ssl_required :index, :show, :new, :create, :edit, :update, :destroy if Rails.env.production?

end