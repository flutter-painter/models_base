import 'package:mobx/mobx.dart';
import 'package:models_base/src/base/article_base.dart';
import 'package:models_base/src/base/herder_base.dart';
import 'package:models_base/src/base/product_base.dart';
import 'package:models_base/src/base/shop_base.dart';
import 'package:models_base/src/base/ticket_base.dart';

// ToDo this should goe into models_base
extension NextProductId<P extends ProductAbstract> on ObservableList<P> {
  int get nextId {
    if (isEmpty) {
      return 1;
    } else {
      sort((a, b) => a.id.compareTo(b.id));
      return last.id;
    }
  }
}

extension NextArticleId<A extends ArticleAbstract> on List<A> {
  int get nextId {
    if (isEmpty) {
      return 1;
    } else {
      sort((a, b) => a.id.compareTo(b.id));
      return last.id;
    }
  }
}

extension NextHerderId<H extends HerderAbstract> on List<H> {
  int get nextId {
    if (isEmpty) {
      return 1;
    } else {
      sort((a, b) => a.id.compareTo(b.id));
      return last.id;
    }
  }
}

extension NextShopId<S extends ShopAbstract> on List<S> {
  int get nextId {
    if (isEmpty) {
      return 1;
    } else {
      sort((a, b) => a.id.compareTo(b.id));
      return last.id;
    }
  }
}

extension NextTicketId<T extends TicketAbstract> on List<T> {
  int get nextId {
    if (isEmpty) {
      return 1;
    } else {
      sort((a, b) => a.id.compareTo(b.id));
      return last.id;
    }
  }
}
