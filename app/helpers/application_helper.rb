module ApplicationHelper
  def render_title
    prefix = ENV['APPLICATION_NAME']
    if defined?(@title)
      "#{prefix }: #{title}"
    else
      prefix
    end
  end
end
