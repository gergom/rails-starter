json.extract! curso, :id, :titulo, :descripcion, :created_at, :updated_at
json.url curso_url(curso, format: :json)
