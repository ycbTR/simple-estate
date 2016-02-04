module ApplicationHelper

  def wishlist_link(property)
    if property.wished_by?(@current_user.try(:id))
      link_to unwish_property_path(property), data: {remote: true, method: :put} do
        content_tag(:i, '', class: 'glyphicon glyphicon-star') +
            " Remove from Wish List"
      end
    else
      link_to wish_property_path(property), data: {remote: true, method: :put} do
        content_tag(:i, '', class: 'glyphicon glyphicon-star-empty') +
            " Add to Wish List"
      end
    end
  end
end
