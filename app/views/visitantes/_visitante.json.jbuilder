json.extract! visitante, :id, :nome, :email, :telefone, :created_at, :updated_at
json.url visitante_url(visitante, format: :json)
