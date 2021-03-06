# This is the base class from which all consultants must inherit.
# The base class is an abstract class and the child classes must implement a run and a run! method.
# These 2 methods will perform the task that the consultant is supposed to perform.
module ActiveConsultant
  class Base
    include Virtus
    include ActiveModel::Validations
    extend ActiveModel::Callbacks

    define_model_callbacks :work

    def work(options = {})
      run_callbacks :work do
        begin
          perform_validations(options) { run }
        rescue ActiveConsultant::RecordInvalid => ex
          $stdout.puts "The consultant could not perform the work because the following errors : " + ex.message
        end
      end
    end

    def run
      raise NotImplementedError
    end

    def work!(options = {})
      run_callbacks :work do
        perform_validations(options) { run! }
      end
    end

    def run!
      raise NotImplementedError
    end

    private

    def perform_validations(options = {})
      options.reverse_merge!(:validate => true)
      if options[:validate] && valid?
        yield if block_given?
      else
        raise ActiveConsultant::RecordInvalid.new(self)
      end
    end
  end
end
