class Authentication::InvitationsController < Devise::InvitationsController
  
  ssl_required :index, :show, :new, :create, :edit, :update, :destroy if Rails.env.production? || Rails.env.staging?  
  
end