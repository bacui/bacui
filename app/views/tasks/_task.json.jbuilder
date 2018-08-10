json.extract! task, :id, :title, :description, :starts_at, :ends_at, :num_reviewed_artifacts, :include_self_review, :archived, :created_at, :updated_at
json.url task_url(task, format: :json)
