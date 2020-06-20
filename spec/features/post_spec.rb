require 'rails_helper'

describe 'navigate' do
    before do
        user = User.create(email: 'zepp25458565@gmail.com', password: 'km25458565', password_confirmation: 'km25458565', first_name: 'Akio', last_name: 'Maruyo')
        login_as(user, :scope => :user)
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
            post1 = Post.create(date: Date.today, rationale: 'post1')
            post2 = Post.create(date: Date.today, rationale: 'post2')
            visit posts_path
            expect(page).to have_content(/post1|post2/)
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