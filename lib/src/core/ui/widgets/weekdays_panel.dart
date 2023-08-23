import 'package:dw11_barbershop/src/core/ui/constants.dart';
import 'package:flutter/material.dart';

class WeekdaysPanel extends StatelessWidget {
  final ValueChanged<String> onDayPressed;
  const WeekdaysPanel({
    Key? key,
    required this.onDayPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Selecione os dias da semana',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonDay(label: 'Seg', onDayPressed: onDayPressed),
                ButtonDay(label: 'Ter', onDayPressed: onDayPressed),
                ButtonDay(label: 'Qua', onDayPressed: onDayPressed),
                ButtonDay(label: 'Qui', onDayPressed: onDayPressed),
                ButtonDay(label: 'Sex', onDayPressed: onDayPressed),
                ButtonDay(label: 'Sab', onDayPressed: onDayPressed),
                ButtonDay(label: 'Dom', onDayPressed: onDayPressed),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ButtonDay extends StatefulWidget {
  final String label;
  final ValueChanged<String> onDayPressed;

  const ButtonDay({
    Key? key,
    required this.label,
    required this.onDayPressed,
  }) : super(key: key);

  @override
  State<ButtonDay> createState() => _ButtonDayState();
}

class _ButtonDayState extends State<ButtonDay> {
  var selected = false;

  @override
  Widget build(BuildContext context) {
    final textColor = selected ? Colors.white : ColorsConstants.grey;
    var buttonColor = selected ? ColorsConstants.brow : Colors.white;
    final Color buttonBorderColor =
        selected ? ColorsConstants.brow : ColorsConstants.grey;

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          widget.onDayPressed(widget.label);
          setState(() {
            selected = !selected;
          });
        },
        child: Container(
          width: 40,
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: buttonColor,
            border: Border.all(
              color: ColorsConstants.grey,
            ),
          ),
          child: Center(
            child: Text(
              widget.label,
              style: const TextStyle(
                fontSize: 12,
                color: ColorsConstants.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
