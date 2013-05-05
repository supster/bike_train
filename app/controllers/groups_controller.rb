class GroupsController < ApplicationController

	def index
    	@groups = Group.paginate(page: params[:page])
    	respond_to do |format|
      		format.html 
      		format.json { render json: @groups }
    	end
  	end

  	def new
  		@group = Group.new
  		@origin_address = Address.new
  		@destination_address = Address.new
  		@group.users.build
  		@group.groupMemberships.build

  		respond_to do |format|
      		format.html 
      		format.json { render json: @group }
    	end
  	end

  	def create
	    @group = Group.new(params[:group])
	   	
	   	@origin_address = Address.create(params[:origin_address])
		@destination_address = Address.create(params[:destination_address])

	    @group.origin_address_id = @origin_address.id
	    @group.destination_address_id = @destination_address.id

=begin
	    if @group.save
	      
	      flash[:success] = "Awesome, your a group owner!"
	      redirect_to @group
	    else
	      render "new"      
	    end
=end

	    respond_to do |format|
	    	if @group.save
		        format.html { redirect_to @group, notice: 'Group was successfully created.' }
		        format.json { render json: @group, status: :created, location: @group }
		    else
		        format.html { render action: "new" }
		        format.json { render json: @group.errors, status: :unprocessable_entity }
		    end
	    end
  	end

  	def show
   		@group = Group.find(params[:id])
 		@origin_address = Address.find(14)
  		@destination_address = Address.find(15)

  		respond_to do |format|
	      format.html # show.html.erb
	      format.json { render :json => {:group => @group,
	      									:origin_address => @origin_address,
	      									:destination_address => @destination_address}
	      								}
	    end
  	end
end
