module SessionsHelper
    def login(user)
        session[:user_id] = user.id
    end
    
    def current_user
        # if @current_user.nil?
        #     @current_user = User.find_by(id: session[:user_id])
        # else
        #     @current_user=@current_user
        # end
        
        #==>  @current_user = @current_user || User.find_by(id: session[:user_id])
       
        # ||= 이거는 왼쪽거가 nil값이면 오른쪽거를 넣는다는거
         @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
    
    #헬퍼 쓰는 이유? 이걸 다 html에 썼다간 낭비임
    #커런트유저에 저장해놓고 그걸가져가서쓰는게낫다
        
end
