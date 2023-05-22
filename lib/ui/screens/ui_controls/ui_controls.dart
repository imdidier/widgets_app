import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const String name = 'ui_controls_screen';

  const UiControlsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI controls and titles')),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Controles adicionales we'),
          value: isDeveloper,
          onChanged: (value) => setState(
            () {
              isDeveloper = value;
            },
          ),
        ),
        ExpansionTile(
          title: const Text('Vehículo de transporte'),
          subtitle: Text(
            '$selectedTransportation',
          ),
          children: [
            RadioListTile(
              title: const Text('By Car'),
              subtitle: const Text('Viajar por tierra'),
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(
                () {
                  selectedTransportation = Transportation.car;
                },
              ),
            ),
            RadioListTile(
              title: const Text('By Submarine'),
              subtitle: const Text('Viajar bajo el agua'),
              value: Transportation.submarine,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(
                () {
                  selectedTransportation = Transportation.submarine;
                },
              ),
            ),
            RadioListTile(
              title: const Text('By Plane'),
              subtitle: const Text('Viajar por aire'),
              value: Transportation.plane,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(
                () {
                  selectedTransportation = Transportation.plane;
                },
              ),
            ),
            RadioListTile(
              title: const Text('By Boat'),
              subtitle: const Text('Viajar sobre el agua'),
              value: Transportation.boat,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(
                () {
                  selectedTransportation = Transportation.boat;
                },
              ),
            ),
          ],
        ),
        CheckboxListTile(
          title: const Text('¿Incluirá el desayuno'),
          value: wantsBreakfast,
          onChanged: (value) => setState(
            () {
              wantsBreakfast = value!;
            },
          ),
        ),
        CheckboxListTile(
          title: const Text('¿Incluirá el almuerzo'),
          value: wantsLunch,
          onChanged: (value) => setState(
            () {
              wantsBreakfast = value!;
            },
          ),
        ),
        CheckboxListTile(
          title: const Text('¿Incluirá la cena'),
          value: wantsDinner,
          onChanged: (value) => setState(
            () {
              wantsBreakfast = value!;
            },
          ),
        ),
      ],
    );
  }
}
