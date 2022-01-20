abstract class NewsState {}

class NewsInitialState extends NewsState {}

class NewsBottomNavChangeState extends NewsState {}

class NewsLoadingBusinessNewsState extends NewsState {}

class NewsGetBusinessNewsState extends NewsState {}

class NewsLoadingSportsNewsState extends NewsState {}

class NewsGetSportsNewsState extends NewsState {}

class NewsLoadingScienceNewsState extends NewsState {}

class NewsGetScienceState extends NewsState {}

class NewsDarkModeState extends NewsState {}

class NewsLoadingSearchNewsState extends NewsState {}

class NewsGetSearchState extends NewsState {}

class ControllerChangedState extends NewsState {}
