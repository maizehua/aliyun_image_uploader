threads 4, 16
workers 1
environment 'production'
bind 'tcp://0.0.0.0:8080'
preload_app!

on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end
