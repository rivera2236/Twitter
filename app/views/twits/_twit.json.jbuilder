json.extract! twit, :id, :message, :user_id, :created_at, :updated_at
json.url twit_url(twit, format: :json)
