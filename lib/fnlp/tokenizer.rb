module FNLP
  import "org.fnlp.nlp.cn.CNFactory"

  class Tokenizer
    def initialize(models=nil)
      @tokenizer = CNFactory.getInstance(models || "#{HOME}/models")
    end

    def tokenize(string)
      return [] if empty?(string)

      words, tags = @tokenizer.tag(string)
      return [] if empty?(words)

      words.zip(tags).map do |word_tag|
        Token.new(*word_tag)
      end
    end

    private 
    def empty?(s)
      !s || (s.is_a?(String) && s.strip == "") || (s.is_a?(Array) && s.empty?)
    end
  end
end
