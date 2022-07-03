import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_cadastro_final/presentation/movies/movies_presenter.dart';

class MoviesScreen extends StatelessWidget {
  static const String id = '/movies';

  const MoviesScreen({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  final MoviesPresenter presenter;

  void showError(String errorMessage) async {
    Get.snackbar(errorMessage, '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () {
            final viewModel = presenter.viewModel.value;
            final moviesList = viewModel.moviesList;
            if (viewModel.errorMessage.isNotEmpty) {
              showError(viewModel.errorMessage);
            }

            return ListView.separated(
              itemCount: viewModel.moviesList.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) => Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: SizedBox(
                  height: 160,
                  child: Row(
                    children: [
                      Image.network(
                        moviesList[index].image,
                        fit: BoxFit.cover,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 16,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                moviesList[index].name,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('Rating: ${moviesList[index].rating}'),
                              Text(
                                moviesList[index].description,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 5,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
