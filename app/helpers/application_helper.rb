module ApplicationHelper

  def active?(path)
    return "active" if request.path == path
  end
end
