// // ignore_for_file: no_leading_underscores_for_local_identifiers, unused_local_variable, unused_element, iterable_contains_unrelated_type

// import 'dart:developer';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:rick_and_morty/models/repository/repository.dart';
// import 'package:stream_transform/stream_transform.dart';



// EventTransformer<E> _restartableDebounce<E>() {
//   return (events, mapper) =>
//       events.debounce(const Duration(milliseconds: 400)).switchMap(mapper);
// }

// class CharacterBloc extends Bloc<CharacterEvents, CharacterStates> {
//   CharacterBloc({
//     required this.characterRepo,
//   }) : super(CharacterInitialState([])) {
//     on<GetCharacter>(
//       (event, emit) async {
//         emit(CharacterLoadingState(characters: state.characters));
//         await Future.delayed(const Duration(seconds: 2));
//         try {
//           final _characters =
//               await characterRepo.getCharacter(event.pages, event.name);
//           allCharacters == _characters;
//           emit(CharacterSuccesState(characters: allCharacters));

//           log(_characters.toString());
//         } catch (e) {
//           emit(CharacterErrorState(allCharacters)); 
//           log(e.toString());
//         }
//       },
//     );
//     on<SearchCharacters>((event, emit) async {
//       emit(CharacterLoadingState(characters: state.characters));
//       await Future.delayed(const Duration(milliseconds: 300));

//       final newCharacter = allCharacters.where((e) {
//         return e.results!.contains(event.text.toLowerCase());
//       }).toList();
//       emit(CharacterSuccesState(
//         characters: newCharacter,
//       ));
//     }, transformer: _restartableDebounce());
//     on<ChangeCharactersPosition>(
//       (event, emit) {
//         log(characterRepo.isActivated.toString());
//         if (characterRepo.isActivated) {
//           try {
//             characterRepo.isActivated != false;
//             emit(CharacterSuccesState(characters: allCharacters));
//           } catch (e) {
//             log(characterRepo.isActivated.toString());
//           }
//         } else {
//           characterRepo.isActivated != true;
//           emit(CharacterSuccesState(characters: allCharacters));
//         }
//       },
//     );
//   }
//   final CharacterRepo characterRepo;

//   List<CharacterModel> allCharacters = [];
// }

// //Events

// abstract class CharacterEvents {}

// class SearchCharacters extends CharacterEvents {
//   final String text;

//   SearchCharacters(this.text);
// }

// class GetCharacter extends CharacterEvents {
//   final String name;
//   final int pages;

//   GetCharacter(this.name, this.pages);
// }

// class ChangeCharactersPosition extends CharacterEvents {
//   ChangeCharactersPosition();
// }

// //States

// abstract class CharacterStates {
//   final List<CharacterModel> characters;

//   CharacterStates({required this.characters});
// }

// class CharacterLoadingState extends CharacterStates {
//   @override
//   // ignore: overridden_fields
//   final List<CharacterModel> characters;
//   CharacterLoadingState({required this.characters})
//       : super(characters: characters);
// }

// class CharacterErrorState extends CharacterStates {
//   CharacterErrorState(this.characters) : super(characters: characters);

//   @override
//   // ignore: overridden_fields
//   final List<CharacterModel> characters;
// }

// class CharacterSuccesState extends CharacterStates {
//   @override
//   // ignore: overridden_fields
//   final List<CharacterModel> characters;

//   CharacterSuccesState({required this.characters})
//       : super(characters: characters);
// }

// class CharacterInitialState extends CharacterStates {
//   @override
//   // ignore: overridden_fields
//   final List<CharacterModel> characters;

//   CharacterInitialState(this.characters) : super(characters: characters);
// }
