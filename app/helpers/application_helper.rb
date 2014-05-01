module ApplicationHelper

  ## RENDER AVATAR IMAGE FOR PROFILE PAGE (DEFAULT or USER)
  def render_profile_avatar_for(user)
    if user.avatar?
      image_tag(user.avatar.profile.url, class: 'media-object thumbnail').html_safe
    else
      image_tag('fallback/default.gif', height: '230px', width: '230px', class: 'media-object thumbnail').html_safe
    end
  end
  ## RENDER AVATAR IMAGE FOR NAVIGATION (DEFAULT or USER)
  def render_tiny_avatar_for(user)
    if user.avatar?
      image_tag(user.avatar.tiny.url).html_safe
    else
      image_tag('fallback/default.gif', height: '35px', width: '35px').html_safe
    end
  end

  ## REDNER AVATARS FOR ANSWERS SECTION
  def render_answer_avatar_for(user)
    if user.avatar?
      image_tag(user.avatar.tiny.url, class: 'media-object tiny-thumbnail').html_safe
    else
      image_tag('fallback/default.gif', height: '30px', width: '30px', class: 'media-object tiny-thumbnail').html_safe
    end
  end
## RENDER AVATAR IMAGE FOR RELATED POSTS LISTS
  def render_super_tiny_avatar_for(user)
    if user.avatar?
      image_tag(user.avatar.small.url, class: 'media-object thumbnail').html_safe
    else
      image_tag('fallback/default.gif', height: '35px', width: '35px', class: 'media-object thumbnail').html_safe
    end
  end

  ## RENDER AVATAR FOR ABOUT COMMENT SECTION
  def render_comment_avatar_for(comment_user)
    if comment_user.avatar?
      image_tag(comment_user.avatar.profile.url, class: "media-object thumbnail").html_safe
    else
      image_tag('fallback/default.gif', height: '55px', width: '55px', class: 'media-object thumbnail').html_safe
    end
  end

## RENDER AVATAR FOR ABOUT AUTHOR SECTION
  def render_author_avatar_for(post_user)
    if post_user.avatar?
      image_tag(post_user.avatar.url, class: "media-object thumbnail").html_safe
    else
      image_tag('fallback/default.gif', height: '150px', width: '150px', class: 'media-object thumbnail').html_safe
    end
  end
## RENDER TINY AVATAR FOR INDEX PAGES
  def render_tiny_author_avatar_for(post_user)
    if post_user.avatar?
      image_tag(post_user.avatar.tiny.url).html_safe
    else
      image_tag('fallback/default.gif', height: '20px', width: '20px').html_safe
    end
  end
## RENDER SMALL POST IMAGE FOR AUTHOR POSTS
  def render_small_post_image_for(post)
    if post.image?
      image_tag(post.image_thumb.url, class: 'media-object thumbnail')
    else
      image_tag('fallback/default_image.jpg', class: 'media-object thumbnail', height: '50px', width: '75px')
    end
  end
end
