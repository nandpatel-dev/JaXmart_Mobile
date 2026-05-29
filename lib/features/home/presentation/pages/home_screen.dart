import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 900;
  bool isTablet(BuildContext context) => MediaQuery.of(context).size.width >= 900 && MediaQuery.of(context).size.width < 1200;

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);
    
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: mobile ? _buildMobileAppBar() : null,
      drawer: mobile ? _buildDrawer() : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (!mobile) _buildTopBar(),
            if (!mobile) _buildHeader(context),
            _buildLiveFeedBar(mobile),
            SizedBox(height: mobile ? 16 : 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: mobile ? 16 : 40),
              child: mobile 
                  ? Column(
                      children: [
                        _buildMiddleContent(mobile),
                        const SizedBox(height: 24),
                        _buildRightSidebar(mobile),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 2, child: _buildLeftSidebar()),
                        const SizedBox(width: 24),
                        Expanded(flex: 5, child: _buildMiddleContent(mobile)),
                        const SizedBox(width: 24),
                        Expanded(flex: 2, child: _buildRightSidebar(mobile)),
                      ],
                    ),
            ),
            SizedBox(height: mobile ? 32 : 48),
            _buildPremiumListings(context, mobile),
            SizedBox(height: mobile ? 32 : 48),
            _buildBrowseMarkets(mobile),
            SizedBox(height: mobile ? 40 : 64),
            _buildFooter(mobile),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildMobileAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFF0F172A),
      iconTheme: const IconThemeData(color: Colors.white),
      title: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('JM', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
          SizedBox(width: 8),
          Text('JaXmart', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
        ],
      ),
      actions: [
        IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        IconButton(icon: const Icon(Icons.person_outline), onPressed: () {}),
      ],
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Color(0xFF0F172A)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('JaXmart', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text('Welcome back!', style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          ListTile(leading: const Icon(Icons.home), title: const Text('Home'), onTap: () {}),
          ListTile(leading: const Icon(Icons.category), title: const Text('Products'), onTap: () {}),
          ListTile(leading: const Icon(Icons.request_quote), title: const Text('Buyer Requests'), onTap: () {}),
          const Divider(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text('CATEGORIES', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
          ),
          _sidebarItem(Icons.architecture, 'Construction'),
          _sidebarItem(Icons.electrical_services, 'Electronics'),
          _sidebarItem(Icons.precision_manufacturing, 'Industrial Supplies'),
          _sidebarItem(Icons.handyman, 'Services'),
          _sidebarItem(Icons.checkroom, 'Textiles'),
        ],
      ),
    );
  }

  Widget _buildTopBar() {
    return Container(
      color: const Color(0xFF0F172A),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.verified, color: Color(0xFF10B981), size: 16),
              const SizedBox(width: 8),
              const Text('Verified Suppliers', style: TextStyle(color: Colors.white70, fontSize: 12)),
              const SizedBox(width: 16),
              Container(width: 1, height: 12, color: Colors.white24),
              const SizedBox(width: 16),
              const Icon(Icons.security, color: Color(0xFF3B82F6), size: 16),
              const SizedBox(width: 8),
              const Text('Escrow Protection', style: TextStyle(color: Colors.white70, fontSize: 12)),
            ],
          ),
          Row(
            children: [
              const Text('Sign In', style: TextStyle(color: Colors.white70, fontSize: 12)),
              const SizedBox(width: 16),
              Container(width: 1, height: 12, color: Colors.white24),
              const SizedBox(width: 16),
              const Text('Join Free', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
      child: Row(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(color: const Color(0xFF0F172A), borderRadius: BorderRadius.circular(8)),
                child: const Text('JM', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
              ),
              const SizedBox(width: 8),
              const Text('JaXmart', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
            ],
          ),
          const SizedBox(width: 48),
          Expanded(
            child: Container(
              height: 44,
              decoration: BoxDecoration(border: Border.all(color: Colors.grey[300]!), borderRadius: BorderRadius.circular(6)),
              child: Row(
                children: [
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(decoration: InputDecoration(hintText: 'Search products, suppliers, categories...', border: InputBorder.none, isDense: true)),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 44,
                    decoration: const BoxDecoration(color: Color(0xFF1E293B), borderRadius: BorderRadius.horizontal(right: Radius.circular(5))),
                    child: const Icon(Icons.search, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 48),
          if (!isTablet(context)) ...[
            Row(
              children: [
                _navLink('Home', isActive: true),
                const SizedBox(width: 24),
                _navLink('Products'),
                const SizedBox(width: 24),
                _navLink('Buyer Requests'),
                const SizedBox(width: 24),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E293B),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                  ),
                  child: const Text('Post Request'),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _navLink(String title, {bool isActive = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: isActive ? BoxDecoration(color: const Color(0xFFE0F2FE), borderRadius: BorderRadius.circular(20)) : null,
      child: Text(
        title,
        style: TextStyle(
          fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
          color: isActive ? const Color(0xFF0284C7) : const Color(0xFF475569),
        ),
      ),
    );
  }

  Widget _buildLiveFeedBar(bool mobile) {
    return Container(
      color: const Color(0xFFF0FDF4),
      padding: EdgeInsets.symmetric(horizontal: mobile ? 16 : 40, vertical: 12),
      child: mobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(color: const Color(0xFF10B981), borderRadius: BorderRadius.circular(4)),
                      child: const Text('LIVE B2B FEED', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text('Supplier Swastik Industries Pvt Ltd got verified', style: TextStyle(fontSize: 12, color: Color(0xFF0F172A)), overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Row(
                  children: [
                    Text('View Live RFQ Board', style: TextStyle(color: Color(0xFF10B981), fontWeight: FontWeight.bold, fontSize: 12)),
                    SizedBox(width: 4),
                    Icon(Icons.arrow_forward, color: Color(0xFF10B981), size: 14),
                  ],
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(color: const Color(0xFF10B981), borderRadius: BorderRadius.circular(4)),
                      child: const Text('LIVE B2B FEED', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(width: 12),
                    const Text('Supplier Swastik Industries Pvt Ltd got verified under GSTIN & PAN', style: TextStyle(fontSize: 13, color: Color(0xFF0F172A))),
                  ],
                ),
                const Row(
                  children: [
                    Text('View Live RFQ Board', style: TextStyle(color: Color(0xFF10B981), fontWeight: FontWeight.bold, fontSize: 13)),
                    SizedBox(width: 4),
                    Icon(Icons.arrow_forward, color: Color(0xFF10B981), size: 16),
                  ],
                ),
              ],
            ),
    );
  }

  Widget _buildLeftSidebar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color(0xFF0F172A),
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            ),
            child: const Row(
              children: [
                Icon(Icons.list, color: Colors.white, size: 20),
                SizedBox(width: 8),
                Text('ALL MARKETS & INDUSTRIES', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
              ],
            ),
          ),
          _sidebarItem(Icons.architecture, 'Construction'),
          _sidebarItem(Icons.electrical_services, 'Electronics'),
          _sidebarItem(Icons.precision_manufacturing, 'Industrial Supplies'),
          _sidebarItem(Icons.handyman, 'Services'),
          _sidebarItem(Icons.checkroom, 'Textiles'),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _sidebarItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, size: 18, color: const Color(0xFF64748B)),
              const SizedBox(width: 12),
              Text(title, style: const TextStyle(color: Color(0xFF334155), fontWeight: FontWeight.w500)),
            ],
          ),
          const Icon(Icons.chevron_right, size: 16, color: Color(0xFFCBD5E1)),
        ],
      ),
    );
  }

  Widget _buildMiddleContent(bool mobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (mobile) ...[
          Container(
            height: 48,
            decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.grey[300]!), borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(decoration: InputDecoration(hintText: 'Search products...', border: InputBorder.none)),
                  ),
                ),
                Container(
                  width: 60,
                  height: 48,
                  decoration: const BoxDecoration(color: Color(0xFF1E293B), borderRadius: BorderRadius.horizontal(right: Radius.circular(7))),
                  child: const Icon(Icons.search, color: Colors.white, size: 18),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
        if (!mobile) ...[
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(color: const Color(0xFF1E293B), borderRadius: BorderRadius.circular(20)),
                child: const Text('PRODUCTS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
              ),
              const SizedBox(width: 16),
              const Text('SUPPLIERS', style: TextStyle(color: Color(0xFF64748B), fontWeight: FontWeight.bold, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            height: 48,
            decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.grey[300]!), borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(decoration: InputDecoration(hintText: 'Enter keywords, HSN codes, or brands...', border: InputBorder.none)),
                  ),
                ),
                Container(
                  width: 100,
                  height: 48,
                  decoration: const BoxDecoration(color: Color(0xFF1E293B), borderRadius: BorderRadius.horizontal(right: Radius.circular(7))),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.search, color: Colors.white, size: 18),
                      SizedBox(width: 6),
                      Text('Search', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const Text('Hot Searches: Solar Panels • TMT Steel • Cotton Yarn', style: TextStyle(color: Color(0xFF64748B), fontSize: 12)),
          const SizedBox(height: 24),
        ],
        Container(
          height: mobile ? 220 : 300,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: const DecorationImage(
              image: NetworkImage('https://images.unsplash.com/photo-1581091226825-a6a2a5aee158?q=80&w=2000&auto=format&fit=crop'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.8), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            padding: EdgeInsets.all(mobile ? 20 : 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFF10B981).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: const Color(0xFF10B981).withOpacity(0.5)),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.event, color: Color(0xFF10B981), size: 14),
                      SizedBox(width: 6),
                      Text('UPCOMING EVENT', style: TextStyle(color: Color(0xFF10B981), fontWeight: FontWeight.bold, fontSize: 10)),
                    ],
                  ),
                ),
                SizedBox(height: mobile ? 8 : 16),
                Text(
                  'GREEN TECHNOLOGY SUMMIT',
                  style: TextStyle(color: Colors.white, fontSize: mobile ? 18 : 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: mobile ? 4 : 8),
                if (!mobile) ...[
                  const Text(
                    'Discover modern solar tech, energy-efficient manufacturing processes, and green logistics solutions for sustainable industrial growth.',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 24),
                ],
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.white70, size: 14),
                        SizedBox(width: 4),
                        Text('Virtual (Online)', style: TextStyle(color: Colors.white70, fontSize: 12)),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3B82F6),
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: mobile ? 12 : 24, vertical: mobile ? 8 : 16),
                      ),
                      child: Text(mobile ? 'JOIN \u2192' : 'REGISTER FREE \u2192', style: TextStyle(fontSize: mobile ? 12 : 14)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRightSidebar(bool mobile) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(mobile ? 16 : 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(Icons.flash_on, color: Color(0xFF10B981)),
                  SizedBox(width: 8),
                  Text('INSTANT RFQ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ],
              ),
              const SizedBox(height: 4),
              const Text('Get multiple quotes in 24 hours', style: TextStyle(color: Color(0xFF64748B), fontSize: 12)),
              SizedBox(height: mobile ? 12 : 20),
              const Text('WHAT PRODUCT DO YOU NEED?', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF64748B))),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  hintText: 'e.g. Cotton Yarn 30s',
                  hintStyle: const TextStyle(fontSize: 13),
                  filled: true,
                  fillColor: const Color(0xFFF8FAFC),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide.none),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('QTY', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF64748B))),
                        const SizedBox(height: 8),
                        TextField(
                          decoration: InputDecoration(
                            hintText: '100',
                            filled: true,
                            fillColor: const Color(0xFFF8FAFC),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide.none),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('UNIT', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF64748B))),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                          decoration: BoxDecoration(color: const Color(0xFFF8FAFC), borderRadius: BorderRadius.circular(6)),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Pieces', style: TextStyle(fontSize: 12)),
                              Icon(Icons.keyboard_arrow_down, size: 16, color: Color(0xFF64748B)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: mobile ? 16 : 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E293B),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                  ),
                  child: const Text('POST REQUEST \u2192'),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Container(
          padding: EdgeInsets.all(mobile ? 16 : 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(Icons.verified_user, color: Color(0xFF10B981), size: 20),
                  SizedBox(width: 8),
                  Text('JAXMART ESCROW', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                ],
              ),
              const SizedBox(height: 20),
              _escrowFeature(1, 'Secure Payments', 'Funds held in escrow, protecting you from fraud.'),
              const SizedBox(height: 16),
              _escrowFeature(2, 'Verified Shipping', 'We verify GSTIN, HSN, and logistics.'),
              const SizedBox(height: 16),
              _escrowFeature(3, 'Inspection', 'Release payments after verifying quality.'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _escrowFeature(int step, String title, String desc) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 20,
          height: 20,
          alignment: Alignment.center,
          decoration: const BoxDecoration(color: Color(0xFF10B981), shape: BoxShape.circle),
          child: Text(step.toString(), style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF0F172A))),
              const SizedBox(height: 4),
              Text(desc, style: const TextStyle(color: Color(0xFF64748B), fontSize: 11)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPremiumListings(BuildContext context, bool mobile) {
    int crossAxisCount = 5;
    if (MediaQuery.of(context).size.width < 600) {
      crossAxisCount = 2;
    } else if (MediaQuery.of(context).size.width < 900) {
      crossAxisCount = 3;
    } else if (MediaQuery.of(context).size.width < 1200) {
      crossAxisCount = 4;
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: mobile ? 16 : 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.diamond, color: Color(0xFF10B981), size: 20),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text('Premium Bulk Listings', style: TextStyle(fontSize: mobile ? 18 : 24, fontWeight: FontWeight.bold, color: const Color(0xFF0F172A)), overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                    if (!mobile) ...[
                      const SizedBox(height: 4),
                      Text('Top trending manufactured products ready for wholesale orders', style: TextStyle(color: Colors.grey[600], fontSize: 14)),
                    ]
                  ],
                ),
              ),
              if (!mobile)
                const Row(
                  children: [
                    Text('Browse All Products', style: TextStyle(color: Color(0xFF10B981), fontWeight: FontWeight.bold)),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward, color: Color(0xFF10B981), size: 18),
                  ],
                ),
            ],
          ),
          const SizedBox(height: 24),
          GridView.count(
            crossAxisCount: crossAxisCount,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: mobile ? 12 : 20,
            crossAxisSpacing: mobile ? 12 : 20,
            childAspectRatio: mobile ? 0.60 : 0.7,
            children: [
              _productCard('https://images.unsplash.com/photo-1581092334651-ddf26d9a09d0?q=80&w=500&auto=format&fit=crop', 'INDUSTRIAL', 'Stainless Steel Valve', '₹4,800', '10 Piece', 'Apex Solutions'),
              _productCard('https://images.unsplash.com/photo-1535312800630-1c09893a0279?q=80&w=500&auto=format&fit=crop', 'INDUSTRIAL', 'Pneumatic Actuator', 'Get Price', '5 Piece', 'Apex Solutions'),
              _productCard('https://images.unsplash.com/photo-1541888081682-1473211b7b75?q=80&w=500&auto=format&fit=crop', 'CONSTRUCTION', 'TMT Steel Rebars', 'Get Price', '10 Ton', 'Bharat Steel'),
              _productCard('https://images.unsplash.com/photo-1517077304055-6e89abbf09b0?q=80&w=500&auto=format&fit=crop', 'ELECTRONICS', 'PCB Controller Box', '₹2,500', '100 Piece', 'Narmada Ltd'),
              _productCard('https://images.unsplash.com/photo-1505691938895-1758d7feb511?q=80&w=500&auto=format&fit=crop', 'ELECTRONICS', 'Solar Panel 400W', '₹11,500', '20 Panel', 'Narmada Ltd'),
              if (mobile) _productCard('https://images.unsplash.com/photo-1581092160562-40aa08e78837?q=80&w=500&auto=format&fit=crop', 'SERVICES', 'Logistics Services', 'Custom', '1 Order', 'FastTrack Ltd'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _productCard(String imageUrl, String category, String title, String price, String minOrder, String supplier) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(11)),
                    image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                    decoration: BoxDecoration(color: const Color(0xFF10B981), borderRadius: BorderRadius.circular(4)),
                    child: const Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.white, size: 8),
                        SizedBox(width: 4),
                        Text('VERIFIED', style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(category, style: const TextStyle(color: Color(0xFF10B981), fontSize: 9, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Color(0xFF0F172A)), maxLines: 2, overflow: TextOverflow.ellipsis),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(price, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF0F172A))),
                      Text('Min: $minOrder', style: TextStyle(color: Colors.grey[600], fontSize: 10)),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(Icons.verified, color: Color(0xFF10B981), size: 12),
                          const SizedBox(width: 4),
                          Expanded(child: Text(supplier, style: TextStyle(color: Colors.grey[700], fontSize: 10), overflow: TextOverflow.ellipsis)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBrowseMarkets(bool mobile) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: mobile ? 16 : 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Browse Markets & Industries', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
          const SizedBox(height: 20),
          if (mobile) ...[
            _marketCategoryCard(Icons.architecture, 'Construction', 'SOURCE NOW \u2192'),
            const SizedBox(height: 12),
            _marketCategoryCard(Icons.computer, 'Electronics', 'SOURCE NOW \u2192'),
            const SizedBox(height: 12),
            _marketCategoryCard(Icons.factory, 'Industrial Supplies', 'SOURCE NOW \u2192'),
          ] else ...[
            Row(
              children: [
                Expanded(child: _marketCategoryCard(Icons.architecture, 'Construction', 'SOURCE NOW \u2192')),
                const SizedBox(width: 20),
                Expanded(child: _marketCategoryCard(Icons.computer, 'Electronics', 'SOURCE NOW \u2192')),
                const SizedBox(width: 20),
                Expanded(child: _marketCategoryCard(Icons.factory, 'Industrial Supplies', 'SOURCE NOW \u2192')),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _marketCategoryCard(IconData icon, String title, String action) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: const Color(0xFFF0FDF4), borderRadius: BorderRadius.circular(8)),
            child: Icon(icon, color: const Color(0xFF10B981)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF0F172A))),
                const SizedBox(height: 4),
                Text(action, style: const TextStyle(color: Color(0xFF64748B), fontSize: 10, fontWeight: FontWeight.bold)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFooter(bool mobile) {
    return Container(
      color: const Color(0xFF0F172A),
      padding: EdgeInsets.symmetric(horizontal: mobile ? 16 : 40, vertical: mobile ? 40 : 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (mobile) ...[
            const Text('JaXmart', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Text('India\'s trusted B2B marketplace connecting verified suppliers with buyers.', style: TextStyle(color: Colors.grey[400], height: 1.5)),
            const SizedBox(height: 32),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _footerColumn('For Buyers', ['Find Products', 'Post a Request', 'My Orders'])),
                Expanded(child: _footerColumn('For Sellers', ['Seller Center', 'List Products', 'Buyer Requests'])),
              ],
            ),
            const SizedBox(height: 24),
            _footerColumn('Trust & Safety', ['Escrow Protection', 'Verified Suppliers', 'Quality Guarantee']),
          ] else ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('JaXmart', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),
                      Text('India\'s trusted B2B marketplace connecting verified suppliers with buyers.', style: TextStyle(color: Colors.grey[400], height: 1.5)),
                    ],
                  ),
                ),
                Expanded(child: _footerColumn('For Buyers', ['Find Products', 'Post a Request', 'My Orders'])),
                Expanded(child: _footerColumn('For Sellers', ['Seller Center', 'List Products', 'Buyer Requests'])),
                Expanded(child: _footerColumn('Trust & Safety', ['Escrow Protection', 'Verified Suppliers', 'Quality Guarantee'])),
              ],
            ),
          ],
          const SizedBox(height: 40),
          Divider(color: Colors.grey[800]),
          const SizedBox(height: 20),
          if (mobile) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Terms of Use', style: TextStyle(color: Colors.grey[500], fontSize: 12)),
                Text('Privacy Policy', style: TextStyle(color: Colors.grey[500], fontSize: 12)),
                Text('Contact Us', style: TextStyle(color: Colors.grey[500], fontSize: 12)),
              ],
            ),
            const SizedBox(height: 16),
            Center(child: Text('© 2026 JaXmart. All rights reserved.', style: TextStyle(color: Colors.grey[500], fontSize: 12))),
          ] else ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('© 2026 JaXmart. All rights reserved.', style: TextStyle(color: Colors.grey[500], fontSize: 12)),
                Row(
                  children: [
                    Text('Terms of Use', style: TextStyle(color: Colors.grey[500], fontSize: 12)),
                    const SizedBox(width: 24),
                    Text('Privacy Policy', style: TextStyle(color: Colors.grey[500], fontSize: 12)),
                    const SizedBox(width: 24),
                    Text('Contact Us', style: TextStyle(color: Colors.grey[500], fontSize: 12)),
                  ],
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _footerColumn(String title, List<String> links) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
        const SizedBox(height: 16),
        ...links.map((link) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(link, style: TextStyle(color: Colors.grey[400], fontSize: 12)),
            )),
      ],
    );
  }
}
