import 'package:dashboard/constants.dart';
import 'package:dashboard/screens/dashboard/components/storage_chart.dart';
import 'package:dashboard/screens/dashboard/components/storage_info.dart';
import 'package:flutter/material.dart';

class StorageDetails extends StatelessWidget {
  const StorageDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Storage details',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: defaultPadding),
          StorageChart(),
          StorageInfoCard(
            svgSrc: 'assets/icons/documents.svg',
            title: 'Documents Files',
            numOfFiles: 1239,
            sizeOfFiles: '2.5GB',
          ),
          StorageInfoCard(
            svgSrc: 'assets/icons/media.svg',
            title: 'Media Files',
            numOfFiles: 1239,
            sizeOfFiles: '12.5GB',
          ),
          StorageInfoCard(
            svgSrc: 'assets/icons/folder.svg',
            title: 'Others Files',
            numOfFiles: 1239,
            sizeOfFiles: '1.5GB',
          ),
          StorageInfoCard(
            svgSrc: 'assets/icons/unknown.svg',
            title: 'Unknown Files',
            numOfFiles: 1239,
            sizeOfFiles: '2.1GB',
          ),
        ],
      ),
    );
  }
}
