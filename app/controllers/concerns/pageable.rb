# Usage: @first_collection_enumerable, @second_collection_enumerable = combo_page(Model.finder.association, Model.finder.second_association, page: 1)
module Pageable
	extend ActiveSupport::Concern

	def combo_page(first, second, page: 1)
    klass = first.new.class
    first_page = first.order(created_at: :desc).page(page)
    if first_page.count < klass.per_page && first_page.total_pages == page
      second_page = second.limit(klass.per_page - first_page.count) 
    elsif first_page.total_pages < page
      second_page = second.limit(klass.per_page).offset(page * klass.per_page - first_page.count)
    end
    return [first_page,second_page]
  end
end