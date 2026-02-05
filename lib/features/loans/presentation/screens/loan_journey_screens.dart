import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import 'package:citizenone_app/core/design_system/tokens/colors.dart';

// --- Step 2: Eligibility Check ---
class LoanEligibilityScreen extends StatefulWidget {
  const LoanEligibilityScreen({super.key});

  @override
  State<LoanEligibilityScreen> createState() => _LoanEligibilityScreenState();
}

class _LoanEligibilityScreenState extends State<LoanEligibilityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Check Eligibility', style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Tell us a bit about yourself', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('We will use this to find the best loan offers for you.', style: TextStyle(color: AppColors.textSecondary)),
            const SizedBox(height: 32),
            
            _buildTextField('Monthly Income', 'e.g. 50000', Icons.currency_rupee),
            const SizedBox(height: 20),
            _buildDropdown('Employment Type', ['Salaried', 'Self-Employed', 'Business Owner']),
            const SizedBox(height: 20),
            _buildTextField('City', 'e.g. Bengaluru', Icons.location_city),
            const SizedBox(height: 20),
             _buildTextField('PAN Number (Optional)', 'Check credit score', Icons.credit_card),

             const SizedBox(height: 40),
             SizedBox(
               width: double.infinity,
               height: 56,
               child: ElevatedButton(
                 onPressed: () {
                   context.push('/loans/recommendation');
                 },
                 style: ElevatedButton.styleFrom(
                   backgroundColor: AppColors.primary,
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                 ),
                 child: const Text('Check Offers', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
               ),
             )
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon, color: Colors.grey),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey[300]!)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey[300]!)),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.primary)),
            filled: true,
            fillColor: Colors.grey[50],
          ),
        ),
      ],
    );
  }

   Widget _buildDropdown(String label, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey[300]!)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey[300]!)),
             filled: true,
            fillColor: Colors.grey[50],
          ),
          items: items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
          onChanged: (v) {},
          hint: const Text('Select'),
        ),
      ],
    );
  }
}

// --- Step 3: AI Recommendation ---
class AILoanRecommendationScreen extends StatelessWidget {
  const AILoanRecommendationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary), onPressed: () => context.pop()),
        title: const Text('AI Analysis', style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // AI Badge
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFFE0E7FF),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(LucideIcons.sparkles, size: 16, color: AppColors.primary),
                    SizedBox(width: 8),
                    Text('Best Match Found', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            // Recommendation Card
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFF4F46E5), Color(0xFF7C3AED)]),
                borderRadius: BorderRadius.circular(24),
                boxShadow: const [BoxShadow(color: Color(0x4D4F46E5), blurRadius: 20, offset: Offset(0, 10))],
              ),
              child: Column(
                children: [
                  const Text('HDFC Personal Loan', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text('Highest approval chance for your profile', style: TextStyle(color: Colors.white70)),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildRecStat('10.5%', 'Interest'),
                      Container(width: 1, height: 40, color: Colors.white24),
                      _buildRecStat('5 Lac', 'Amount'),
                      Container(width: 1, height: 40, color: Colors.white24),
                      _buildRecStat('5 Yrs', 'Tenure'),
                    ],
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () => context.push('/loans/apply'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.primary,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    child: const Text('Proceed with this Offer', style: TextStyle(fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Text('Or compare with others', style: TextStyle(color: AppColors.textSecondary)),
            const SizedBox(height: 16),
            OutlinedButton(
               onPressed: () => context.push('/loans/compare'),
               style: OutlinedButton.styleFrom(
                 minimumSize: const Size(double.infinity, 50),
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
               ),
               child: const Text('View Comparison Table'),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRecStat(String val, String label) {
    return Column(
      children: [
        Text(val, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12)),
      ],
    );
  }
}

// --- Step 4: Comparison ---
class LoanComparisonScreen extends StatelessWidget {
  const LoanComparisonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: const Text('Compare Loans'), backgroundColor: Colors.white, elevation: 0, foregroundColor: Colors.black),
       body: ListView(
         padding: const EdgeInsets.all(16),
         children: [
           _buildCompareHeader(),
           _buildCompareRow('Interest Rate', '10.5%', '10.75%', '11.0%'),
           _buildCompareRow('Processing Fee', '₹1,500', '₹2,000', '₹999'),
           _buildCompareRow('Tenure', '5 Yrs', '5 Yrs', '4 Yrs'),
           _buildCompareRow('Final EMI', '₹2,450', '₹2,480', '₹2,510'),
           const SizedBox(height: 24),
           Row(
             children: [
                Expanded(child: ElevatedButton(onPressed: () => context.push('/loans/apply'), child: const Text('Select HDFC'))),
                const SizedBox(width: 8),
                Expanded(child: OutlinedButton(onPressed: () => context.push('/loans/apply'), child: const Text('Select ICICI'))),
             ],
           )
         ],
       ),
    );
  }

  Widget _buildCompareHeader() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Expanded(flex: 2, child: SizedBox()),
          Expanded(flex: 2, child: Center(child: Text('HDFC', style: TextStyle(fontWeight: FontWeight.bold)))),
          Expanded(flex: 2, child: Center(child: Text('ICICI', style: TextStyle(fontWeight: FontWeight.bold)))),
          Expanded(flex: 2, child: Center(child: Text('Axis', style: TextStyle(fontWeight: FontWeight.bold)))),
        ],
      ),
    );
  }

  Widget _buildCompareRow(String label, String v1, String v2, String v3) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[200]!))),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text(label, style: const TextStyle(color: AppColors.textSecondary))),
          Expanded(flex: 2, child: Center(child: Text(v1, style: const TextStyle(fontWeight: FontWeight.bold)))),
          Expanded(flex: 2, child: Center(child: Text(v2))),
          Expanded(flex: 2, child: Center(child: Text(v3))),
        ],
      ),
    );
  }
}

// --- Step 5: Application Form ---
class LoanApplicationScreen extends StatefulWidget {
  const LoanApplicationScreen({super.key});

  @override
  State<LoanApplicationScreen> createState() => _LoanApplicationScreenState();
}

class _LoanApplicationScreenState extends State<LoanApplicationScreen> {
  int _step = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Application'), backgroundColor: Colors.white, elevation: 0, foregroundColor: Colors.black),
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: _step,
        onStepContinue: () {
          if (_step < 2) {
            setState(() => _step++);
          } else {
             context.go('/loans/status');
          }
        },
        onStepCancel: () {
           if (_step > 0) setState(() => _step--);
        },
        controlsBuilder: (context, details) {
           return Padding(
             padding: const EdgeInsets.only(top: 24),
             child: Row(
               children: [
                 Expanded(
                   child: ElevatedButton(
                     onPressed: details.onStepContinue,
                     style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, padding: const EdgeInsets.symmetric(vertical: 16)),
                     child: Text(_step == 2 ? 'Submit Application' : 'Continue', style: const TextStyle(color: Colors.white)),
                   ),
                 ),
                 if (_step > 0) ...[
                   const SizedBox(width: 16),
                   TextButton(onPressed: details.onStepCancel, child: const Text('Back')),
                 ]
               ],
             ),
           );
        },
        steps: [
          Step(
            title: const Text('Personal'),
            content: Column(children: [
              TextFormField(decoration: const InputDecoration(labelText: 'Full Name', border: OutlineInputBorder())),
              const SizedBox(height: 16),
              TextFormField(decoration: const InputDecoration(labelText: 'Email', border: OutlineInputBorder())),
            ]),
            isActive: _step >= 0,
          ),
          Step(
            title: const Text('KYC'),
            content: Column(children: [
              Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(8)), child: const Row(children: [Icon(Icons.upload), SizedBox(width: 8), Text('Upload Aadhar Card')])),
              const SizedBox(height: 16),
              Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(8)), child: const Row(children: [Icon(Icons.upload), SizedBox(width: 8), Text('Upload PAN Card')])),
             ]),
            isActive: _step >= 1,
          ),
          Step(
            title: const Text('Review'),
             content: const Text('Please review all details before submitting.'),
             isActive: _step >= 2,
          ),
        ],
      ),
    );
  }
}

// --- Step 6: Status ---
class LoanStatusScreen extends StatelessWidget {
  const LoanStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  color: Color(0xFFDCFCE7), // green-100
                  shape: BoxShape.circle,
                ),
                child: const Icon(LucideIcons.check, size: 48, color: Color(0xFF15803D)),
              ),
              const SizedBox(height: 32),
              const Text('Application Submitted!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
              const SizedBox(height: 16),
              const Text('Your application ID is #CO-88291. We will update you shortly.', textAlign: TextAlign.center, style: TextStyle(color: AppColors.textSecondary)),
               const SizedBox(height: 48),
               ElevatedButton(
                 onPressed: () => context.go('/home'),
                 style: ElevatedButton.styleFrom(
                   minimumSize: const Size(double.infinity, 56),
                   backgroundColor: AppColors.primary,
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                 ),
                 child: const Text('Back to Home', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
               )
            ],
          ),
        ),
      ),
    );
  }
}
