class ClassProvider {
  late List<Map<String, dynamic>> _clases;

  static final ClassProvider _inst = ClassProvider._privado();

  ClassProvider._privado() {
    _clases = [];
  }
  factory ClassProvider() {
    return _inst;
  }
  List<Map<String, dynamic>> get clases {
    return _clases;
  }

  //metodo que recibe una nueva tarea a travez del formulario
  void agregarClase(Map<String, dynamic> nuevaClase) {
    //listado de clases que recibe la nueva tarea
    _clases.add(nuevaClase);
  }
}
