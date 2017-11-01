require Rails.root.join('lib', 'rails_admin', 'review_request.rb')
require Rails.root.join('lib', 'rails_admin', 'reject_request.rb')

RailsAdmin::Config::Actions.register(RailsAdmin::Config::Actions::ReviewRequest)
RailsAdmin::Config::Actions.register(RailsAdmin::Config::Actions::RejectRequest)

RailsAdmin.config do |config|
  ### Popular gems integration

  # == Devise ==
   config.authenticate_with do
     warden.authenticate! scope: :user
   end
   config.current_user_method(&:current_user)

   config.main_app_name = ["HolSense", " Gestor Interno"]
  #Agregar enlaces bajo los modelos
  #config.navigation_static_links = {
  #  'Google' => 'http://www.google.com'
  #}

  ## == Cancan ==
  config.model 'Colegio' do 
    navigation_label 'Colegio related'
    weight -1 
  end
  config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    #Agregar funcion review_request
    review_request

    #Agregar funcion reject_request
    reject_request

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model 'Level' do
    label 'Curso' # Change the label of this model class
    label_plural 'Cursos'
    navigation_icon 'icon-bookmark  ' #icono en la barra lateral
    field :name do
      label 'Nombre' # Change the label of this field
    end
    field :description do
      label 'Descripción' # Change the label of this field
    end
    object_label_method do
      :custom_label_method
    end
  end

  Level.class_eval do
    def custom_label_method
      "#{self.name}"
    end
  end

  config.model 'School' do
    #configure :avatar, :jcrop
    label 'Colegio' # Change the label of this model class
    label_plural 'Colegios'
    navigation_icon 'icon-home' #icono en la barra lateral
    field :name do
      label 'Nombre' # Change the label of this field
    end
    field :description do
      label 'Descripción' # Change the label of this field
    end
    field :phone do
      label 'Teléfono' # Change the label of this field
    end
    field :direction do
      label 'Dirección' # Change the label of this field
    end
    field :email do
      label 'Correo electrónico' # Change the label of this field
    end
    field :avatar, :paperclip do
      label 'Imagen de colegio'
     # jcrop_options aspectRatio: 140.00/90.0
     # fit_image true
      delete_method :delete_avatar
    end
    object_label_method do
      :custom_label_method
    end

  end

  School.class_eval do
    def custom_label_method
      "#{self.name}"
    end
  end

  config.model 'User' do
    label 'Usuario' # Change the label of this model class
    label_plural 'Usuarios'
    navigation_icon 'icon-user  ' #icono en la barra lateral
    field :nickname do
      label 'Nombre' # Change the label of this field
    end
    field :email do
      label 'Correo electrónico' # Change the label of this field
    end
    field :password do
      label 'Contraseña' # Change the label of this field
    end  
    field :password_confirmation do
      label 'Confirmación de contraseña' # Change the label of this field
    end
    field :reset_password_sent_at do
      label 'Cambio de contraseña' # Change the label of this field
    end
    field :last_sign_in_at do
      label 'Última conexión' # Change the label of this field
    end
    field :superadmin_role do
      label 'Gestor Interno' # Change the label of this field
    end
    field :utp_role do
      label 'Coordinador UTP' # Change the label of this field
    end
    field :teacher_role do
      label 'Profesor' # Change the label of this field
    end
    field :school do
      label 'Colegio' # Change the label of this field
    end
    field :avatar, :paperclip do
      label 'Imagen de perfil'
     # jcrop_options aspectRatio: 140.00/90.0
     # fit_image true
      delete_method :delete_avatar
    end
    object_label_method do
      :custom_label_method
    end
  end

  User.class_eval do
    def custom_label_method
      "#{self.nickname}"
    end
  end

  config.model 'Subject' do
    label 'Asignatura' # Change the label of this model class
    label_plural 'Asignaturas'
    navigation_icon 'icon-book  ' #icono en la barra lateral
    field :name do
      label 'Nombre' # Change the label of this field
    end
    field :description do
      label 'Descripción' # Change the label of this field
    end
    object_label_method do
      :custom_label_method
    end
  end

  Subject.class_eval do
    def custom_label_method
      "#{self.name}"
    end
  end

  config.model 'Section' do
    label 'Módulo' # Change the label of this model class
    label_plural 'Módulos'
    navigation_icon 'icon-folder-open  ' #icono en la barra lateral
    field :name do
      label 'Nombre' # Change the label of this field
    end
    field :description do
      label 'Descripción' # Change the label of this field
    end
    field :subject do
      label 'Asignatura' # Change the label of this field
    end

    field :level do
      label 'Curso' # Change the label of this field
    end
    object_label_method do
      :custom_label_method
    end
  end

  Section.class_eval do
    def custom_label_method
      "#{self.name}"
    end
  end

  config.model 'Request' do
    label 'Solicitud' # Change the label of this model class
    label_plural 'Solicitudes'
    navigation_icon 'icon-list-alt  ' #icono en la barra lateral
    field :status do
      label 'Estado' # Change the label of this field
    end
    field :comment do
      label 'Comentario' # Change the label of this field
    end
    field :section do
      label 'Módulo' # Change the label of this field
    end
    field :user do
      label 'Usuario' # Change the label of this field
    end
    field :mail_requester do
      label 'Email del responsable' # Change the label of this field
    end

    #field :review_request do
      #label 'Acciones'
      #formatted_value{ bindings[:object].call_some_method }
    #end
    
    #field :reject_request do
      #label 'Rechazar'
    #end

    object_label_method do
      :custom_label_method
    end
  end

  Request.class_eval do
    def custom_label_method
      "#{self.id}"
    end

    #def call_some_method
      #Review_request
    #end
  end

  config.model 'Image' do
    label 'Contenido' # Change the label of this model class
    label_plural 'Contenidos'
    navigation_icon 'icon-picture  ' #icono en la barra lateral
    field :name do
      label 'Nombre' # Change the label of this field
    end
    field :description do
      label 'Descripción' # Change the label of this field
    end
    field :clock do
      label 'Giro derecha' # Change the label of this field
    end
    field :content_content_type do
      label 'Tipo de imagen' # Change the label of this field
    end
    field :content, :paperclip do
      label 'Imagen GIF'
     # jcrop_options aspectRatio: 140.00/90.0
     # fit_image true
     # delete_method :delete_content
    end
    field :sections do
      label 'Módulos asociadas' # Change the label of this field
    end
    object_label_method do
      :custom_label_method
    end
  end

  Image.class_eval do
    def custom_label_method
      "#{self.name}"
    end
  end
end
