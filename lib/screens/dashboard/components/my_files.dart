import 'package:dashboard/constants.dart';
import 'package:dashboard/models/my_files.dart';
import 'package:dashboard/models/recent_file.dart';
import 'package:dashboard/responsive.dart';
import 'package:dashboard/screens/dashboard/components/file_info_card.dart';
import 'package:dashboard/screens/dashboard/components/storage_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyFiles extends StatelessWidget {
  const MyFiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Expanded(
      flex: 5,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'My Files',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('Add New'),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding,
                    vertical:
                        defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding),
          Responsive(
            mobile: FileInfoCardView(
              crossAxisCount: _size.width < 650 ? 2 : 4,
              childAspectRatio: _size.width < 650 ? 1.3 : 1,
            ),
            tablet: const FileInfoCardView(),
            desktop: FileInfoCardView(
              childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
            ),
          ),
          const SizedBox(height: defaultPadding),
          Container(
            padding: const EdgeInsets.all(defaultPadding),
            decoration: const BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recent Files',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                SizedBox(
                  width: double.infinity,
                  child: DataTable(
                    horizontalMargin: 0,
                    columnSpacing: 0,
                    columns: const [
                      DataColumn(label: Text('File Name')),
                      DataColumn(label: Text('Date')),
                      DataColumn(label: Text('Size')),
                    ],
                    rows: List.generate(demoRecentFiles.length,
                        (index) => recentFIlesRow(demoRecentFiles[index])),
                  ),
                )
              ],
            ),
          ),
          if (Responsive.isMobile(context))
            const SizedBox(height: defaultPadding),
          if (Responsive.isMobile(context)) const StorageDetails(),
        ],
      ),
    );
  }

  DataRow recentFIlesRow(RecentFile file) {
    return DataRow(
      cells: [
        DataCell(
          Row(
            children: [
              SvgPicture.asset(file.icon),
              Padding(
                padding: const EdgeInsets.only(left: defaultPadding),
                child: Text(file.title),
              ),
            ],
          ),
        ),
        DataCell(Text(file.date)),
        DataCell(Text(file.size)),
      ],
    );
  }
}

class FileInfoCardView extends StatelessWidget {
  const FileInfoCardView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1.0,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: demoMyFiles.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
        mainAxisSpacing: defaultPadding,
      ),
      itemBuilder: (context, index) => FileInfoCard(
        info: demoMyFiles[index],
      ),
    );
  }
}
