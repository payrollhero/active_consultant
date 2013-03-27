module ActiveConsultant
  class ActiveConsultantError < StandardError
  end

  class RecordInvalid < ActiveConsultantError
    def initialize(consultant)
      @consultant = consultant
      error_msg = @consultant.errors.full_messages.join(",")
      super(error_msg)
    end
  end
end
