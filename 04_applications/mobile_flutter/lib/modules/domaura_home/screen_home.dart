import 'package:flutter/material.dart';

import '../../coeur_core/theme.dart';

class DomauraHomeShell extends StatefulWidget {
  const DomauraHomeShell({super.key});

  @override
  State<DomauraHomeShell> createState() => _DomauraHomeShellState();
}

class _DomauraHomeShellState extends State<DomauraHomeShell> {
  int _currentIndex = 0;

  final List<Widget> _tabs = const [
    _HomeTab(),
    _ListingsTab(),
    _ProfileTab(),
    _AddPropertyTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DOMAURA'),
        centerTitle: true,
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        indicatorColor: DomauraColors.gold.withOpacity(0.24),
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.list_alt_outlined), label: 'Listings'),
          NavigationDestination(icon: Icon(Icons.person_outline), label: 'Profile'),
          NavigationDestination(icon: Icon(Icons.add_box_outlined), label: 'Add'),
        ],
      ),
    );
  }
}

class _HomeTab extends StatelessWidget {
  const _HomeTab();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Home', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        const _SearchBar(),
        const SizedBox(height: 12),
        const _FilterRow(),
        const SizedBox(height: 14),
        const _PropertyCard(
          title: 'Modern 4-bedroom villa',
          location: 'Yaounde, Bastos',
          price: r'$350,000',
        ),
        const SizedBox(height: 12),
        const _PropertyCard(
          title: 'City view apartment',
          location: 'Douala, Bonapriso',
          price: r'$210,000',
        ),
      ],
    );
  }
}

class _ListingsTab extends StatelessWidget {
  const _ListingsTab();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        _SearchBar(),
        SizedBox(height: 12),
        _FilterRow(),
        SizedBox(height: 12),
        _PropertyCard(
          title: 'Family house',
          location: 'Kribi, Ocean district',
          price: r'$175,000',
        ),
        SizedBox(height: 12),
        _PropertyCard(
          title: 'Luxury duplex',
          location: 'Douala, Bonanjo',
          price: r'$420,000',
        ),
      ],
    );
  }
}

class _ProfileTab extends StatelessWidget {
  const _ProfileTab();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: const [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: DomauraColors.gold,
                  child: Text(
                    'AM',
                    style: TextStyle(
                      color: DomauraColors.navy,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ama',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    Text('Premium profile'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _AddPropertyTab extends StatelessWidget {
  const _AddPropertyTab();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Add Property', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 12),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Property title',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Address',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Price',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: DomauraColors.navy,
                      foregroundColor: DomauraColors.white,
                    ),
                    onPressed: () {},
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        hintText: 'Explore property type',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
    );
  }
}

class _FilterRow extends StatelessWidget {
  const _FilterRow();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: const [
        _FilterChip(label: 'All', active: true),
        _FilterChip(label: 'House'),
        _FilterChip(label: 'Apartment'),
        _FilterChip(label: 'For sale'),
      ],
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    this.active = false,
  });

  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: active ? const Color(0xFFFFF8E1) : Colors.white,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: active ? DomauraColors.gold : DomauraColors.border,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: DomauraColors.navy,
          fontWeight: active ? FontWeight.w600 : FontWeight.w500,
        ),
      ),
    );
  }
}

class _PropertyCard extends StatelessWidget {
  const _PropertyCard({
    required this.title,
    required this.location,
    required this.price,
  });

  final String title;
  final String location;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                  colors: [Color(0xFFDBEAFE), Color(0xFFBFDBFE)],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: DomauraColors.navy,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              location,
              style: const TextStyle(color: DomauraColors.muted),
            ),
            const SizedBox(height: 8),
            Text(
              price,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: DomauraColors.navy,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: DomauraColors.navy,
                  foregroundColor: DomauraColors.white,
                ),
                onPressed: () {},
                child: const Text('Contact / Book'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

