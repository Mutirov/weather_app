// // M-V-VM     MVVM MIMARISI

// MODEL:
// class Tour {
//   final String title;
//   final String description;

//   Tour({required this.title, required this.description});
// }


// VIEW

// class TourListScreen extends StatelessWidget {
//   final TourViewModel viewModel;

//   TourListScreen(this.viewModel);

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: viewModel.tours.length,
//       itemBuilder: (context, index) {
//         final tour = viewModel.tours[index];
//         return ListTile(
//           title: Text(tour.title),
//           subtitle: Text(tour.description),
//         );
//       },
//     );
//   }
// }



// VIEWMODEL
// class TourViewModel extends ChangeNotifier {
//   List<Tour> tours = [];

//   void fetchTours() async {
//     // Burada genellikle bir API çağrısı olur
//     tours = await TourService.getTours();
//     notifyListeners();
//   }
// }


// lib/
// ├── models/
// │   └── tour.dart
// ├── views/
// │   └── tour_list_screen.dart
// ├── viewmodels/
// │   └── tour_view_model.dart
// ├── services/
// │   └── tour_service.dart




// void main() {
//   runApp(MainApp());
// }

// class MainApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => BirinciViewModel(),
//       child: MaterialApp(
//         title: 'TourlyTrip',
//         home: AnaSayfa(),
//       ),
//     );
//   }
// }

// multiprovider
// void main() {
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => AuthViewModel()),
//         ChangeNotifierProvider(create: (_) => TourViewModel()),
//       ],
//       child: MyApp(),
//     ),
//   );
// }