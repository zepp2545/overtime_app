require 'rails_helper'

describe 'navigate' do
    before do
        @user = FactoryBot.create(:user)
        login_as(@user, :scope => :user)
        visit new_post_path
    end

    describe 'index' do
        before do
          visit posts_path
        end

        it 'can be reached' do
            expect(page.status_code).to eq(200)
        end

        it 'has a title of Posts' do
            expect(page).to have_content(/Posts/)
        end

        it 'has a list of Posts' do
            post1 = FactoryBot.build_stubbed(:post)
            post2 = FactoryBot.build_stubbed(:second_post)
            visit posts_path
            expect(page).to have_content(/Rationale|Content/)
        end
    end

    describe 'creation' do

        it 'has a new form that can be reached' do
            expect(page.status_code).to eq(200)
        end

        it 'can de created from new form page' do

            fill_in 'post[date]', with: Date.today
            fill_in 'post[rationale]', with: 'Some rationale'

            click_on 'Save'

            expect(page).to have_content('Some rationale')

        end

        it 'will have a user associated with post' do

            fill_in 'post[date]', with: Date.today
            fill_in 'post[rationale]', with: 'Some rationale'
            click_on 'Save'

            expect(User.last.posts.last.rationale).to eq('Some rationale')
        end


    end

end