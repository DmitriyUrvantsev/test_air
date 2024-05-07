class Departure {
  final DateTime arrival;
  final DateTime departure;

  Departure(this.arrival, this.departure);

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
    final arrivalTime = '${arrival.hour.toString().padLeft(2, '0')}:${arrival.minute.toString().padLeft(2, '0')}';
    final departureTime = '${departure.hour.toString().padLeft(2, '0')}:${departure.minute.toString().padLeft(2, '0')}';

    // Собираем строку с временем пути
    final formattedDuration = '$departureTime-$arrivalTime   $roundedTotalHoursч в пути';

    return formattedDuration;
  }
}
