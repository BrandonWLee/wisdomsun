Given /the following forem categories exist/ do |forem_categories_table|
  forem_categories_table.hashes.each do |category|
    Forem::Category.create!(category)
  end
end

Given /the following forums exist/ do |forem_forums_table|
  forem_forums_table.hashes.each do |forum|
    @category = Forem::Category.find_by_name(forum[:category_name])
    forum = Forem::Forum.new(:title => forum[:title], :description => forum[:description], :category_id => @category.id )
    forum.save!
  end
end

Given /the following topics exist/ do |forem_topics_table|
  forem_topics_table.hashes.each do |topic|
    @forum = Forem::Forum.find_by_name(topic[:forum_name])
    @post = Forem::Post.new text: "Wheee"
    user = User.find_by_email(topic[:user_name])
    puts user.email
    @post.user = user
    puts @post.text
    @topic = Forem::Topic.new subject: topic[:subject]#, :user_id => @user.id, :forum_id => @forum.id )
    puts @topic.subject
    @topic.forum = @forum
    @topic.user = user
    @topic.posts = [@post]
    @topic.save!
  end
end

Given /the following posts exist/ do |forem_posts_table|
#  forem_posts_table.hashes.each do |post|
#   user = User.find_by_email(post[:user_name])
#post = Forem::Post.new text: post[:text]
# end
end

Given /I am logged in as user/ do 
end
