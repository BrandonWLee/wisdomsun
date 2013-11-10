class CategoryController < ApplicationController
	def getpage
		categoryNames = Category.all.map { |x| x.refactored_name }
		requestedCatName = params[:category_name]
		requestedPageName = params[:page_name]
		if (categoryNames != nil && categoryNames.include?( requestedCatName ))
			category = Category.find_by_refactored_name(requestedCatName)
			categoryid = category.id
			categoryPages = category.other_pagess.map { |x| x.refactored_title}
			if (categoryPages != nil && (not categoryPages.empty? ) && categoryPages.include?(requestedPageName))
				page = OtherPages.find_by_refactored_title_and_category_id(requestedPageName,categoryid)
				@title = page.title
				@htmlbody = page.body
				render 'index.html.haml'
				return
			end
		end
		flash[:notice] = "Invalid URL"
		redirect_to '/'
	end
end
