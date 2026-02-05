import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:citizenone_app/core/design_system/tokens/colors.dart';
import 'package:citizenone_app/core/design_system/tokens/typography.dart';
import 'package:citizenone_app/core/design_system/tokens/dimensions.dart';
import 'package:citizenone_app/features/dashboard/domain/entities/service_entity.dart';

class ServiceCard extends StatelessWidget {
  final ServiceEntity service;

  const ServiceCard({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (service.route.isNotEmpty) {
           context.push(service.route); 
        }
      },
      child: Align(
        alignment: Alignment.topLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Top aligned to match QuickActions
          crossAxisAlignment: CrossAxisAlignment.start, // Left aligned to match header
          children: [
          Container(
            width: AppDimensions.iconBoxSize, // Standardized
            height: AppDimensions.iconBoxSize,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24), // Squircle
              border: Border.all(color: Colors.grey[100]!),
              boxShadow: [
                 BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 12, offset: const Offset(0, 4)),
              ],
            ),
            child: Center(
              child: Icon(
                service.icon, 
                size: AppDimensions.iconSize, 
                color: service.color ?? AppColors.primary
              ),
            ),
          ),
          const SizedBox(height: AppDimensions.iconToLabelGap),
          SizedBox(
            width: AppDimensions.iconBoxSize, // Constrain width to ensure centering relative to icon
            child: Text(
              service.title,
              style: AppTypography.gridItemLabel,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    ),
    );
  }
}
