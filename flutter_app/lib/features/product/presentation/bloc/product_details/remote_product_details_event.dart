abstract class RemoteProductDetailsEvent {
  const RemoteProductDetailsEvent();
}

class GetProductDetails extends RemoteProductDetailsEvent {
  String prodId;
  GetProductDetails(this.prodId);
}
