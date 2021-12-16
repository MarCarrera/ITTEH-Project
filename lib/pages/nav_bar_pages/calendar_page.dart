// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../constans.dart';
import 'components/event.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late Map<DateTime, List<Event>> selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  final TextEditingController _eventController = TextEditingController();

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 46),
              color: Colors.transparent,
              child: const Text(
                'Calendario Escolar',
                style: TextStyle(
                  color: kDefaultColorBlue,
                  fontSize: 20,
                ),
              ),
            ),
            TableCalendar(
              focusedDay: selectedDay,
              firstDay: DateTime(1990),
              lastDay: DateTime(2050),
              calendarFormat: format,
              onFormatChanged: (CalendarFormat _format) {
                setState(() {
                  format = _format;
                });
              },
              startingDayOfWeek: StartingDayOfWeek.sunday,
              daysOfWeekVisible: true,

              //Day Changed
              onDaySelected: (DateTime selectDay, DateTime focusDay) {
                setState(() {
                  selectedDay = selectDay;
                  focusedDay = focusDay;
                });
                print(focusedDay);
              },
              selectedDayPredicate: (DateTime date) {
                return isSameDay(selectedDay, date);
              },

              eventLoader: _getEventsfromDay,

//---------------------------------COMIENZA ESTILO DE CALENDARIO-----------------------------------//
              calendarStyle: const CalendarStyle(
                isTodayHighlighted: true,
                selectedDecoration: BoxDecoration(
                  color: kDefaultColorGrey,
                  shape: BoxShape.circle,
                ),
                selectedTextStyle: TextStyle(color: Colors.white),
                todayDecoration: BoxDecoration(
                  color: kDefaultColorBlue,
                  shape: BoxShape.circle,
                ),
                defaultDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                weekendDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
              ),
              headerStyle: HeaderStyle(
                formatButtonVisible: true,
                titleCentered: true,
                formatButtonShowsNext: false,
                formatButtonDecoration: BoxDecoration(
                  color: kDefaultColorBlue,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                formatButtonTextStyle: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
//-------------------------------------------Comienza llamado de la tarjeta de evento-----------------------//
            ..._getEventsfromDay(selectedDay).map(
              (Event event) => _NewEvent(event),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Próximo evento"),
            content: TextFormField(
              controller: _eventController,
            ),
            actions: [
              TextButton(
                child: const Text("Cancelar"),
                onPressed: () => Navigator.pop(context),
              ),
              TextButton(
                child: const Text("Ok"),
                onPressed: () {
                  if (_eventController.text.isEmpty) {
                  } else {
                    if (selectedEvents[selectedDay] != null) {
                      selectedEvents[selectedDay]!.add(
                        Event(title: _eventController.text),
                      );
                    } else {
                      selectedEvents[selectedDay] = [
                        Event(title: _eventController.text),
                      ];
                    }
                  }
                  Navigator.pop(context);
                  _eventController.clear();
                  setState(() {});
                  return;
                },
              ),
            ],
          ),
        ),
        label: const Text("Evento"),
        icon: const Icon(Icons.add),
        backgroundColor: kDefaultColorBlue,
      ),
    );
  }

//----------------------------------------VENTANA EMERGENTE DE EVENTO----------------------------------------//
  // ignore: non_constant_identifier_names
  _NewEvent(Event event) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        // este contenedor se usa de FONDO para colocar los demas widgets
        height: 80.0,
        margin: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: kDefaultColorVino),
        // aqui se ocupa Stack para lograr el diseno de las TARJETAS DE INFORMACION
        child: Stack(
          children: [
            //todo ------------ Informacion ---------------------//
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: const EdgeInsets.only(left: 25.0, top: 20.0),
                child: Text(
                  event.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
            // todo ------------- boton ------------------//
            // se uso Align para colocar el BOTON centrado en la parte baja
            Align(
              //alignment: Alignment.bottomCenter,
              // el container se uso para poder agregar altura y anchura
              child: Container(
                  //padding: const EdgeInsets.only(top: 10),
                  height: 20.0,
                  width: 274.0,
                  // la separacion de la parte baja es de 18
                  margin: const EdgeInsets.only(top: 40, bottom: 18.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("14th November",
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.white)),
                        SizedBox(width: kDefaultPaddin),
                        Text("Saturday",
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.white)),
                      ])),
            )
          ],
        ),
      ),
    );
  }
}
