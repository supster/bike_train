class GroupsController < ApplicationController

	def index
    	@groups = Group.paginate(page: params[:page])
  	end

  	def new
  		@group = Group.new
  	end

  	def create
	    @group = Group.new(params[:group])
	    logger.info @group
	    logger.info 'Printing users'
	    logger.info current_user
	    @group.users << current_user
	    if @group.save
	      
	      flash[:success] = "Awesome, your a group owner!"
	      redirect_to @group
	    else
	      render "new"      
	    end
  	end
end
