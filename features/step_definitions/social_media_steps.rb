require "selenium-webdriver"

Then /there should be a (.*) Share link/ do |medium|
  within("a.addthis_button") do
    find("img").hover
    if medium == "Facebook"
#      page.should have_xpath("//a[id='atic_facebook']")
      page.html.should include("atic_facebook")
    elsif medium == "Twitter"
#      page.should have_xpath("//a[id='atic_twitter']")
      page.html.should include("atic_twitter")
    elsif medium == "Email"
#      page.should have_xpath("//a[id='atic_email']")
      page.html.should include("atic_email")
    end
  end
end
