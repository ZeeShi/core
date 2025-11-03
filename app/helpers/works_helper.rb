module WorksHelper
  def markdown(text)
    return "" if text.blank?

    require "redcarpet"

    renderer = Redcarpet::Render::HTML.new(
      hard_wrap: false,  # Don't convert line breaks to <br> - use proper paragraphs
      link_attributes: { target: "_blank", rel: "noopener" }
    )

    markdown = Redcarpet::Markdown.new(renderer,
      autolink: true,
      tables: true,
      fenced_code_blocks: true,
      strikethrough: true,
      superscript: true,
      space_after_headers: true  # Add space after headers
    )

    markdown.render(text).html_safe
  end
end
