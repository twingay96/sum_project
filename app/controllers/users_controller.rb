class UsersController < ApplicationController
    before_action :authenticate_user!
    # 모든 users 보는 액션
    def index
        #@users = User.all
        @q = User.order(created_at: :desc).ransack(params[:q])
        @pagy, @users = pagy(@q.result(distinct: true))
        #@pagy, @users = pagy(User.all.order(created_at: :desc), steps: { 0=>3, 1=>[3,5,5,3], 720=> [5,7,7,5] })

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