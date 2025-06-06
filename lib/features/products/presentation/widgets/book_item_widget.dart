import 'package:financial_services_app/core/extensions/build_context.dart';
import 'package:financial_services_app/core/extensions/navigatable.dart';
import 'package:financial_services_app/core/services/get_storage_helper.dart';
import 'package:financial_services_app/core/theme/text_styles.dart';
import 'package:financial_services_app/core/widgets/app_spacer.dart';
import 'package:financial_services_app/core/widgets/network_image.dart';
import 'package:financial_services_app/core/widgets/progress_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/results_entity.dart';
import '../pages/book_details_screen.dart';

class BookItem extends StatelessWidget {
  final ResultsEntity book;
  final bool isExpanded;
  final VoidCallback onToggle;
  final String heroTag;
  const BookItem({
    super.key,
    required this.book,
    required this.isExpanded,
    required this.onToggle,
    required this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      padding: EdgeInsets.all(12.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: heroTag,
            child: MainNetworkImage(
              imageUrl: book.formats?.imageJpeg ?? '',
              width: 80.sp,
              height: 80.sp,
              fit: BoxFit.cover,
              radius: 0,
            ),
          ),
          AppSpacer(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title ?? '',
                  style: TextStyles.bold14,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  book.authors
                          ?.map((author) =>
                              "${author.name ?? ''} (${author.birthYear ?? ""} - ${author.deathYear ?? ""})")
                          .join(', ') ??
                      '',
                  style: TextStyles.medium10,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                AppSpacer(heightRatio: .5),
                if (book.summaries?.isNotEmpty ?? false) ...[
                  Text(
                    book.summaries?.map((e) => e).join(', ') ?? '',
                    style: TextStyles.medium10,
                    maxLines: isExpanded ? null : 3,
                    overflow: isExpanded ? null : TextOverflow.ellipsis,
                  ),
                  GestureDetector(
                    onTap: onToggle,
                    child: Text(
                      isExpanded
                          ? context.translate.see_less
                          : context.translate.see_more,
                      style: TextStyles.medium10.copyWith(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
                AppSpacer(heightRatio: .5),
                Align(
                  alignment: CacheHelper.getLocale == "en"
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: AppProgressButton(
                    textColor: Colors.white,
                    onPressed: (anim) {
                      context.push(
                        BookDetailsScreen(
                          book: book,
                          heroTag: heroTag,
                        ),
                      );
                    },
                    height: 35.sp,
                    fontSize: 8.sp,
                    width: context.screenWidth / 6,
                    text: context.translate.see_more,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
