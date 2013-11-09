class CategoryController < ApplicationController
	def getpage
		categoryNames = Category.all.map { |x| x.name }
		requestedCatName = params[:category_name]
		requestedPageName = params[:page_name]
		if (categoryNames != nil && categoryNames.include?( requestedCatName ))
			category = Category.find_by_name(requestedCatName)
			categoryPages = category.other_pagess.map { |x| x.title}
			if (categoryPages != nil && (not categoryPages.empty? ) && categoryPages.include?(requestedPageName))
				page = OtherPages.find_by_title(requestedPageName)
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
