module HashtagsHelper
  def text_with_hashtag_link(text)
    text.gsub(Hashtag::HASHTAG_REGEX) do |tag|
      link_to tag, hashtag_path(tag.delete('#').downcase)
    end.html_safe
  end
end
