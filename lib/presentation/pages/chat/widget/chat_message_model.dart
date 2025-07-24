class ChatMessageModel {
  final String text;
  final String senderEmail;

  ChatMessageModel({required this.text, required this.senderEmail});

  Map<String, dynamic> toJson() => {
        'text': text,
        'senderEmail': senderEmail,
      };

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) =>
      ChatMessageModel(
        text: json['text'],
        senderEmail: json['senderEmail'],
      );
}
