class Admin::HghlandController <  ApplicationController
  layout 'admin'
  before_action :load_resource

  def load_resource
    class_name = controller_name.singularize.classify
    return unless class_exists?(class_name)
    scope = class_name.constantize
    if ['new', 'create'].include?(params[:action].to_s)
      resource = scope.new
    elsif params[:id]
      resource = scope.find(params[:id])
    else
      resource = nil
    end
    instance_variable_set("@#{controller_name.singularize}", resource)
  end

  def class_exists?(class_name)
    begin
      klass = Module.const_get(class_name)
      return klass.is_a?(Class)
    rescue Exception
      return false
    end
  end
end