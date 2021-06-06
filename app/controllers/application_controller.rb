class ApplicationController < ActionController::Base
  before_action :authenticate_admin!

  def favoritos_atuais
    if session[:favoritos_id]
      @favoritos = Favorito.find(session[:favoritos_id])
    else
      @favoritos = Favorito.create
      session[:favoritos_id] = @favoritos.id
    end
    @favoritos
  end
end
