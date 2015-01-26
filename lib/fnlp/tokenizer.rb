module FNLP
  import "org.fnlp.nlp.cn.CNFactory"

  class Tokenizer
    def initialize
      @factory = CNFactory.getInstance("#{HOME}/models")
    end

    def tokenize(string)
      words, tags = @factory.tag(string)
      words.zip(tags).map do |word_tag|
        Token.new(*word_tag)
      end
    end
  end
end
