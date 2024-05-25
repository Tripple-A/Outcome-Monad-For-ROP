# typed: true

require 'zeitwerk'
require 'sorbet-runtime'

loader = Zeitwerk::Loader.for_gem
loader.push_dir(__dir__)
loader.push_dir('app/outcome')
loader.push_dir('app/lunch')
loader.setup
Zeitwerk::Loader.for_gem(warn_on_extra_files: false)
