class PagingParams  {
  final int? pageKey;
  final int pageSize;
  final String? status;
  final bool? isActive;

  PagingParams({
    this.isActive,
    this.pageKey ,
    this.pageSize = 0,
    this.status
  });

  Map<String, dynamic> toMap() => {
    'pageNumber': pageKey,
    'pageSize': pageSize,
    'Status':status,
    'isActive':isActive,

  }..removeWhere((key, value) => value == null || value == '');
}