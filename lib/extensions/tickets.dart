import 'package:models_base/common.dart' show FinFlow;
import 'package:models_base/src/base/ticket_base.dart';
import 'package:models_base/utils.dart';

extension FinFlowsTickets on List<TicketAbstract> {
  List<FinFlow> herderTkFinFlows(
      String herderId, DateRange dateRange, List<FinFlow> flows) {
    int cvo = 0;
    where((t) => t.herderId == herderId)
        .where((t) => t.status == true)
        .forEach((ticket) {
      if ((ticket.date.isAfter(dateRange.startDate) ||
              ticket.date.isAtSameMomentAs(dateRange.startDate)) &&
          (ticket.date.isBefore(dateRange.endDate) ||
              ticket.date.isAtSameMomentAs(dateRange.endDate))) {
        // no maintenance if financial new ticketTypes added
        if (flows.any((f) => f.type == '${ticket.ticketType}')) {
          final f = flows.firstWhere((f) => f.type == '${ticket.ticketType}');
          f.sumTickets += ticket.total;
        }
      }
    });
    final finFlowCVO = FinFlow(FinFlow.cvo, sumTickets: cvo);
    print('cvo $cvo');
    // print('finFlowCVO.toString() ${finFlowCVO.toString()}');
    flows.add(finFlowCVO);
    return flows;
  }

  List<FinFlow> shopTkFinFlows(
      String shopUuid, DateRange dateRange, List<FinFlow> flows) {
    where((t) => t.shopUuid == shopUuid)
        .where((t) => t.status)
        .forEach((ticket) {
      if ((ticket.date.isAfter(dateRange.startDate) ||
              ticket.date.isAtSameMomentAs(dateRange.startDate)) &&
          (ticket.date.isBefore(dateRange.endDate) ||
              ticket.date.isAtSameMomentAs(dateRange.endDate))) {
        if (flows.any((f) => f.type == '${ticket.ticketType}')) {
          final f = flows.firstWhere((f) => f.type == '${ticket.ticketType}');
          f.sumTickets += ticket.total;
        }
      }
    });
    return flows;
  }
}
