FactoryBot.define do
    factory :post do
        date { Date.today }
        rationale { "Some Rationale" }
        user
    end

    factory :second_post, class: 'Post' do
        date { Date.yesterday }
        rationale { "Some more Content" }
        user
    end
       
end