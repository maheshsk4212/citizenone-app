import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:citizenone_app/core/design_system/tokens/colors.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      // bg-gradient-to-br from-green-50 to-emerald-50 border border-green-100 shadow-sm
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFF0FDF4), Color(0xFFECFDF5)], // green-50, emerald-50
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFDCFCE7)), // green-100
        boxShadow: AppColors.shadowSm,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('7 DAY FORECAST', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF14532D))), // green-900
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFDCFCE7),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text('Lusaka, Zambia', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF16A34A))), // green-600
              ),
            ],
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildForecastItem('Today', '24°', LucideIcons.cloud_rain, Colors.blue, 'Rain'),
                const SizedBox(width: 12),
                _buildForecastItem('Tom', '22°', LucideIcons.cloud_lightning, Colors.amber, 'Storm'),
                const SizedBox(width: 12),
                _buildForecastItem('Wed', '25°', LucideIcons.cloud, Colors.grey, 'Cloudy'),
                const SizedBox(width: 12),
                _buildForecastItem('Thu', '28°', LucideIcons.sun, Colors.orange, 'Sunny'),
                const SizedBox(width: 12),
                 _buildForecastItem('Fri', '27°', LucideIcons.sun, Colors.orange, 'Sunny'),
                  const SizedBox(width: 12),
                _buildForecastItem('Sat', '23°', LucideIcons.cloud_rain, Colors.blue, 'Rain'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForecastItem(String day, String temp, IconData icon, Color color, String desc) {
    return Column(
      children: [
         Text(day.toUpperCase(), style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.textMuted)),
         const SizedBox(height: 8),
         Container(
           width: 40,
           height: 40,
           decoration: BoxDecoration(
             color: Colors.white,
             shape: BoxShape.circle,
             border: Border.all(color: const Color(0xFFDCFCE7)),
             boxShadow: AppColors.shadowSm,
           ),
           child: Icon(icon, size: 18, color: color),
         ),
         const SizedBox(height: 8),
         Text(temp, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
      ],
    );
  }
}
