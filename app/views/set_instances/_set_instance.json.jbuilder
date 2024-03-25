# frozen_string_literal: true

json.extract! set_instance, :id, :created_at, :updated_at
json.url set_instance_url(set_instance, format: :json)
