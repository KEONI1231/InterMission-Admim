class ResearchResponse {
  final List<ResearchItem> content;
  final Pageable pageable;
  final bool last;
  final int totalElements;
  final int totalPages;
  final int size;
  final int number;
  final Sort sort;
  final bool first;
  final int numberOfElements;
  final bool empty;

  ResearchResponse({
    required this.content,
    required this.pageable,
    required this.last,
    required this.totalElements,
    required this.totalPages,
    required this.size,
    required this.number,
    required this.sort,
    required this.first,
    required this.numberOfElements,
    required this.empty,
  });

  factory ResearchResponse.fromJson(Map<String, dynamic> json) {
    var contentList = json['content'] as List;
    List<ResearchItem> content =
    contentList.map((item) => ResearchItem.fromJson(item)).toList();

    return ResearchResponse(
      content: content,
      pageable: Pageable.fromJson(json['pageable']),
      last: json['last'] as bool,
      totalElements: json['totalElements'] as int,
      totalPages: json['totalPages'] as int,
      size: json['size'] as int,
      number: json['number'] as int,
      sort: Sort.fromJson(json['sort']),
      first: json['first'] as bool,
      numberOfElements: json['numberOfElements'] as int,
      empty: json['empty'] as bool,
    );
  }
}

class ResearchItem {
  final DateTime createdDate;
  final DateTime modifiedDate;
  final String participationStatus;
  final String memberEmail;
  final String researchId;

  ResearchItem({
    required this.createdDate,
    required this.modifiedDate,
    required this.participationStatus,
    required this.memberEmail,
    required this.researchId,
  });

  factory ResearchItem.fromJson(Map<String, dynamic> json) {
    return ResearchItem(
      createdDate: DateTime.parse(json['createdDate'] as String),
      modifiedDate: DateTime.parse(json['modifiedDate'] as String),
      participationStatus: json['participationStatus'] as String,
      memberEmail: json['memberEmail'] as String,
      researchId: json['researchId'] as String,
    );
  }
}

class Sort {
  final bool empty;
  final bool sorted;
  final bool unsorted;

  Sort({
    required this.empty,
    required this.sorted,
    required this.unsorted,
  });

  factory Sort.fromJson(Map<String, dynamic> json) {
    return Sort(
      empty: json['empty'] as bool,
      sorted: json['sorted'] as bool,
      unsorted: json['unsorted'] as bool,
    );
  }
}

class Pageable {
  final Sort sort;
  final int offset;
  final int pageSize;
  final int pageNumber;
  final bool paged;
  final bool unpaged;

  Pageable({
    required this.sort,
    required this.offset,
    required this.pageSize,
    required this.pageNumber,
    required this.paged,
    required this.unpaged,
  });

  factory Pageable.fromJson(Map<String, dynamic> json) {
    return Pageable(
      sort: Sort.fromJson(json['sort']),
      offset: json['offset'] as int,
      pageSize: json['pageSize'] as int,
      pageNumber: json['pageNumber'] as int,
      paged: json['paged'] as bool,
      unpaged: json['unpaged'] as bool,
    );
  }
}
