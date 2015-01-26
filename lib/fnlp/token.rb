module FNLP
  class Token
    def initialize(word, tag)
      @word, @tag = word, tag
    end

    def to_s
      "%s/%s" % [ @word, @tag ]
    end

    def inspect
      "%s => %s" % [ @word, @tag ]
    end
  end
end
