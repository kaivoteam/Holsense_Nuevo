RailsAdmin.config do |config|
  ### Popular gems integration

  # == Devise ==
   config.authenticate_with do
     warden.authenticate! scope: :user
   end
   config.current_user_method(&:current_user)

   config.main_app_name = ["HolSense", "Gestor interno"]
  #Agregar enlaces bajo los modelos
  #config.navigation_static_links = {
  #  'Google' => 'http://www.google.com'
  #}

  ## == Cancan ==
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

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model 'Level' do
    label 'Curso' # Change the label of this model class
    label_plural 'Cursos'
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
    navigation_icon 'icon-user' #icono en la barra lateral
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
      label 'Gestor interno' # Change the label of this field
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
    field :name do
      label 'Nombre' # Change the label of this field
    end
    field :description do
      label 'Descripción' # Change the label of this field
    end
    field :subject do
      label 'Asignatura' # Change the label of this field
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
    field :status do
      label 'Estado' # Change the label of this field
    end
    field :comment do
      label 'Comentario' # Change the label of this field
    end
    field :section do
      label 'Modulo' # Change the label of this field
    end
    field :user do
      label 'Usuario' # Change the label of this field
    end
    object_label_method do
      :custom_label_method
    end
  end

  Request.class_eval do
    def custom_label_method
      "#{self.id}"
    end
  end
end
