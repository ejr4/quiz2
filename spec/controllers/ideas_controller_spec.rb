require 'rails_helper'

RSpec.describe IdeasController, type: :controller do

    let(:user) { FactoryBot.create :user }
    let(:idea) { FactoryBot.create(:idea, user: user) }


    describe("#new") do
        context "with no user signed in" do
            #1
            it "redirects to the sign in page" do
            get :new

            expect(response).to redirect_to new_session_path
            end

        end

        context "with user signed in" do
            #2
      
            it "renders the new template" do
            session[:user_id] = user.id
            get :new
        
            expect(response).to render_template(:new)
            end
  
        end
    end

    describe ("#create") do
    
        def valid_request
        post :create, params: {
            idea: FactoryBot.attributes_for(:idea)
        }
        end

        
        context "with no user signed-in" do
        #3
            it "redirects to the sign in page" do
                valid_request

                expect(response).to redirect_to new_session_path
            end
        end

        context "with user signed-in" do
            before do
            session[:user_id] = user.id
            end

     
        
            #4
            it "creates a new idea in the db" do
           
                count_before = Idea.count
                valid_request
                
                count_after = Idea.count
                expect(count_after).to eq(count_before + 1)
            end
            #5
            it "redirects to the show page of that idea" do
                valid_request
                
                expect(response).to redirect_to(idea_path(Idea.last))
            end
                       
            #6
            it "associates the job post with the signed in user" do
                valid_request

                expect(Idea.last.user).to eq(user)
            end
        end  
    end
end
