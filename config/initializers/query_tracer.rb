unless Rails.env.production?
  ActiveRecordQueryTrace.enabled = true
  ActiveRecordQueryTrace.colorize = 'light purple'
end
