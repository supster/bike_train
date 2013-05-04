class GroupsController < ApplicationController

	def index
    	@groups = Group.paginate(page: params[:page])
    	@new_group = Group.new
  	end

  	def new
  		@group = Group.new
  	end

  	def create
	    @group = Group.new(params[:new_group])
	    @user = current_user
	    if @group.save
	      flash[:success] = "Awesome, your a group owner!"
	      redirect_to @group
	    else
	      render "new"      
	    end
  	end
end
