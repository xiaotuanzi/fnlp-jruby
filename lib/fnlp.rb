require "fnlp/version"

module FNLP
  class Error < StandardError; end
  class HomeUndefined < Error; end
  class InvalidHome < Error; end

  HOME = ENV['FNLP_HOME']

  raise HomeUndefined, "FNLP_HOME is not defined." unless HOME

  fnlp_core = Dir.glob("#{HOME}/fnlp-core/target/fnlp-core-*-SNAPSHOT.jar").sort.last
  trove4j = Dir.glob("#{HOME}/libs/trove4j-*.jar").sort.last
  raise InvalidHome, "FNLP_HOME is not home." unless fnlp_core

  $CLASSPATH << [ fnlp_core, trove4j ]

  SYSTEM_VERSION = File.basename(fnlp_core).scan(/\d[\d\.]+/).sort.last
end

require "fnlp/token.rb"
require "fnlp/tokenizer.rb"
