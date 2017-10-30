class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]

  # GET /requests
  # GET /requests.json
  def index

    @levels = Level.all.order(:name)
    subjects = Subject.all.order(:name)
    modules = Section.all    
    @requests = Request.where(user_id: current_user.id).or(Request.where(utp_role_id: current_user.id))


    @results = Hash.new 

    @levels.each do |level|
      asd = Hash.new
      subjects.each do |subject|
        asdasd = []
        modules.each do |mod|
          if mod.level_id == level.id and mod.subject_id == subject.id 
            asdasd.append(mod)
          end
        end
        @requests.each do |request|
          if asdasd.include?(request.section) and request.status != "Rejected"
            asdasd.delete(request.section)
          end
        end
        if !asdasd.empty?
          asd[subject] = asdasd
        end
      end
      if !asd.empty?
        @results[level] = asd
      end
    end
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
  end

  # GET /requests/new
  def new
    @request = Request.new
    @section = Section.find(params[:format])
    if(!current_user.email.nil? or !current_user.email.empty?)
      @mail_requester = current_user.email
    elsif (!current_user.school.nil? or !current_user.school.empty?)
      @mail_requester = current_user.school.email
    else
      @mail_requester = nil
    end
    
  end

  # GET /requests/my_request
  def my_request
    @requests = current_user.requests
  end

  # GET /requests/1/edit
  def edit
    @section = @request.section
  end

  # POST /requests
  # POST /requests.json
  def create
    puts request_params
    @request = Request.new(request_params)
    @section = Section.find(request_params[:section_id])

    respond_to do |format|
      if @request.save
        format.html { redirect_to requests_path, notice: 'Solicitud enviada correctamente.' }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'Solicitud actualizada correctamente.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Solicitud eliminada correctamente.' }
      format.json { head :no_content }
    end
  end

  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:comment, :status, :mail_requester, :section_id, :user_id)
    end
end
