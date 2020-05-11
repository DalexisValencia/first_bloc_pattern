abstract class FormsEvents {}

class SetName extends FormsEvents {
  final String name;
  SetName({this.name});
}

class SetEmail extends FormsEvents {
  final String email;
  SetEmail({this.email});
}