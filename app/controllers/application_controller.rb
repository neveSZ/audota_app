# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_admin!

  def current_favorites
    if session[:favorites_id]
      begin
        favorites = Favorite.find(session[:favorites_id])
      rescue ActiveRecord::RecordNotFound => e
        favorites = Favorite.create
        session[:favorites_id] = favorites.id
      end
    else
      favorites = Favorite.create
      session[:favorites_id] = favorites.id
    end
    favorites
  end
end
