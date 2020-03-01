module ApplicationHelper
  def controller?(*controller)
    controller.include?(params[:controller].to_sym)
  end

  def action?(*action)
    action.include?(params[:action].to_sym)
  end

  def active_class(controller, action)
    return 'active' if controller?(controller) && action?(action)
  end
end
