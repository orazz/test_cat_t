part of 'fact.dart';

class FactBody extends StatelessWidget {
  const FactBody({
    Key? key,
    required this.factBloc,
  }) : super(key: key);

  final FactBloc factBloc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Align(
        alignment: Alignment.topCenter,
        child: BlocBuilder<FactBloc, FactState>(
          builder: (context, state) {
            if (state is FactInit) {
              return const CircularProgressIndicator();
            } else if (state is FactError) {
              return Text(factBloc.hasError ?? "Something went wrong");
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Image.network(
                      factBloc.imageUrl!,
                      height: 200,
                      alignment: Alignment.center,
                      fit: BoxFit.contain,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    Text(
                      factBloc.fact?.text ?? '',
                      style: const TextStyle(fontSize: 14.0),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      toLocale(factBloc.fact!.updatedAt, Platform.localeName),
                      style: const TextStyle(fontSize: 12.0),
                    ),
                    const SizedBox(height: 20),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MaterialButton(
                            height: 40.0,
                            color: Colors.black,
                            onPressed: () =>
                                Navigator.pushNamed(context, '/fact_history'),
                            child: const Text(
                              'Fact history',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          MaterialButton(
                            height: 40.0,
                            color: Colors.white,
                            onPressed: () {
                              factBloc.add(LoadFactEvent());
                            },
                            child: const Text('Another fact!'),
                          ),
                        ])
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
