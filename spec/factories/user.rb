FactoryGirl.define do
	factory :user do
		admin false
	end
	factory :admin do
		admin true
	end
end
