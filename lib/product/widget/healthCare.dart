import 'package:flutter/material.dart';



class healthCare extends StatelessWidget {
  const healthCare({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width *0.4,
      child: Container(
        child: Row(
          children: [
           const _healthStack(),
           const SizedBox(width: 10),
           const _healthcareText(),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey.withOpacity(0.1)

        ),
      ),
    );
  }
}



class _healthcareText extends StatelessWidget {
  const _healthcareText({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text("Verified Healthcare", style: Theme.of(context).textTheme.subtitle2?.copyWith(
          color: Colors.green
        ),);
  }
}

class _healthStack extends StatelessWidget {
  const _healthStack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
      Container(
        height: 20,
        width: 20,
        decoration: const BoxDecoration(
        color: Colors.green,
        shape: BoxShape.circle
        ),
      ),
      const Positioned.fill(child: Icon(Icons.done, color: Colors.white,size: 16,)),
    ]);
  }
}
