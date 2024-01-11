class UsersController < ApplicationController
    before_action :authenticate_user!
    # 모든 users 보는 액션
    def index
        @users = User.all
    end
    # 특정 user 페이지 액션
    def show
        @user = User.find(params[:id])
        unless session[:visit_userpage]
            flash.now[:in_userpage]="유저페이지 입니다."
            session[:visit__userpage]= true    
        end
    end

    def dismiss_flash
        flash[:notice] = nil
        head :ok # 이 부분은 단지 HTTP 상태 코드 200을 반환합니다.
    end
end