require 'spec_helper'

describe CategoryController do
	it "getpage should return to the correct page" do
		category = mock('category1')
		category.stub(:name).and_return('testcategory')
		page = mock('page')
		page.stub(:title).and_return('testpage')
		page.stub(:body).and_return("lalalal lelelele lalalala")
		category.stub(:other_pagess).and_return([page])
		Category.stub(:all).and_return([category])
		Category.stub(:find_by_name).and_return(category)
		OtherPages.stub(:find_by_title).and_return(page)
		get :getpage, :category_name => 'testcategory', :page_name => 'testpage'
		response.should render_template('category/index.html')
	end
	it "getpage should return to the front page if bad url" do
		category = mock('category1')
		category.stub(:name).and_return('testcategory')
		page = mock('page')
		page.stub(:title).and_return('testpage')
		page.stub(:body).and_return("lalalal lelelele lalalala")
		category.stub(:other_pagess).and_return([page])
		Category.stub(:all).and_return([category])
		Category.stub(:find_by_name).and_return(category)
		OtherPages.stub(:find_by_title).and_return(page)
		get :getpage, :category_name => 'testcategory3', :page_name => 'testpage3'
		response.should redirect_to("/")
	end
end