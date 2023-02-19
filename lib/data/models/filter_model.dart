class FilterModel {
  final String baseApi,
      defaultApiParameters,
      addCommonParamter,
      addCredentialParamter;
  final List<FilterListModel> filterList;

  FilterModel.fromJson(Map<String, dynamic> json)
      : baseApi = json['baseapi'],
        defaultApiParameters = json['default_api_parameters'],
        addCommonParamter = json['add_common_params'],
        addCredentialParamter = json['add_credential'],
        filterList = (json['filterlist'] as List)
            .map((filterJson) => FilterListModel.fromJson(filterJson))
            .toList();
}

class FilterListModel {
  final String title;
  final List<FilterItemModel> filterItemList;

  FilterListModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        filterItemList = (json['filter_item_list'] as List)
            .map((filterJson) => FilterItemModel.fromJson(filterJson))
            .toList();
}

class FilterItemModel {
  final String title, apiParameters, adult;

  FilterItemModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        apiParameters = json['api_parameters'],
        adult = json['adult'];
}
