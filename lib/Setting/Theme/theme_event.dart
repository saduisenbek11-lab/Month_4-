import 'package:equatable/equatable.dart';

sealed class ThemeEvent extends Equatable{
  const ThemeEvent();
}
final class ChangeThemeEvent extends ThemeEvent {
  ChangeThemeEvent({required this.value});
 final bool value;
 
  @override
  List<Object?> get props =>  [value];
}
