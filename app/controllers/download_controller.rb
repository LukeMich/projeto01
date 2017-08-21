class DownloadController < ActionController::Base
    before_action :authenticate_user!
    
    def index
        @visitantes = Visitante.find_by_sql ["SELECT * FROM visitantes ORDER BY nome ASC"]
    
        respond_to do |format|
          format.pdf do
            pdf = ReportPdf.new(@visitantes)
            send_data pdf.render, filename: 'Relação de visitantes.pdf', type: 'application/pdf'
          end
          
          format.xlsx do
            render xlsx: 'download',filename: "Relação de visitantes.xlsx"
          end
        end
    end
end