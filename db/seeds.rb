School.create!([
  {name: "Colegio El Carmen Teresiano", direction: "Avda Principe de Gales 8050, La Reina", description: "", phone: 224068550, email: "secretaria@carmenteresiano-lareina.cl", avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {name: "San Alberto Hurtado", direction: "Los Mares 8576, Pudahuel", description: "Colegio perteneciente a la Fundación Belén Educa.", phone: 997859922, email: "csah@beleneduca.cl", avatar_file_name: "foto_6.jpg", avatar_content_type: "image/jpeg", avatar_file_size: 96915, avatar_updated_at: "2017-10-12 00:32:12"}
])
User.create!([
  {email: "contactokaivo@gmail.com", password: "kaivoteam",password_confirmation: "kaivoteam", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 26, current_sign_in_at: "2017-10-29 15:42:23", last_sign_in_at: "2017-10-29 15:41:31", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", nickname: "gestorholsense", superadmin_role: true, utp_role: false, teacher_role: true, school_id: 1, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil},
  {email: "coordinaciongeneral@carmenteresiano-lareina.cl", password: "coordinador", password_confirmation: "coordinador", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 6, current_sign_in_at: "2017-10-29 15:41:48", last_sign_in_at: "2017-10-12 19:04:25", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "10.6.40.107", nickname: "coordinador_carmen", superadmin_role: false, utp_role: true, teacher_role: false, school_id: 1, avatar_file_name: nil, avatar_content_type: nil, avatar_file_size: nil, avatar_updated_at: nil}
])

Level.create!([
  {name: "Primero Medio", description: "Enseñanza Media"},
  {name: "Tercero Medio", description: "Enseñanza Media"},
  {name: "Segundo medio", description: "Enseñanza Media"}
])
Subject.create!([
  {name: "Biología", description: "Ciencias que estudia la estructura de los seres vivos y sus procesos vitales"},
  {name: "Física", description: "Ciencia que estudia las propiedades y el comportamiento de la energía, materia, tiempo, espacio y otros."},
  {name: "Quimica", description: "Ciencia que estudia la composición y las propiedades de la materia y de las transformaciones que esta experimenta sin que se alteren los elementos que la forman."},
  {name: "Tecnología", description: "Conjunto de instrumentos, recursos técnicos o procedimientos empleados en un determinado campo o sector."}
])
Section.create!([
  {name: "Sistema Nervioso", description: "Estudio del sistema nervioso central", level_id: 2, subject_id: 1},
  {name: "Sistema Circulatorio", description: "Sistema encargado de transportar el oxígeno y nutrientes a las células y eliminar sus desechos metabólicos.", level_id: 1, subject_id: 1},
  {name: "Planetas", description: "Distintos cuerpos celestes orbitan alrededor de una estrella o remanente de ella, tiene suficiente masa para que su gravedad supere las fuerzas del cuerpo rígido, de manera que asuma una forma en equilibrio hidrostático (prácticamente esférica), ha limpiado la vecindad de su órbita de planetesimales, o lo que es lo mismo tiene dominancia orbital, no emite una luz propia.\r\n", level_id: 2, subject_id: 2},
  {name: "Moléculas", description: "Grupo eléctricamente neutro y suficientemente estable de al menos dos átomos en una configuración definida, unidos por enlaces químicos fuertes", level_id: 2, subject_id: 3},
  {name: "Dispositivos a Motores", description: "La parte sistemática de una máquina capaz de hacer funcionar el sistema, transformando algún tipo de energía, en energía mecánica capaz de realizar un trabajo", level_id: 1, subject_id: 4},
  {name: "Cuerpo Humano", description: "Es la estructura física y material del ser humano.\r\n\r\n", level_id: 3, subject_id: 1},
  {name: "Célula", description: "Unidad morfológica y funcional de todo ser vivo. De hecho, la célula es el elemento de menor tamaño que puede considerarse vivo", level_id: 3, subject_id: 1}
])
Image.create!([
  {name: "Corazon", description: "Corazon con venas y arterias", clock: true, content_file_name: "corazon.gif", content_content_type: "image/gif", content_file_size: 1564324, content_updated_at: "2017-10-11 21:20:02"},
  {name: "Corazon Detalle", description: "El corazón transparente donde se visualiza su interior, sus aortas, las válvulas y las arterias.", clock: true, content_file_name: "corazon_detalle.gif", content_content_type: "image/gif", content_file_size: 3019936, content_updated_at: "2017-10-11 21:30:14"},
  {name: "Cerebro ", description: "La estructura anatómica del cerebro en conjunto con la médula espinal y las arterias.", clock: true, content_file_name: "cerebro_venas.gif", content_content_type: "image/gif", content_file_size: 5109803, content_updated_at: "2017-10-12 00:28:10"},
  {name: "Craneo Transparente y Cerebro", description: "Craneo transparente para poder visualizar la cavidad en conjunto con el cerebro.", clock: true, content_file_name: "craneo2.gif", content_content_type: "image/gif", content_file_size: 5149316, content_updated_at: "2017-10-12 00:34:56"},
  {name: "Médula", description: "Médula espinal en conjunto con los huesos de la columna.", clock: true, content_file_name: "medula.gif", content_content_type: "image/gif", content_file_size: 3443098, content_updated_at: "2017-10-12 00:42:02"},
  {name: "Jupiter", description: "Es el quinto planeta del sistema solar. Forma parte de los denominados planetas exteriores o gaseosos.", clock: true, content_file_name: "jupiter.gif", content_content_type: "image/gif", content_file_size: 5393743, content_updated_at: "2017-10-12 00:44:20"},
  {name: "Mercurio", description: "Es el planeta del sistema solar más próximo al Sol y el más pequeño. Forma parte de los denominados planetas interiores o terrestres y carece de satélites al igual que Venus.", clock: false, content_file_name: "mercurio.gif", content_content_type: "image/gif", content_file_size: 700403, content_updated_at: "2017-10-12 00:45:39"},
  {name: "Neptuno", description: "Es el octavo planeta en distancia respecto al Sol y el más lejano del sistema solar. Forma parte de los denominados planetas exteriores o gigantes gaseosos, y es el primero que fue descubierto gracias a predicciones matemáticas.", clock: true, content_file_name: "neptuno.gif", content_content_type: "image/gif", content_file_size: 196842, content_updated_at: "2017-10-12 00:46:48"},
  {name: "Tierra", description: "Es un planeta del sistema solar que gira en la tercera órbita más interna. Es el más denso y el quinto mayor de los ocho planetas del sistema solar.", clock: true, content_file_name: "tierra2.gif", content_content_type: "image/gif", content_file_size: 764805, content_updated_at: "2017-10-12 00:49:46"},
  {name: "Sol", description: "Es una estrella que se encuentra en el centro del sistema solar y constituye la mayor fuente de radiación electromagnética de este sistema planetario", clock: true, content_file_name: "sol1.gif", content_content_type: "image/gif", content_file_size: 378812, content_updated_at: "2017-10-12 00:54:15"},
  {name: "Moléculas", description: "Moléculas para observar formaciones", clock: true, content_file_name: "algo.gif", content_content_type: "image/gif", content_file_size: 67844, content_updated_at: "2017-10-20 23:07:12"},
  {name: "Vehículo 1", description: "Vehículo blanco", clock: false, content_file_name: "auto1.gif", content_content_type: "image/gif", content_file_size: 3474754, content_updated_at: "2017-10-20 23:12:12"},
  {name: "Vehículo 2", description: "Vehículo azul", clock: false, content_file_name: "auto2.gif", content_content_type: "image/gif", content_file_size: 3793395, content_updated_at: "2017-10-20 23:12:36"},
  {name: "Vehículo 3", description: "Vehículo gris", clock: false, content_file_name: "auto3.gif", content_content_type: "image/gif", content_file_size: 3826274, content_updated_at: "2017-10-20 23:13:03"},
  {name: "Vehículo 4", description: "Vehículo verde", clock: false, content_file_name: "auto4.gif", content_content_type: "image/gif", content_file_size: 3767801, content_updated_at: "2017-10-20 23:13:21"},
  {name: "Vehículo 5", description: "Vehículo rojo", clock: false, content_file_name: "auto5.gif", content_content_type: "image/gif", content_file_size: 3601657, content_updated_at: "2017-10-20 23:13:40"},
  {name: "Avión", description: "Avioneta similar a un biplane", clock: false, content_file_name: "avion1.gif", content_content_type: "image/gif", content_file_size: 27509, content_updated_at: "2017-10-20 23:14:42"},
  {name: "ADN", description: "ADN Largo", clock: true, content_file_name: "dna1.gif", content_content_type: "image/gif", content_file_size: 1008570, content_updated_at: "2017-10-20 23:15:54"},
  {name: "ADN 2", description: "ADN largo en mayor calidad", clock: true, content_file_name: "dna2.gif", content_content_type: "image/gif", content_file_size: 2403436, content_updated_at: "2017-10-20 23:18:04"},
  {name: "Molecula grande", description: "Molecula grande con sus enlaces", clock: true, content_file_name: "molecula2.gif", content_content_type: "image/gif", content_file_size: 1257950, content_updated_at: "2017-10-20 23:18:58"},
  {name: "Urano", description: "Es el séptimo planeta del sistema solar, el tercero de mayor tamaño, y el cuarto más masivo. No fue catalogado como planeta por los astrónomos de la antigüedad debido a su escasa luminosidad y a la lentitud de su órbita", clock: false, content_file_name: "urano.gif", content_content_type: "image/gif", content_file_size: 16919, content_updated_at: "2017-10-20 23:20:51"},
  {name: "Planeta Y", description: "Planeta Y...", clock: true, content_file_name: "planetay.gif", content_content_type: "image/gif", content_file_size: 1893379, content_updated_at: "2017-10-20 23:25:17"},
  {name: "Cuerpo Humano", description: "Cuerpo humano con piel transparente para mirar su interior", clock: true, content_file_name: "cuerpo_humano.gif", content_content_type: "image/gif", content_file_size: 2807803, content_updated_at: "2017-10-20 23:27:10"},
  {name: "Pecho", description: "Estructura del pecho", clock: true, content_file_name: "pecho.gif", content_content_type: "image/gif", content_file_size: 6326174, content_updated_at: "2017-10-20 23:27:57"},
  {name: "Pecho transparente", description: "Estructura del pecho transparente para ver su interior", clock: true, content_file_name: "pecho_Corazon.gif", content_content_type: "image/gif", content_file_size: 7259161, content_updated_at: "2017-10-20 23:28:30"},
  {name: "Radiografia", description: "Radiografía cuerpo humano", clock: true, content_file_name: "radiografia_cuerpo.gif", content_content_type: "image/gif", content_file_size: 648844, content_updated_at: "2017-10-20 23:29:18"},
  {name: "Venas de corazon", description: "Todas las arterias y venas del corazon", clock: true, content_file_name: "corazon_venas.gif", content_content_type: "image/gif", content_file_size: 3179289, content_updated_at: "2017-10-20 23:30:19"},
  {name: "Craneo", description: "Mitad del craneo con ojos", clock: true, content_file_name: "craneo.gif", content_content_type: "image/gif", content_file_size: 2089200, content_updated_at: "2017-10-20 23:31:14"},
  {name: "Cloroplasto", description: "Son los orgánulos celulares que en los organismos eucariotas fotosintetizadores se ocupan de la fotosíntesis", clock: false, content_file_name: "cloroplasto.gif", content_content_type: "image/gif", content_file_size: 53388, content_updated_at: "2017-10-20 23:33:26"},
  {name: "Celula 1", description: "Celula girando", clock: false, content_file_name: "celula.gif", content_content_type: "image/gif", content_file_size: 487827, content_updated_at: "2017-10-20 23:33:53"},
  {name: "Nucleo", description: "Nucleo girando", clock: false, content_file_name: "nucleo.gif", content_content_type: "image/gif", content_file_size: 173923, content_updated_at: "2017-10-20 23:35:21"},
  {name: "Ribosoma", description: "Son complejos macromoleculares de proteínas y ácido ribonucleico (ARN) presentes en todas las células (excepto en los espermatozoides). Son los centros celulares de traducción que hacen posible la expresión de los genes. ", clock: false, content_file_name: "ribosoma.gif", content_content_type: "image/gif", content_file_size: 54532, content_updated_at: "2017-10-20 23:36:41"},
  {name: "Sol azul", description: "Sol en longitud de onda azul", clock: true, content_file_name: "sol2.gif", content_content_type: "image/gif", content_file_size: 281091, content_updated_at: "2017-10-20 23:38:05"},
  {name: "Centriolos", description: "Es un orgánulo con estructura cilíndrica, constituido por 9 tripletes de microtúbulos, que forma parte del citoesqueleto. Una pareja de centríolos posicionados perpendicularmente entre sí y localizada en el interior de una célula se denomina diplosoma.", clock: true, content_file_name: "centroiles.gif", content_content_type: "image/gif", content_file_size: 31300, content_updated_at: "2017-10-20 23:39:37"}
])

#probar con 
#User.first.roles << Role.first

#volver a hacer el match y pushear
Image.find(1).sections << Section.find(2)
Image.find(2).sections << Section.find(2)
Image.find(3).sections << Section.find(1)
Image.find(3).sections << Section.find(6)
Image.find(4).sections << Section.find(1)
Image.find(4).sections << Section.find(6)
Image.find(5).sections << Section.find(1)
Image.find(6).sections << Section.find(3)
Image.find(7).sections << Section.find(3)
Image.find(8).sections << Section.find(3)
Image.find(9).sections << Section.find(3)
Image.find(10).sections << Section.find(3)
Image.find(11).sections << Section.find(4)
Image.find(12).sections << Section.find(5)
Image.find(13).sections << Section.find(5)
Image.find(14).sections << Section.find(5)
Image.find(15).sections << Section.find(5)
Image.find(16).sections << Section.find(5)
Image.find(17).sections << Section.find(5)
Image.find(18).sections << Section.find(4)
Image.find(19).sections << Section.find(4)
Image.find(20).sections << Section.find(4)
Image.find(21).sections << Section.find(3)
Image.find(22).sections << Section.find(3)
Image.find(23).sections << Section.find(6)
Image.find(24).sections << Section.find(6)
Image.find(25).sections << Section.find(6)
Image.find(26).sections << Section.find(6)
Image.find(27).sections << Section.find(2)
Image.find(28).sections << Section.find(1)
Image.find(28).sections << Section.find(6)
Image.find(29).sections << Section.find(4)
Image.find(30).sections << Section.find(7)
Image.find(31).sections << Section.find(7)
Image.find(32).sections << Section.find(7)
Image.find(33).sections << Section.find(3)
Image.find(34).sections << Section.find(7)
Image.find(34).sections << Section.find(4)