require 'rails_helper'

RSpec.describe AuctionsController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  let(:auction) { FactoryGirl.create(:auction) }
  let(:bid) { FactoryGirl.create(:bid) }

  describe '#index' do
    subject { get :index }

    before { subject }

    context 'with no user signed in' do
      it 'renders index template' do
        expect(response).to render_template(:index)
      end
    end
    context 'with user signed in' do
      # This can be moved into the spec helpers
      before { request.session[:user_id] = user.id }

      it 'renders index template' do
        expect(response).to render_template(:index)
      end
    end
  end


  # describe '#show' do
  #   context 'with no user signed in' do
  #     it 'renders show template' do
  #       get :show
  #       expect(response).to render_template(:show)
  #     end
  #   end
  #   context 'with user signed in' do
  #     before {request.session[:user_id] = user.id}
  #     it 'renders show template' do
  #       get :show
  #       expect(response).to render_template(:show)
  #     end
  #   end
  # end # describe#show

  describe '#new' do
    subject { get :new }

    context 'with no user signed in' do
      it 'redirects to the sign in page' do
        expect(response).to redirect_to(new_session_path)
      end
    end

    context 'with user signed in' do
      before { request.session[:user_id] = user.id }

      it 'redirect_to new auction page' do
        expect(response).to render_template(:new)
      end
    end
  end # describe#new

  describe '#create' do
    subject { post :create }

    context 'with no user signed in' do
      it 'redirects to the sign in page' do
        expect(response).to redirect_to(new_session_path)
      end
    end
    # context 'with user signed in' do
    #   context 'with valid params' do
    #     def valid_request
    #       attributes = FactoryGirl.attributes_for(:auction).merge(user_id: user.id)
    #       post :create, params: { auction: attributes }
    #     end
    #     it 'creates a new auction' do
    #       count_before = Auction.count
    #       valid_request
    #       count_after = Auction.count
    #       expect(count_after).to eq(count_before + 1)
    #     end
    #   end
    # end

  end # describe#create

end
