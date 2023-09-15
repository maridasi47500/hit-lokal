ActiveRecord::ConnectionAdapters::AbstractAdapter.class_eval do
  alias_method :orig_initialize, :initialize

  # Extend database initialization to add our own functions
  def initialize(connection, logger = nil, pool = nil)
    orig_initialize(connection, logger, pool)

    # Initializer for SQLite3 databases
    if connection.is_a? SQLite3::Database
      # Set up function to provide SQLite REGEXP support
      connection.create_function('parameterize', 1) do |fn, expr|
        # Ignore case in our regex expressions
        matcher = expr.force_encoding('utf-8').parameterize
        # Return 1 if expression matches our regex, 0 otherwise
        fn.result = matcher
      end
    end
  end
end
