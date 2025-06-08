class AppIcon {
  static const String _basePath = 'assets/icons';

  static String getPath(String fileName) => _basePath + fileName;

  static final String home = getPath('/common/home.svg');
  static final String arrowBack = getPath('/common/arrow_back.svg');
  static final String cancel = getPath('/common/cancel.svg');
  static final String menu = getPath('/common/menu.svg');
  static final String search = getPath('/common/search.svg');
  static final String cancelCircle = getPath('/common/cancel_circle.svg');
  static final String plus = getPath('/common/plus.svg');
  static final String favorite = getPath('/common/favorite.svg');
  static final String favoriteUnselected = getPath('/common/favorite_unselected.svg');

  static final String chatPlus = getPath('/chat/chat_plus.svg');
  static final String sendMessage = getPath('/chat/send_message.svg');
  static final String album = getPath('/chat/album.svg');
  static final String clip = getPath('/chat/clip.svg');
  static final String diary = getPath('/chat/diary.svg');
  static final String cameraBlack = getPath('/chat/camera_black.svg');
}
