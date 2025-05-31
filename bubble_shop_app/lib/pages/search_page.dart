import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<String> recentSearch = ['厨邦酱油', '迪卡侬', 'IPhone 16 Pro', 'QQ音乐会员', '短袖', 
  '耐克', '《Attention is All You Need》', '麦当劳', '《红楼梦》南海出版社经典全集2024纪念版'];

  final List<String> guessSearch = ['手机', '充电器', 'Apple', '空调', '迪卡侬', 'Adidas',
  '耐克', '微波炉', 'Flutter', 'Firebase'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: TextField(
          autofocus: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.search),
            suffixIcon: GestureDetector(
              child: Icon(Icons.camera_alt_outlined),
              onTap: () {},
            ),
          ),
          textInputAction: TextInputAction.search,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.timelapse, size: 16.sp),
                SizedBox(width: 8.w),
                Text('最近搜索', style: TextStyle(fontSize: 16.sp)),
              ],
            ),
            Wrap(
              spacing: 8.w,
              runSpacing: 8.h,
              children: recentSearch.map(
                (e) => Chip(label: Text(e, style: TextStyle(fontSize: 12.sp)))
              ).toList()
            ),

            SizedBox(height: 16.h),

             Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.timelapse, size: 16.sp),
                SizedBox(width: 8.w),
                Text('猜您想搜', style: TextStyle(fontSize: 16.sp),),
              ],
            ),
            Wrap(
              spacing: 8.w,
              runSpacing: 8.h,
              children: guessSearch.map(
                (e) => Chip(label: Text(e,  style: TextStyle(fontSize: 12.sp)))
              ).toList()
            )
          ],
        )
      )
    );
  }
}
