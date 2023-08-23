import 'package:dw11_barbershop/src/core/ui/widgets/hours_panel.dart';
import 'package:dw11_barbershop/src/core/ui/widgets/weekdays_panel.dart';
import 'package:flutter/material.dart';

class BarbershopRegisterPage extends StatelessWidget {
  const BarbershopRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar estabelecimento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 5),
              TextFormField(
                decoration: const InputDecoration(label: Text('Nome')),
              ),
              const SizedBox(height: 24),
              TextFormField(
                decoration: const InputDecoration(label: Text('Email')),
              ),
              const SizedBox(height: 24),
              WeekdaysPanel(
                onDayPressed: (value) {
                  print('Dia clicado é $value');
                },
              ),
              const SizedBox(height: 24),
              HoursPanel(
                startTime: 6,
                endTime: 23,
                onHourPressed: (int value) {
                  print('Hora clicada é $value');
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(56),
                ),
                onPressed: () {},
                child: const Text('CADASTRAR ESTABELECIMENTO'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
