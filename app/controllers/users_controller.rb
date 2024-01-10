class UsersController < ApplicationController
    before_action :authenticate_user!
    # 모든 users 보는 액션
    def index
        @users = User.all
    end
    # 특정 user 페이지 액션
    def show
        @user = User.find(params[:id])
        flash[:notice] = "You are in user page "
    end

    def dismiss_flash
        flash[:notice] = nil
        head :ok # 이 부분은 단지 HTTP 상태 코드 200을 반환합니다.
    end
end