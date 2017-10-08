json.extract! request, :id, :comment, :status, :mail_requester, :created_at, :updated_at
json.url request_url(request, format: :json)
