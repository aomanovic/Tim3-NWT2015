module Domain
  module Decorators
    class AddWrapping
      def initialize content, user
        @content = content
        @symptoms = user.symptoms.map {|s| s.name}
        @diagnoses = user.diagnoses.map {|s| s.name}
      end

      def decorate
        {
          content: @content,
          symptoms: @symptoms,
          diagnoses: @diagnoses
        }
      end
    end
  end
end