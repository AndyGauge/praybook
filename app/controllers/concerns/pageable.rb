# Usage: @first_collection_enumerable, @second_collection_enumerable = combo_page(Model.finder.association, Model.finder.second_association, page: 1)
module Pageable
  extend ActiveSupport::Concern

  def combo_page(first, second, page: 1)
    per_page = first.new.class.per_page
    first_page = first.order(created_at: :desc).page(page)
    if first_page.count < per_page && first_page.total_pages == page
      second_page = second.limit(per_page - first_page.count) 
    elsif first_page.total_pages < page
      second_page = second.limit(per_page).offset((page-1) * per_page - first.count )
    end
    return [first_page,second_page]
  end
end
