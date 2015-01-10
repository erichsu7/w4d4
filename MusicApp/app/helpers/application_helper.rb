module ApplicationHelper

  def ugly_lyrics(lyrics)
    formatted_lyrics = ""
    lyrics.lines.each do |line|
      formatted_lyrics << "&#9835; #{h(line)}"
    end

    "<pre>#{formatted_lyrics}</pre>".html_safe
  end

  def include_form_auth_token
    "<input
      type=\"hidden\"
      name=\"authenticity_token\"
      value=\"#{ form_authenticity_token }\">".html_safe
  end
end
