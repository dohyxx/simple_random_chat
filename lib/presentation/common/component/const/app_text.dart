import 'dart:ui';

class AppText {
  static const projectName = "RandomChat";
  static const textFont = "Apple SD Gothic Neo";

  static const name = "이름";
  static const nameHintText = "이름 입력";
  static const unknown = "(알 수 없음)";
  static const next = "다음";
  static const confirm = "확인";
  static const close = "닫기";
  static const cancel = "취소";

  static const chatExitConfirmMessage = "채팅방을 나가시겠습니까?";
  static const edit = "편집";
  static const editComplete = "편집 완료";
  static const sort = "정렬";
  static const inputMessage = "메세지를 입력해주세요.";
  static const chat = "Chat";
  static const startNewChat = "매칭 대기";
  static const newChat = "New Chat";
  static const String chatEmptyMessage = '아직 채팅이 시작되지 않았어요.';
  static const String errorText = "오류가 발생했습니다.\n잠시 후 다시 시도해주세요.";
  static const String pleasePressButton = "Click here to start chat";

  static Color defaultColor() => const Color(0xffF4EDE5).withValues(alpha: 0.8);
}
