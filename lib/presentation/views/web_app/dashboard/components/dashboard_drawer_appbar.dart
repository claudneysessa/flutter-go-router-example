import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spallawebapp/common/style/app_colors.dart';
import 'package:spallawebapp/presentation/views/web_app/dashboard/components/dashboard_drawer_appbar_user_panel.dart';

class DashboardDrawerAppBar extends StatefulWidget
    implements PreferredSizeWidget {
  final String companyName;
  final String companyLogo;
  final String userName;
  final String userAvatar;
  final VoidCallback onDrawerMenuTap;

  const DashboardDrawerAppBar({
    Key? key,
    required this.companyName,
    required this.companyLogo,
    required this.userName,
    required this.userAvatar,
    required this.onDrawerMenuTap,
  }) : super(key: key);

  // Ajuste este valor para aumentar ou diminuir a altura do AppBar
  // Valores sugeridos:
  // - kToolbarHeight (56.0 - padrão)
  // - 64.0 (um pouco maior)
  // - 72.0 (ainda maior)
  // - 80.0 (bem maior)
  static const double appBarHeight = 65.0;

  @override
  Size get preferredSize => const Size.fromHeight(appBarHeight);

  @override
  State<DashboardDrawerAppBar> createState() => _DashboardDrawerAppBarState();
}

class _DashboardDrawerAppBarState extends State<DashboardDrawerAppBar> {
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    const double iconSize = DashboardDrawerAppBar.appBarHeight * 0.6;
    const double fontSize = DashboardDrawerAppBar.appBarHeight * 0.7;

    return AppBar(
      backgroundColor: AppColors.blueInfo,
      toolbarHeight: DashboardDrawerAppBar.appBarHeight,
      leading: Builder(
        builder: (context) => IconButton(
          icon: const Icon(Icons.menu, size: iconSize * 0.7),
          onPressed: () => widget.onDrawerMenuTap(),
        ),
      ),
      title: Row(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/spalla_logo.png',
                width: iconSize,
                height: iconSize,
              ),
              const SizedBox(width: 12),
              Text(
                'Spalla',
                style: GoogleFonts.inter(
                  color: AppColors.blueInfo,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -2.5,
                ),
              )
            ],
          ),
          const SizedBox(width: DashboardDrawerAppBar.appBarHeight),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: Colors.white,
                    width: 1.0,
                  ),
                ),
                padding: const EdgeInsets.all(
                  2.0,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    6.0,
                  ),
                  child: Image.asset(
                    'assets/images/empresa_logo.png',
                    width: iconSize,
                    height: iconSize,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                widget.companyName,
                style: const TextStyle(fontSize: fontSize * 0.35),
              ),
            ],
          ),
        ],
      ),
      actions: [
        GestureDetector(
          onTap: () {
            if (_overlayEntry == null) {
              _showOverlay(context);
            } else {
              _removeOverlay();
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Text(
                  widget.userName,
                  style: const TextStyle(fontSize: fontSize * 0.35),
                ),
                const SizedBox(width: 12),
                CircleAvatar(
                  radius: iconSize * 0.4,
                  backgroundImage: AssetImage(widget.userAvatar),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showOverlay(BuildContext context) {
    OverlayState? overlayState = Overlay.of(context);

    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                _removeOverlay();
              },
              behavior: HitTestBehavior.translucent,
            ),
          ),
          Positioned(
            top: DashboardDrawerAppBar.appBarHeight,
            right: 0,
            child: Material(
              child: DashboardDrawerAppBarUserPanel(
                userName: widget.userName,
                userAvatar: widget.userAvatar,
                onClose: () {
                  _removeOverlay();
                },
              ),
            ),
          ),
        ],
      ),
    );

    overlayState.insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }
}
