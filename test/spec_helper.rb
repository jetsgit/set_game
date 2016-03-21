require File.expand_path('../../lib/card', __FILE__)
require File.expand_path('../../lib/deck', __FILE__)
require File.expand_path('../../lib/play_set', __FILE__)

require "minitest/autorun"
require "minitest/spec"

class FeatureSpec < MiniTest::Spec
   register_spec_type(/model$/, self)
end