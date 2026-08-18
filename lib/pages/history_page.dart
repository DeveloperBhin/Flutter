import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  final VoidCallback onBack;

  const HistoryPage({
    super.key,
    required this.onBack,
  });

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final TextEditingController _searchController = TextEditingController();

  String selectedPlant = 'All Plants';

  final List<String> plants = [
    'All Plants',
    'Tomato',
    'Maize',
    'Potato',
    'Banana',
  ];

  final List<Map<String, String>> scans = [
    {
      'plant': 'Tomato',
      'image': 'assets/images/tomato.jpg',
      'title': 'TOMATO PLANT',
    },
    {
      'plant': 'Maize',
      'image': 'assets/images/maize.jpg',
      'title': 'MAIZE CORN',
    },
    {
      'plant': 'Potato',
      'image': 'assets/images/potato.jpg',
      'title': 'POTATO LEAF',
    },
    {
      'plant': 'Banana',
      'image': 'assets/images/banana.jpg',
      'title': 'BANANA TREE',
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Map<String, String>> get filteredScans {
    final search = _searchController.text.toLowerCase().trim();

    return scans.where((scan) {
      final plant = scan['plant']!.toLowerCase();
      final title = scan['title']!.toLowerCase();

      final matchesSearch =
          search.isEmpty ||
          plant.contains(search) ||
          title.contains(search);

      final matchesPlant =
          selectedPlant == 'All Plants' ||
          scan['plant'] == selectedPlant;

      return matchesSearch && matchesPlant;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        leading: IconButton(
          onPressed: widget.onBack,
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),

        title: const Text(
          'Scan History',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),

        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ------------------------------------------------
            // SEARCH
            // ------------------------------------------------
            TextField(
              controller: _searchController,
              onChanged: (_) {
                setState(() {});
              },
              decoration: InputDecoration(
                hintText: 'Search your scans...',
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),

                suffixIcon:
                    _searchController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              _searchController.clear();

                              setState(() {});
                            },
                          )
                        : null,

                filled: true,
                fillColor: Colors.grey.shade100,

                contentPadding: const EdgeInsets.symmetric(
                  vertical: 14,
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ------------------------------------------------
            // PLANT FILTER
            // ------------------------------------------------
            const Text(
              'Select Plant',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              height: 42,

              child: ListView.separated(
                scrollDirection: Axis.horizontal,

                itemCount: plants.length,

                separatorBuilder: (_, __) =>
                    const SizedBox(width: 8),

                itemBuilder: (context, index) {
                  final plant = plants[index];

                  final isSelected =
                      selectedPlant == plant;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPlant = plant;
                      });
                    },

                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),

                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.green
                            : Colors.grey.shade100,

                        borderRadius:
                            BorderRadius.circular(20),

                        border: Border.all(
                          color: isSelected
                              ? Colors.green
                              : Colors.grey.shade300,
                        ),
                      ),

                      child: Text(
                        plant,

                        style: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : Colors.black87,

                          fontWeight: FontWeight.w600,

                          fontSize: 13,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 28),

            // ------------------------------------------------
            // RECENT SCANS
            // ------------------------------------------------
            const Text(
              'Recent Scans',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              'View your previous plant disease detection results',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 20),

            // ------------------------------------------------
            // FILTERED SCANS
            // ------------------------------------------------
            if (filteredScans.isEmpty)
              _emptyResults()
            else
              ...filteredScans.map(
                (scan) => Padding(
                  padding: const EdgeInsets.only(
                    bottom: 12,
                  ),

                  child: _recentScanCard(
                    image: scan['image']!,
                    title: scan['title']!,
                  ),
                ),
              ),

            const SizedBox(height: 16),

            // ------------------------------------------------
            // HELPFUL TIPS
            // ------------------------------------------------
            // const Text(
            //   'Health Tips',
            //   style: TextStyle(
            //     fontSize: 20,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),

            const SizedBox(height: 12),

            Container(
              width: double.infinity,

              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                color: Colors.green.shade50,

                borderRadius:
                    BorderRadius.circular(14),

                border: Border.all(
                  color: Colors.green.shade100,
                ),
              ),

              child: Column(
                children: [

                  _hintItem(
                    icon: Icons.article,
                    title: 'Health Tips',
                    description:
                        'Regularly scanning your crops help detect early signs of infestation before they spread',
                  ),





                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // ------------------------------------------------
  // EMPTY SEARCH RESULT
  // ------------------------------------------------

  Widget _emptyResults() {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.symmetric(
        vertical: 35,
        horizontal: 20,
      ),

      decoration: BoxDecoration(
        color: Colors.grey.shade50,

        borderRadius: BorderRadius.circular(14),

        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),

      child: Column(
        children: const [
          Icon(
            Icons.search_off,
            size: 45,
            color: Colors.grey,
          ),

          SizedBox(height: 10),

          Text(
            'No scans found',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 5),

          Text(
            'Try another search or select a different plant.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  // ------------------------------------------------
  // HELPFUL TIP
  // ------------------------------------------------

  Widget _hintItem({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Container(
          padding: const EdgeInsets.all(9),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),

          child: Icon(
            icon,
            color: Colors.green,
            size: 22,
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [
              Text(
                title,

                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 3),

              Text(
                description,

                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ------------------------------------------------
  // SCAN CARD
  // ------------------------------------------------

  Widget _recentScanCard({
    required String image,
    required String title,
  }) {
    return Container(
      width: double.infinity,
      height: 180,

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
            BorderRadius.circular(12),

        border: Border.all(
          color: Colors.grey.shade200,
        ),

        boxShadow: [
          BoxShadow(
            color:
                Colors.black.withOpacity(0.04),

            blurRadius: 5,

            offset: const Offset(0, 2),
          ),
        ],
      ),

      clipBehavior: Clip.antiAlias,

      child: Row(
        children: [

          // IMAGE
          SizedBox(
            width: 150,
            height: double.infinity,

            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),

          // INFORMATION
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.all(14),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                mainAxisAlignment:
                    MainAxisAlignment.center,

                children: [
                  Text(
                    title,

                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),

                    maxLines: 2,

                    overflow:
                        TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'View detection result',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: const [
                      Icon(
                        Icons.history,
                        size: 17,
                        color: Colors.green,
                      ),

                      SizedBox(width: 6),

                      Text(
                        'Previous scan',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.green,
                          fontWeight:
                              FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // ARROW
          const Padding(
            padding:
                EdgeInsets.only(right: 10),

            child: Icon(
              Icons.chevron_right,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}