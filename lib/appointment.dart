class Appointment {
  String firstname;
  String name;
  DateTime date;
  bool isUrgent = false;

  Appointment(this.firstname, this.name, this.date, this.isUrgent);

  // Named constructor
  Appointment.withDate(this.date)
      : firstname = '',
        name = '';
}
