require './spec/support/fixtures'
require 'active_fedora/cleaner'

class Loader
  include Fixtures
end

desc "Load sample objects"
task load_examples: :environment do
  ActiveFedora::Cleaner.clean!
  Loader.new.load_examples
end
