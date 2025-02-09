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

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

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
    return AppBar(
      backgroundColor: AppColors.blueBackground,
      leading: Builder(
        builder: (context) => IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () =>
              widget.onDrawerMenuTap(), // Chame a função de callback
        ),
      ),
      title: Row(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/spalla_logo.png',
                width: 32,
                height: 32,
              ),
              const SizedBox(width: 8),
              Text(
                'Spalla',
                style: GoogleFonts.inter(
                  color: AppColors.blueInfo,
                  fontSize: 45,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -2.5,
                ),
              )
            ],
          ),
          const SizedBox(
            width: 50,
          ),
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
                    width: 32,
                    height: 32,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(widget.companyName),
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
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(widget.userName),
                const SizedBox(width: 8),
                CircleAvatar(
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
            top: kToolbarHeight,
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
