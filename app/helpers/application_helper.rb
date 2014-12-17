module ApplicationHelper

def page_title
	# if there is already content stored in :title, show it with 'EatSeeker'
	if content_for?(:title)
		content_tag(:title, "EatSeeker - #{content_for(:title)}")
	else
		content_tag(:title, "EatSeeker")
	end
end

# (title) takes the @object.attr and plops it in
# instead of writing <% content_for(:title, @user.name) %>, you can write <% title(@user.name) %>
def title(title)
  content_for(:title, title)
end

end
