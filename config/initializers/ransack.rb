Ransack.configure do |config|
  config.add_predicate 'lteq_end_of_day', # Name your predicate

    # What non-compound ARel predicate will it use? (eq, matches, etc)
    arel_predicate: 'lteq',

    # Format incoming values as you see fit. (Default: Don't do formatting)
    formatter: proc { |v| v.end_of_day }
end