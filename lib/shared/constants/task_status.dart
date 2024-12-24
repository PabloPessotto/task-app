class TaskStatus {
  static const String opened = "OPENED";
  static const String doing = "DOING";

  ///The task has not yet started.
  static const String pending = "PENDING";

  ///The task is currently being worked on.
  static const String inProgress = "IN PROGRESS";

  ///The task was completed successfully.
  static const String completed = "COMPLETED";

  ///The task no longer needs to be performed.
  static const String canceled = "CANCELED";
}
