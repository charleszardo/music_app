include ERB::Util

module TracksHelper
  def ugly_lyrics(lyrics)
    formatted_lyrics = ""
    lyrics.lines.each do |line|
      formatted_lyrics += "&#9835; #{line}"
    end
    "<pre>#{formatted_lyrics}</pre>".html_safe
  end
end
