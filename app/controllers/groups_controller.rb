class GroupsController < ApplicationController

	def index
    	@groups = Group.paginate(page: params[:page])
  	end

  	def new
  		@group = Group.new
  		@origin_address = Address.new
  		@destination_address = Address.new
  		@group.users.build
  		@group.groupMemberships.build
  	end

  	def create
	    @group = Group.new(params[:group])

	    logger.info @group
	    logger.info 'Printing users'
	    logger.info current_user
	    #@group.users << User.find(current_user.id)
	   	
	   	@origin_address = Address.create(params[:origin_address])
		@destination_address = Address.create(params[:destination_address])

	    @group.origin_address_id = @origin_address.id
	    @group.destination_address_id = @destination_address.id

	    if @group.save
	      
	      flash[:success] = "Awesome, your a group owner!"
	      redirect_to @group
	    else
	      render "new"      
	    end
  	end

  	def show
   		@group = Group.find(params[:id])
 		@origin_address = Address.find(@group.origin_address_id)
  		@destination_address = Address.find(@group.destination_address_id)
  	end
end
