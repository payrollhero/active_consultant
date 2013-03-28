# This file contains all the error classes for this gem
module ActiveConsultant
  # The base error class for this gem
  class ActiveConsultantError < StandardError
  end

  # This kind of error gets raised when a consultant is not valid.
  class RecordInvalid < ActiveConsultantError
    def initialize(consultant)
      @consultant = consultant
      error_msg = @consultant.errors.full_messages.join(",")
      super(error_msg)
    end
  end
end
