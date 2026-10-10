import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/profile.dart';
import '../repositories/profile_repository.dart';

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return ProfileRepository();
});

// Interactive state mode for testing states directly via the UI pills
enum AppUiState { normal, loading, empty, error }
final appUiStateProvider = StateProvider<AppUiState>((ref) => AppUiState.normal);

final profilesFutureProvider = FutureProvider<List<Profile>>((ref) async {
  final stateMode = ref.watch(appUiStateProvider);

  if (stateMode == AppUiState.loading) {
    await Future.delayed(const Duration(days: 1)); // Indefinite loading state
  }
  if (stateMode == AppUiState.error) {
    throw Exception('Failed to connect to network. Please check your connection.');
  }

  final repository = ref.watch(profileRepositoryProvider);
  final profiles = await repository.fetchProfiles();

  if (stateMode == AppUiState.empty) {
    return [];
  }
  return profiles;
});

final searchQueryProvider = StateProvider<String>((ref) => '');

// Filtered profiles provider implementing case-insensitive name, city, & community search
final filteredProfilesProvider = Provider<AsyncValue<List<Profile>>>((ref) {
  final profilesAsync = ref.watch(profilesFutureProvider);
  final query = ref.watch(searchQueryProvider).toLowerCase().trim();

  return profilesAsync.whenData((profiles) {
    if (query.isEmpty) return profiles;
    return profiles.where((profile) {
      final nameMatch = profile.name.toLowerCase().contains(query);
      final cityMatch = profile.city?.toLowerCase().contains(query) ?? false;
      final communityMatch = profile.community?.toLowerCase().contains(query) ?? false;

      return nameMatch || cityMatch || communityMatch;
    }).toList();
  });
});