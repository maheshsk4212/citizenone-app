import 'package:flutter/material.dart';
import 'package:citizenone_app/core/common/widgets/glass_container.dart';
import 'package:citizenone_app/core/design_system/tokens/colors.dart';

class BankingDashboardScreen extends StatelessWidget {
  const BankingDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Banking Services'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBalanceCard(),
            const SizedBox(height: 24),
            const Text(
              'Quick Actions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: _buildActionButton(context, 'Transfer', Icons.send)),
                const SizedBox(width: 16),
                Expanded(child: _buildActionButton(context, 'Pay Bills', Icons.receipt_long)),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Recent Transactions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  _buildTransactionItem('Netflix Subscription', '-\$15.00', DateTime.now()),
                  _buildTransactionItem('Salary Credit', '+\$4,500.00', DateTime.now().subtract(const Duration(days: 1)), isCredit: true),
                  _buildTransactionItem('Grocery Store', '-\$124.50', DateTime.now().subtract(const Duration(days: 2))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceCard() {
    return GlassContainer(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      color: AppColors.primary.withOpacity(0.2), // Blue tint
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Total Balance',
            style: TextStyle(color: AppColors.textSecondary),
          ),
          const SizedBox(height: 8),
          const Text(
            '\$24,562.00',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('**** **** **** 4242', style: TextStyle(color: Colors.white70)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text('VISA', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, String label, IconData icon) {
    return GlassContainer(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Icon(icon, color: AppColors.primary, size: 28),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildTransactionItem(String title, String amount, DateTime date, {bool isCredit = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
              Text(
                '${date.day}/${date.month}/${date.year}',
                style: const TextStyle(color: AppColors.textSecondary, fontSize: 12),
              ),
            ],
          ),
          Text(
            amount,
            style: TextStyle(
              color: isCredit ? AppColors.success : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
