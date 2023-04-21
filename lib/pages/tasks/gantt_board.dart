import 'package:crnt_task/models/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gantt_chart/gantt_chart.dart';

class GanttBoard extends StatefulWidget {
  const GanttBoard({
    Key? key,
    required this.tasks,
  }) : super(key: key);
  final List<Task> tasks;

  @override
  State<GanttBoard> createState() => _GanttBoardState();
}

class _GanttBoardState extends State<GanttBoard> {
  final scrollController = ScrollController();

  double dayWidth = 30;
  bool showDaysRow = true;

  List<GanttRelativeEvent> _getEvents(BuildContext context) {
    return widget.tasks
        .map(
          (task) => GanttRelativeEvent(
            relativeToStart: Duration.zero,
            duration: Duration(days: task.deadlineDate.day - 15),
            suggestedColor: Theme.of(context).colorScheme.tertiary,
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 62),
            child: RawKeyboardListener(
              focusNode: FocusNode(),
              autofocus: true,
              onKey: (event) {
                if (event.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
                  if (scrollController.offset <
                      scrollController.position.maxScrollExtent) {
                    scrollController.jumpTo(scrollController.offset + 50);
                  }
                }
                if (event.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
                  if (scrollController.offset >
                      scrollController.position.minScrollExtent) {
                    scrollController.jumpTo(scrollController.offset - 50);
                  }
                }
              },
              child: GanttChartView(
                scrollPhysics: const BouncingScrollPhysics(),
                stickyAreaDayBuilder: (context) {
                  return AnimatedBuilder(
                    animation: scrollController,
                    builder: (context, _) {
                      final pos = scrollController.positions.first;
                      final currentOffset = pos.pixels;
                      final maxOffset = pos.maxScrollExtent;
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: currentOffset > 0
                                ? () {
                                    scrollController
                                        .jumpTo(scrollController.offset - 50);
                                  }
                                : null,
                            color: Colors.black,
                            icon: const Icon(
                              Icons.arrow_left,
                              size: 28,
                            ),
                          ),
                          const SizedBox(width: 8),
                          IconButton(
                            onPressed: currentOffset < maxOffset
                                ? () {
                                    scrollController
                                        .jumpTo(scrollController.offset + 50);
                                  }
                                : null,
                            color: Colors.black,
                            icon: const Icon(
                              Icons.arrow_right,
                              size: 28,
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                scrollController: scrollController,
                startDate: DateTime(
                  DateTime.now().year,
                  DateTime.now().month,
                  DateTime.now().day - 30,
                ),
                dayWidth: dayWidth,
                eventHeight: 40,
                stickyAreaEventBuilder:
                    (context, eventIndex, event, eventColor) =>
                        GanttChartDefaultStickyAreaCell(
                  event: event,
                  eventIndex: eventIndex,
                  eventColor: Theme.of(context).colorScheme.tertiary,
                  widgetBuilder: (context) => Text(
                    '${widget.tasks[eventIndex].projectId} '
                    '${widget.tasks[eventIndex].name}',
                  ),
                ),
                weekHeaderBuilder: (context, weekDate) =>
                    GanttChartDefaultWeekHeader(
                  weekDate: weekDate,
                  color: Theme.of(context).colorScheme.surfaceTint,
                  backgroundColor: Colors.transparent,
                  border: BorderDirectional(
                    end: BorderSide(
                      width: 2,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                ),
                dayHeaderBuilder: (context, date, isHoliday) =>
                    GanttChartDefaultDayHeader(
                  date: date,
                  isHoliday: isHoliday,
                  color: Theme.of(context).colorScheme.surfaceTint,
                  backgroundColor: isHoliday ? Colors.grey : Colors.transparent,
                ),
                showDays: showDaysRow,
                startOfTheWeek: WeekDay.monday,
                weekEnds: const {WeekDay.saturday, WeekDay.sunday},
                events: _getEvents(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
