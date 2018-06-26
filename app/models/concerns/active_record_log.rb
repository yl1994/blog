module ActiveRecordLog
  extend ActiveSupport::Concern

  def error_msg
    msg = "（"
    errors.messages.map do |k, v|
      cname = I18n.t("simple_form.labels.defaults.#{k}")
      cname = I18n.t("simple_form.labels.#{self.class.to_s.downcase}.#{k}") if cname.include?("translation missing")
      cname = "" if cname.include?("translation missing")
      msg += "#{cname}#{v.join('')} "
    end
    msg += "）"
  end
end
