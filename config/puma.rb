# This configuration file will be evaluated by Puma. The top-level methods that are invoked here are part of Puma's 
# configuration DSL. For more information about methods provided by the DSL, see https://puma.io/puma/Puma/DSL.html.

# Puma starts a configurable number of processes (workers) and each process serves each request in a thread from an 
# internal thread pool.
#
# The ideal number of threads per worker depends both on how much time the application spends waiting for IO operations 
# and on how much you wish to to prioritize throughput over latency.
#
# As a rule of thumb, increasing the number of threads will increase how much traffic a given process can handle 
# (throughput), but due to CRuby's Global VM Lock (GVL) it has diminishing returns and will degrade the response time 
# (latency) of the application.
#
# The default is set to 3 threads as it's deemed a decent compromise between throughput and latency for the average Rails 
# application.
#
# Any libraries that use a connection pool or another resource pool should be configured to provide at least as many 
# connections as the number of threads. This includes Active Record's `pool` parameter in `database.yml`.

# Threads
max_threads = Integer(ENV.fetch("RAILS_MAX_THREADS", 5))
min_threads = Integer(ENV.fetch("RAILS_MIN_THREADS", max_threads))
threads min_threads, max_threads

# Workers (processes)
workers Integer(ENV.fetch("WEB_CONCURRENCY", 2))

# Puerto y entorno (Heroku setea PORT y RAILS_ENV=production)
port        Integer(ENV.fetch("PORT", 3000))
environment ENV.fetch("RAILS_ENV", "production")

# Arranque más rápido y menor RAM por worker
preload_app!

# Reconectar DB por worker (muy importante en Heroku)
on_worker_boot do
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
end

# Permitir restart con bin/rails restart (opcional)
plugin :tmp_restart

# PID opcional si lo usas
pidfile ENV["PIDFILE"] if ENV["PIDFILE"]
