import 'package:dw11_barbershop/src/core/ui/barbershop_icons.dart';
import 'package:dw11_barbershop/src/core/ui/constants.dart';
import 'package:dw11_barbershop/src/core/ui/helpers/form_helper.dart';
import 'package:dw11_barbershop/src/core/ui/widgets/avatar_widget.dart';
import 'package:dw11_barbershop/src/core/ui/widgets/hours_panel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:validatorless/validatorless.dart';

import '../../core/ui/helpers/messages.dart';
import 'widgets/schedule_calendar.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  var dateFormat = DateFormat('dd,MM,yyyy');
  var showCalendar = false;

  final formKey = GlobalKey<FormState>();
  final clientEC = TextEditingController();
  final dateEC = TextEditingController();

  @override
  void dispose() {
    clientEC.dispose();
    dateEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agendar cliente'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: formKey,
            child: Center(
              child: Column(
                children: [
                  const AvatarWidget(hideUploadButton: true),
                  const SizedBox(height: 24),
                  const Text(
                    'Nome e Sobrenome',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 37),
                  TextFormField(
                    controller: clientEC,
                    validator: Validatorless.required('Cliente obrigatório'),
                    decoration: const InputDecoration(
                      label: Text('Cliente'),
                    ),
                  ),
                  const SizedBox(height: 32),
                  TextFormField(
                    controller: dateEC,
                    validator: Validatorless.required(
                        'Selecione a data do agendamento'),
                    readOnly: true,
                    onTap: () {
                      setState(() {
                        showCalendar = true;
                      });
                      context.unfocus();
                    },
                    decoration: const InputDecoration(
                        label: Text('Clique e selecione uma data'),
                        hintText: 'Selecione uma data',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        suffixIcon: Icon(
                          BarbershopIcons.calendar,
                          color: ColorsConstants.brow,
                          size: 18,
                        )),
                  ),
                  Offstage(
                    offstage: !showCalendar,
                    child: Column(
                      children: [
                        const SizedBox(height: 24),
                        ScheduleCalendar(
                          cancelPressed: () {
                            setState(() {
                              showCalendar = false;
                            });
                          },
                          okPressed: (DateTime value) {
                            setState(() {
                              dateEC.text = dateFormat.format(value);

                              showCalendar = false;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  HoursPanel.singleSelection(
                    startTime: 6,
                    endTime: 23,
                    onHourPressed: (hour) {},
                    enabledTimes: const [6, 7, 8],
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(56),
                      ),
                      onPressed: () {
                        setState(() {
                          switch (formKey.currentState?.validate()) {
                            case null || false:
                              Messages.showError('Dados incompletos', context);
                            case true:
                            //Chamar VM
                          }
                        });
                      },
                      child: const Text(
                        'AGENDAR',
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
