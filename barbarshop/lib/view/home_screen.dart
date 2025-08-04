import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            // Header Section
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFF8B4513),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  // Top Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: CircleAvatar(
                              radius: 24,
                              backgroundColor: Color(0xFF8B4513),
                              child: Icon(Icons.person, color: Colors.white, size: 24),
                            ),
                          ),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Good Morning ☀️',
                                  style: TextStyle(fontSize: 14, color: Colors.white70)),
                              Text('John Barber',
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(Icons.notifications, color: Colors.white, size: 24),
                      ),
                    ],
                  ),

                  SizedBox(height: 30),

                  // Stats Cards Row
                  Row(
                    children: [
                      Expanded(child: _buildStatCard('25', 'Today\nCustomers', Color(0xFF4CAF50), Icons.people)),
                      SizedBox(width: 12),
                      Expanded(child: _buildStatCard('₹3,240', 'Today\nEarnings', Color(0xFF2196F3), Icons.attach_money)),
                      SizedBox(width: 12),
                      Expanded(child: _buildStatCard('₹98,500', 'Monthly\nTotal', Color(0xFFFF9800), Icons.trending_up)),
                    ],
                  ),

                  SizedBox(height: 20),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Services Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Services Today',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87)),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: Color(0xFFEDE7F6),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text('View All',
                              style: TextStyle(fontSize: 14, color: Color(0xFF8B4513), fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),

                    // Services Grid
                    Container(
                      height: 110,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildServiceCard(Icons.content_cut, 'Haircut', 12, Color(0xFF3F51B5)),
                          _buildServiceCard(Icons.spa, 'Grooming', 5, Color(0xFF009688)),
                          _buildServiceCard(Icons.brush, 'Shaving', 8, Color(0xFFFF5722)),
                          _buildServiceCard(Icons.face, 'Facial', 3, Color(0xFF9C27B0)),
                          _buildServiceCard(Icons.palette, 'Color', 2, Color(0xFFE91E63)),
                          _buildServiceCard(Icons.wash, 'Hair Wash', 7, Color(0xFF607D8B)),
                          _buildServiceCard(Icons.highlight, 'Highlights', 4, Color(0xFFFF9800)),
                          _buildServiceCard(Icons.style, 'Styling', 6, Color(0xFF795548)),
                          _buildServiceCard(Icons.health_and_safety, 'Treatment', 3, Color(0xFF009688)),
                        ],
                      ),
                    ),

                    SizedBox(height: 20),

                    // Time Slots Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('AVAILABLE TIME SLOTS',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Color(0xFFE8F5E8),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.schedule, color: Color(0xFF4CAF50), size: 20),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),

                    // Time Slots Grid
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 10,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          _buildTimeRow(['09:00 AM', '10:00 AM', '11:00 AM'], [false, true, false]),
                          SizedBox(height: 12),
                          _buildTimeRow(['12:00 PM', '01:00 PM', '02:00 PM'], [false, false, true]),
                          SizedBox(height: 12),
                          _buildTimeRow(['03:00 PM', '04:00 PM', '05:00 PM'], [false, false, false]),
                          SizedBox(height: 12),
                          _buildTimeRow(['06:00 PM', '07:00 PM', '08:00 PM'], [true, false, false]),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String value, String label, Color color, IconData icon) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 16),
          ),
          SizedBox(height: 8),
          Text(value,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
          SizedBox(height: 4),
          Text(label,
              style: TextStyle(fontSize: 10, color: Colors.grey[600]), textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _buildServiceCard(IconData icon, String name, int count, Color color) {
    return Container(
      width: 70,
      margin: EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          SizedBox(height: 8),
          Text(name,
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: Colors.black87),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis),
          SizedBox(height: 4),
          Text('$count',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }

  Widget _buildTimeRow(List<String> times, List<bool> booked) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: times.asMap().entries.map((entry) {
        int index = entry.key;
        String time = entry.value;
        bool isBooked = booked[index];

        return Container(
          width: 80,
          height: 45,
          decoration: BoxDecoration(
            color: isBooked ? Color(0xFF8B4513) : Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isBooked ? Color(0xFF8B4513) : Colors.grey[300]!,
            ),
          ),
          child: Center(
            child: Text(
              time,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: isBooked ? Colors.white : Colors.black87,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}