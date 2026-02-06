import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:citizenone_app/features/loans/domain/entities/loan_offer.dart';
import 'package:citizenone_app/features/loans/domain/entities/loan_application.dart';

class LoanState {
  final List<LoanOffer> allOffers;
  final List<String> selectedOfferIds;
  final String filterType; // 'all', 'lowest_rate', 'fastest'

  const LoanState({
    required this.allOffers,
    this.selectedOfferIds = const [],
    this.filterType = 'all',
  });

  LoanState copyWith({
    List<LoanOffer>? allOffers,
    List<String>? selectedOfferIds,
    String? filterType,
  }) {
    return LoanState(
      allOffers: allOffers ?? this.allOffers,
      selectedOfferIds: selectedOfferIds ?? this.selectedOfferIds,
      filterType: filterType ?? this.filterType,
    );
  }

  List<LoanOffer> get filteredOffers {
    if (filterType == 'lowest_rate') {
      final sorted = List<LoanOffer>.from(allOffers);
      sorted.sort((a, b) => a.interestRate.compareTo(b.interestRate));
      return sorted;
    } else if (filterType == 'fastest') {
      return allOffers.where((offer) => offer.isPreApproved).toList();
    }
    return allOffers;
  }

  List<LoanOffer> get selectedOffers {
    return allOffers.where((offer) => selectedOfferIds.contains(offer.id)).toList();
  }
}

class LoanNotifier extends StateNotifier<LoanState> {
  LoanNotifier() : super(LoanState(allOffers: _mockLoanOffers));

  void setFilter(String filterType) {
    state = state.copyWith(filterType: filterType);
  }

  void toggleOfferSelection(String offerId) {
    final selected = List<String>.from(state.selectedOfferIds);
    if (selected.contains(offerId)) {
      selected.remove(offerId);
    } else {
      selected.add(offerId);
    }
    state = state.copyWith(selectedOfferIds: selected);
  }

  void clearSelection() {
    state = state.copyWith(selectedOfferIds: []);
  }
}

final loanProvider = StateNotifierProvider<LoanNotifier, LoanState>((ref) {
  return LoanNotifier();
});

// Mock data for loan offers
final List<LoanOffer> _mockLoanOffers = [
  const LoanOffer(
    id: '1',
    bankName: 'Zanaco',
    bankLogo: 'assets/banks/zanaco.png',
    interestRate: 12.5,
    tenure: '12-60 months',
    processingFee: 1.5,
    emi: 2400,
    maxAmount: 500000,
    features: ['Quick Disbursal', 'No Pre-closure charges'],
    isPreApproved: true,
  ),
  const LoanOffer(
    id: '2',
    bankName: 'FNB Zambia',
    bankLogo: 'assets/banks/fnb.png',
    interestRate: 13.0,
    tenure: '12-48 months',
    processingFee: 1.0,
    emi: 2400,
    maxAmount: 350000,
    features: ['Online Application', 'Flexible Tenure'],
    isPreApproved: true,
  ),
  const LoanOffer(
    id: '3',
    bankName: 'Absa Bank',
    bankLogo: 'assets/banks/absa.png',
    interestRate: 11.8,
    tenure: '6-72 months',
    processingFee: 2.0,
    emi: 2400,
    maxAmount: 600000,
    features: ['High Loan Amount', 'Doorstep Service'],
    isPreApproved: true,
  ),
  const LoanOffer(
    id: '4',
    bankName: 'Indo Zambia',
    bankLogo: 'assets/banks/indo.png',
    interestRate: 11.5,
    tenure: '12-60 months',
    processingFee: 1.2,
    emi: 2400,
    maxAmount: 450000,
    features: ['Low Interest', 'Fast Approval'],
    isPreApproved: false,
  ),
];

// Mock loan applications
final List<LoanApplication> mockLoanApplications = [
  LoanApplication(
    id: '1',
    loanType: 'Personal Loan',
    bankName: 'Zanaco',
    amount: 50000,
    referenceNumber: 'LN-2024-8892',
    status: 'Credit Scoring',
    lastUpdate: DateTime(2024, 2, 1),
    progressPercentage: 0.45,
  ),
  LoanApplication(
    id: '2',
    loanType: 'Vehicle Loan',
    bankName: 'FNB Zambia',
    amount: 120000,
    referenceNumber: 'LN-2023-1102',
    status: 'Approved',
    lastUpdate: DateTime(2023, 11, 15),
    progressPercentage: 1.0,
  ),
];
