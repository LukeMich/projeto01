class AdminController < ApplicationController
    before_action :authenticate_user!
    
    def controle
        @Visitantes = Visitante.all
    end
end
