class InBoxModel {
  int id = -1;
  String? smallAvatar = '';
  String senderName = '';
  String? currentlyMessage;
  bool isRead = false;

  InBoxModel({required this.id, this.smallAvatar, required this.senderName, this.currentlyMessage, required this.isRead});

  @override
  String toString() {
    return "$id + $senderName";
  }
}