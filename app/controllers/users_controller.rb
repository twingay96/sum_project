class UsersController < ApplicationController
    before_action :authenticate_user!
    # 모든 users 보는 액션
    def index
        #@users = User.all
        @pagy, @users = pagy(User.all.order(created_at: :desc))
        #binding.b
    end
    # 특정 user 페이지 액션
    def show
        @user = User.find(params[:id])
        unless session[:visit_userpage]
            flash.now[:in_userpage]="유저페이지 입니다."
            session[:visit_userpage]= true    
        end
    end
end