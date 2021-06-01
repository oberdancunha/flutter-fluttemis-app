import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/locus/locus_bloc.dart';

class SelectLocusWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocBuilder<LocusBloc, LocusState>(
        buildWhen: (stateA, stateB) => stateA.locusShowed != stateB.locusShowed,
        builder: (context, state) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Locus'),
            const SizedBox(width: 10),
            DropdownButton<String>(
              value: state.locusShowed.name,
              menuMaxHeight: 200,
              icon: Icon(Icons.arrow_downward, color: Colors.blue.shade900),
              items: state.locusList
                  .asList()
                  .map((locus) => locus.name)
                  .toList()
                  .map<DropdownMenuItem<String>>(
                    (locusName) => DropdownMenuItem<String>(
                      value: locusName,
                      child: Text(locusName),
                    ),
                  )
                  .toList(),
              style: TextStyle(color: Colors.blue.shade900),
              underline: Container(
                height: 2,
                color: Colors.blue.shade900,
              ),
              onChanged: (locusSearching) {
                context.read<LocusBloc>().add(
                      LocusEvent.locusShowed(locusSearching: locusSearching!),
                    );
              },
            ),
          ],
        ),
      );
}
