import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:citizenone_app/core/design_system/tokens/colors.dart';
import 'package:citizenone_app/core/design_system/tokens/typography.dart';
import 'package:citizenone_app/core/design_system/tokens/dimensions.dart';
import 'package:citizenone_app/features/dashboard/domain/entities/service_entity.dart';
import 'package:citizenone_app/core/common/widgets/press_scale_widget.dart';

class ServiceCard extends StatelessWidget {
  final ServiceEntity service;

  const ServiceCard({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return PressScaleWidget(
      onPressed: () {
        if (service.route.isNotEmpty) {
           context.push(service.route); 
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: AppDimensions.iconBoxSize,
            height: AppDimensions.iconBoxSize,
            padding: EdgeInsets.zero, // Fixed size handles it
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                 BoxShadow(
                   color: Colors.black.withOpacity(0.05),
                   blurRadius: 10,
                   offset: const Offset(0, 4),
                 )
              ],
            ),
            child: Center(
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: (service.color ?? AppColors.primary).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(service.icon, color: service.color ?? AppColors.primary, size: 24),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            service.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
              height: 1.1,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
