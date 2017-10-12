class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  after_action :save_my_previous_url, only: [:new]
  
  # GET /images
  # GET /images.json
  def index
    @images = Image.all
  end

  # GET /images/1
  # GET /images/1.json
  def show
    #nombre de la imagen obtenida del catalogo
    print "Nombre: "
    nombre_imagen = @image.content.to_s.split("?")[0].split("/")[-1].split(".")[0]
    #nombre_imagen = @image.name
    giro_derecha = @image.clock.to_s
    pwd= Rails.root.to_s
    imagenes_folder = pwd+"/lib/assets/codigo_python/imagenes/"
    reset_folder = pwd+'/lib/assets/codigo_python/'

    # Ubuntu
    require 'os'

    #En win
    if OS.windows?  #=> true or false
      job1 = Process.spawn("python lib/assets/codigo_python/leer_leapmotion.py "+nombre_imagen+" "+giro_derecha+" "+imagenes_folder+" "+reset_folder)
      job2 = Process.spawn("python lib/assets/codigo_python/checkeo_imagen.py "+pwd)
      job3 = Process.spawn("python lib/assets/codigo_python/vista_imagen.py "+pwd)
    else 
      job1 = fork do
        exec("python lib/assets/codigo_python/leer_leapmotion.py "+nombre_imagen+" "+giro_derecha+" "+imagenes_folder+ " "+reset_folder) #genera imagenes
       #para ejecutar es necesario "nombre de imagen + carpeta de imagenes + giro gif"
      end

      job2 = fork do 
        exec("python lib/assets/codigo_python/checkeo_imagen.py "+pwd) #actualiza imagenes en una ventana
        #necesito argumentos de job1 y job2
      end

      job3 = fork do 
        exec("python lib/assets/codigo_python/vista_imagen.py "+pwd) #actualiza imagenes en una ventana
      end
    end

    #Process.detach(job1)
    #Process.detach(job2)
    #Process.detach(job3)
  end

  # GET /images/new
  def new
    @image = Image.new
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images
  # POST /images.json
  def create
    @image = Image.new(image_params)

    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: 'Image was successfully created.' }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { render :show, status: :ok, location: @image }
      else
        format.html { render :edit }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url, notice: 'Image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /images/clean
  def clean
    nombre_archivo = 'reset.txt'
    ruta_creacion = "lib/assets/codigo_python/" + nombre_archivo
    filename = Rails.root.join(ruta_creacion)
    File.open(filename, 'wb') do |file|
      file << "Este archivo se originó por un movimiento reset"
    end

    sleep 3
  end

  def stop
    print "la url atras es: "
    print session[:my_previous_url]
    #redirect_back(fallback_location: root_path)
    #stop all jobs
    #Delayed::Job.all.each do |job|
    #  job.delete
    #end

    #redirect_to /images/caca
  end

  def save_my_previous_url
    # session[:previous_url] is a Rails built-in variable to save last url.
    session[:my_previous_url] = URI(request.referer || '').path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:name, :description, :clock)
    end
end
