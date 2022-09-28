module QuestionsHelper
  def question_author(question)
    if question.author
      link_to display_nickname(question.author), user_path(question.author)
    else
      content_tag :i, 'Аноним'
    end
  end

  def text_with_hashtag_link(text)
    strip_tags(text).gsub(Hashtag::REGEXP) do |ht|
      link_to ht, hashtag_path(ht.delete('#').downcase)
    end
  end
end
