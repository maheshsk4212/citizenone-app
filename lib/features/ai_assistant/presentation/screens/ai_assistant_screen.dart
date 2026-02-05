import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:citizenone_app/core/design_system/tokens/colors.dart';
import 'package:go_router/go_router.dart';

class AIAssistantScreen extends StatelessWidget {
  const AIAssistantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Row(
          children: [
            Icon(LucideIcons.sparkles, color: AppColors.primary, size: 20),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Citizen AI', style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold, fontSize: 16)),
                Text('Always here to help', style: TextStyle(color: AppColors.textSecondary, fontSize: 10)),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.close, color: Colors.grey), onPressed: () => context.go('/home')),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                _buildMessage(
                  isUser: false,
                  content: "Hello Mahesh! I noticed you are eligible for a personal loan up to ₹15L with lower interest rates. Would you like to explore?",
                ),
                 _buildMessage(
                  isUser: true,
                  content: "Yes, tell me more about the interest rates.",
                ),
                _buildMessage(
                  isUser: false,
                  content: "Sure! HDFC is offering 10.5% p.a. specially for you. \n\nIf you take ₹5L for 5 years, your EMI will be ₹10,747. You save ₹1,200 compared to standard rates!",
                  hasAction: true,
                ),
              ],
            ),
          ),
          _buildInputArea(),
        ],
      ),
    );
  }

  Widget _buildMessage({required bool isUser, required String content, bool hasAction = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isUser) ...[
             const CircleAvatar(
               backgroundColor: AppColors.primary,
               radius: 16,
               child: Icon(LucideIcons.sparkles, size: 16, color: Colors.white),
             ),
             const SizedBox(width: 12),
          ],
          Flexible(
            child: Column(
              crossAxisAlignment: isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isUser ? AppColors.primary : Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(20),
                      topRight: const Radius.circular(20),
                      bottomLeft: isUser ? const Radius.circular(20) : const Radius.circular(4),
                      bottomRight: isUser ? const Radius.circular(4) : const Radius.circular(20),
                    ),
                    boxShadow: isUser ? [] : [
                       BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 4, offset: const Offset(0, 2))
                    ],
                  ),
                  child: Text(
                    content,
                    style: TextStyle(color: isUser ? Colors.white : AppColors.textPrimary, height: 1.5),
                  ),
                ),
                if (hasAction && !isUser) ...[
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    children: [
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                        child: const Text('Apply Now'),
                      ),
                       OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                        child: const Text('Compare'),
                      ),
                    ],
                  )
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Ask anything...',
                fillColor: Colors.grey[100],
                filled: true,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              ),
            ),
          ),
          const SizedBox(width: 12),
          CircleAvatar(
            backgroundColor: AppColors.primary,
            radius: 24,
            child: IconButton(icon: const Icon(LucideIcons.send, color: Colors.white, size: 20), onPressed: () {}),
          )
        ],
      ),
    );
  }
}
