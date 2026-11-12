import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rpl2/routes/app_routes.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final menuItems = [
      (
        title: 'About',
        icon: Icons.info_outline_rounded,
        route: AppRoutes.about,
        color: const Color(0xFF3688F5),
      ),
      (
        title: 'ListView',
        icon: Icons.list_alt_rounded,
        route: AppRoutes.list_basic,
        color: const Color(0xFFF28A24),
      ),
      (
        title: 'GridView',
        icon: Icons.grid_view_rounded,
        route: AppRoutes.gridBasic,
        color: const Color(0xFF7357E8),
      ),
      (
        title: 'GridView Builder',
        icon: Icons.grid_on_rounded,
        route: AppRoutes.gridBuilder,
        color: const Color(0xFF12A8A4),
      ),
      (
        title: 'Form',
        icon: Icons.assignment_outlined,
        route: AppRoutes.form,
        color: const Color(0xFFE45D73),
      ),
      (
        title: 'Instagram',
        icon: Icons.query_stats_rounded,
        route: AppRoutes.instagram,
        color: const Color(0xFFDB527D),
      ),
      (
        title: 'Input',
        icon: Icons.edit_note_rounded,
        route: AppRoutes.inputForm,
        color: const Color(0xFF3977D5),
      ),

      (
        title: 'Cinema',
        icon: Icons.local_movies_outlined,
        route: AppRoutes.cinema,
        color: const Color(0xFF26A69A),
      ),
      (
        title: 'Album - API',
        icon: Icons.photo_album_outlined,
        route: AppRoutes.album,
        color: const Color(0xFF6655D8),
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF090D1B),
      appBar: AppBar(
        title: const Text(
          'Home Page',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          const Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF111A32),
                    Color(0xFF090D1B),
                    Color(0xFF101127),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 70,
            right: -80,
            child: _GlowOrb(color: Color(0xFF547BFF)),
          ),
          Positioned(
            bottom: 80,
            left: -100,
            child: _GlowOrb(color: Color(0xFF9A48E8)),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 28),
              child: Column(
                children: [
                  Container(
                    width: 76,
                    height: 76,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Colors.white.withOpacity(0.18)),
                    ),
                    child: const Icon(
                      Icons.dashboard_customize_rounded,
                      size: 40,
                      color: Color(0xFF9DC5FF),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Halaman Home',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    'Pilih menu navigasi di bawah ini',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.62),
                    ),
                  ),
                  const SizedBox(height: 28),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: menuItems.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 14,
                          crossAxisSpacing: 14,
                          childAspectRatio: 1.05,
                        ),
                    itemBuilder: (context, index) {
                      final item = menuItems[index];
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () =>
                                  Navigator.pushNamed(context, item.route),
                              child: Ink(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      item.color.withOpacity(0.25),
                                      Colors.white.withOpacity(0.055),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.19),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: item.color.withOpacity(0.12),
                                      blurRadius: 18,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(14),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 54,
                                        height: 54,
                                        decoration: BoxDecoration(
                                          color: item.color.withOpacity(0.2),
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: item.color.withOpacity(0.45),
                                          ),
                                        ),
                                        child: Icon(
                                          item.icon,
                                          size: 27,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      Text(
                                        item.title,
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GlowOrb extends StatelessWidget {
  const _GlowOrb({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 70, sigmaY: 70),
      child: Container(
        width: 220,
        height: 220,
        decoration: BoxDecoration(
          color: color.withOpacity(0.45),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
