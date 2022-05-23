part of 'fact_list.dart';

class FactListBody extends StatelessWidget {
  const FactListBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Align(
        alignment: Alignment.topCenter,
        child: BlocBuilder<FactBloc, FactState>(
          builder: (context, state) {
            FactBloc factBloc = BlocProvider.of<FactBloc>(context);
            if (state is FactInit) {
              return const CircularProgressIndicator();
            } else if (state is FactError) {
              return Text(factBloc.hasError ?? "Something went wrong");
            } else {
              return ListView.builder(
                itemCount: factBloc.facts!.length,
                itemBuilder: ((context, index) {
                  Fact fact =
                      factBloc.facts!.get(factBloc.facts!.length - 1 - index);
                  return ListTile(
                    dense: true,
                    title: Text(
                      fact.text,
                      maxLines: 2,
                      style: const TextStyle(overflow: TextOverflow.ellipsis),
                    ),
                    subtitle: Text(
                        toLocale(fact.updatedAt, Platform.localeName),
                        textAlign: TextAlign.right),
                  );
                }),
              );
            }
          },
        ),
      ),
    );
  }
}
