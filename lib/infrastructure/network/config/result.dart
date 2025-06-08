sealed class Result<S> {
  const Result();
}

/// [Success] 요청 성공 시, 반환 클래스
final class Success<S> extends Result<S> {
  final S data;

  const Success(this.data);
}

/// [Failure] 요청 실패 시, 반환 클래스
final class Failure<S> extends Result<S> {
  final Exception exception;

  const Failure(this.exception);
}
