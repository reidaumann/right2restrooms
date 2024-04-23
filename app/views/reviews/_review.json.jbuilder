# frozen_string_literal: true

json.extract! review, :id, :user_id, :bathroom_id, :body, :created_at, :updated_at
json.url review_url(review, format: :json)
