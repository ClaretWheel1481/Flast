import 'package:fluent_ui/fluent_ui.dart';
import 'package:flast/homepage.dart';

class CustomHoverButton extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const CustomHoverButton({super.key, required this.title, required this.onTap});

  @override
  // ignore: library_private_types_in_public_api
  _CustomHoverButtonState createState() => _CustomHoverButtonState();
}

class _CustomHoverButtonState extends State<CustomHoverButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _isHovering = true),
        onExit: (_) => setState(() => _isHovering = false),
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          constraints: const BoxConstraints(minWidth: 200),
          decoration: BoxDecoration(
            color: _isHovering ? const Color.fromARGB(255, 201, 201, 201) : Colors.transparent,
            border: Border.all(color: isDarkMode(context) ? Colors.white : Colors.grey,width: 0.5),
            borderRadius: const BorderRadius.all(Radius.circular(15))
          ),
          child: Center(
            child: Text(
              widget.title,
            ),
          ),
        ),
      ),
    );
  }
}
