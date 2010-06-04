class Authentication::UnlocksController < Devise::UnlocksController

  ssl_required :index, :show, :new, :create, :edit, :update, :destroy if Rails.env.production? || Rails.env.staging?

end