enum GeneralOptionStateKind{
  LOADING, LOADED, ERROR
}

class GeneralOptionsState{
  final GeneralOptionStateKind kind;
  final List<String>           options;

  GeneralOptionsState._(this.kind, this.options);

  static GeneralOptionsState initial(){
    return GeneralOptionsState._(
        GeneralOptionStateKind.LOADED,
        ["ASIGNATURAS", "PROFESORES", "AULAS", "DEPARTAMENTOS", "CURSOS", "MARCO HORARIO"]);
  }
}