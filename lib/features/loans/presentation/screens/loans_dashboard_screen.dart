import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import 'package:citizenone_app/core/design_system/tokens/colors.dart';

class LoansDashboardScreen extends StatelessWidget {
  const LoansDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Column(
          children: [
            Text('Loans', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Text('Find the right loan for your needs', style: TextStyle(fontSize: 12, color: AppColors.textSecondary, fontWeight: FontWeight.normal)),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => context.go('/home'),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // AI Best Loan Card
            _buildAILoanCard(),
            const SizedBox(height: 32),
            
            // Loan Categories
            const Text(
              'Browse Categories',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCategoryItem(Icons.person, 'Personal', Colors.orange),
                  const SizedBox(width: 12),
                  _buildCategoryItem(Icons.home, 'Home', Colors.blue),
                  const SizedBox(width: 12),
                  _buildCategoryItem(Icons.directions_car, 'Car', Colors.green),
                  const SizedBox(width: 12),
                  _buildCategoryItem(Icons.school, 'Education', Colors.purple),
                   const SizedBox(width: 12),
                  _buildCategoryItem(Icons.business, 'Business', Colors.teal),
                ],
              ),
            ),
             const SizedBox(height: 32),

             // Loan List (Comparison)
            const Text(
              'Recommended for You',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            _buildComparisonCard(
              bankName: 'HDFC Bank',
              logoColor: Colors.blue[900]!,
              interestRate: '10.5%',
              emi: '₹2,450',
              tenure: '5 Years',
              tag: 'Best Rate',
              context: context,
            ),
            const SizedBox(height: 16),
            _buildComparisonCard(
              bankName: 'ICICI Bank',
              logoColor: Colors.orange[800]!,
              interestRate: '10.75%',
              emi: '₹2,480',
              tenure: '5 Years',
              tag: 'Fast Approval',
              context: context,
            ),
             const SizedBox(height: 16),
            _buildComparisonCard(
              bankName: 'Axis Bank',
              logoColor: Colors.pink[800]!,
              interestRate: '11.0%',
              emi: '₹2,510',
              tenure: '5 Years',
              context: context,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAILoanCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [Color(0xFF4F46E5), Color(0xFF7C3AED)], // Indigo to Violet
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: const [
          BoxShadow(color: Color(0x4D4F46E5), blurRadius: 20, offset: Offset(0, 10)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(LucideIcons.sparkles, color: Colors.white, size: 20),
              ),
              const SizedBox(width: 12),
              const Text(
                'Best Loan for You',
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Based on your income & credit score',
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
          const SizedBox(height: 4),
          const Text(
            'HDFC Personal Loan',
            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
           const SizedBox(height: 8),
          const Row(
            children: [
              Text('Interest: 10.5%', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
              SizedBox(width: 16),
              Text('Max Amount: ₹15L', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF4F46E5),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 0,
              ),
              child: const Text('Check Eligibility', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCategoryItem(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey[100]!),
            boxShadow: AppColors.shadowSm,
          ),
          child: Icon(icon, color: color, size: 28),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.textMain)),
      ],
    );
  }

  Widget _buildComparisonCard({
    required String bankName,
    required Color logoColor,
    required String interestRate,
    required String emi,
    required String tenure,
    String? tag,
    required BuildContext context,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: AppColors.shadowSm,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                 width: 40, height: 40,
                 decoration: BoxDecoration(color: logoColor.withOpacity(0.1), shape: BoxShape.circle),
                 child: Center(child: Text(bankName[0], style: TextStyle(color: logoColor, fontWeight: FontWeight.bold))),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(bankName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.textPrimary)),
                  if (tag != null)
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(color: const Color(0xFFDCFCE7), borderRadius: BorderRadius.circular(4)), // green-100
                      child: Text(tag, style: const TextStyle(fontSize: 10, color: Color(0xFF166534), fontWeight: FontWeight.bold)), // green-800
                    ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(interestRate, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                  const Text('Interest Rate', style: TextStyle(fontSize: 10, color: AppColors.textSecondary)),
                ],
              ),
            ],
          ),
          const Divider(height: 24, color: Color(0xFFF3F4F6)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(emi, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  const Text('Monthly EMI', style: TextStyle(fontSize: 10, color: AppColors.textSecondary)),
                ],
              ),
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(tenure, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  const Text('Tenure', style: TextStyle(fontSize: 10, color: AppColors.textSecondary)),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  // context.push('/loans/apply');
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0), // Compact
                  minimumSize: const Size(0, 36),
                ),
                child: const Text('Apply'),
              )
            ],
          )
        ],
      ),
    );
  }
}
