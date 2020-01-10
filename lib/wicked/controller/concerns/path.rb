module Wicked::Controller::Concerns::Path
  extend ActiveSupport::Concern

  def next_wizard_path(options = {})
    wizard_path(@next_step, options)
  end

  def previous_wizard_path(options = {})
    wizard_path(@previous_step, options)
  end

  def wicked_controller
    params[:controller]
  end

  # NOTE: Implement dinamic action.
  def wicked_action
    params[:action]
  end

  def wizard_path(goto_step = nil, options = {})
    options = options.respond_to?(:to_h) ? options.to_h : options
    options = { :controller => wicked_controller,
                :action     => 'purchase',
                :id         => goto_step || params[:id],
                :only_path  => true
               }.merge options
    url_for(options)
  end
end
