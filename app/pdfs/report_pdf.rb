class ReportPdf < Prawn::Document
  def initialize(visitantes)
    super()
    @visitantes = visitantes
    #header
    text_content
    table_content
  end

  def header
    #This inserts an image in the pdf file and sets the size of the image
    image "#{Rails.root}/app/assets/images/logo.png", width: 530, height: 150
  end

  def text_content
    # The cursor for inserting content starts on the top left of the page. Here we move it down a little to create more space between the text and the image inserted above
    y_position = cursor - 50

    # The bounding_box takes the x and y coordinates for positioning its content and some options to style it
    bounding_box([0, y_position], :width => 530, :height => 40) do
      text "Lista de visitantes", size: 15, style: :bold
    end

  end

  def table_content
    # This makes a call to product_rows and gets back an array of data that will populate the columns and rows of a table
    # I then included some styling to include a header and make its text bold. I made the row background colors alternate between grey and white
    # Then I set the table column widths
    table user_rows do
      row(0).font_style = :bold
      #self.header = true
      self.row_colors = ['DDDDDD', 'FFFFFF']
      self.column_widths = [150, 200, 100, 70]
    end
  end

  def user_rows
    [['Nome', 'Email', 'telefone', 'Data Cadastro']] +
      @visitantes.map do |visitante|
      [
        visitante.nome,
        visitante.email,
        visitante.telefone,
        visitante.created_at.strftime("%d/%m/%Y %H:%M"),
      ]
        
    end
  end
end