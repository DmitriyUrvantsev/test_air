import 'package:intl/intl.dart';

class DepartureArrival {
  final DateTime arrival;
  final DateTime departure;

  DepartureArrival(this.arrival, this.departure);

  String getFormattedDuration() {
    // Разница во времени между прибытием и отправлением
    final duration = arrival.difference(departure);

    // Преобразуем разницу во времени в часы и минуты
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);

    // Вычисляем общее количество часов в пути
    final totalHours = hours + minutes / 60;

    // Округляем общее количество часов до ближайшего целого или половины
    final roundedTotalHours = (totalHours * 2).roundToDouble() / 2;

    // Форматируем время прибытия и отправления
    final arrivalTime = DateFormat('HH:mm').format(arrival);
    final departureTime = DateFormat('HH:mm').format(departure);

    // Возвращаем массив с временем отправления, временем прибытия и временем пути
    return [departureTime, arrivalTime, '$roundedTotalHoursч в пути'].join(', ');
  }
}