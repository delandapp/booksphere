import 'package:booksphere/app/data/models/response_buku.dart';
import 'package:flutter/material.dart';
import 'package:booksphere/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';

class buildSection extends StatelessWidget {
  const buildSection({
    super.key,
    required this.data,
  });

  final DataBuku data;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data.kategoriBuku.toString(),
                style: TextStyle(
                  height: 1.2,
                  fontFamily: GoogleFonts.poppins(
                    fontWeight: FontWeight.w900,
                  ).fontFamily,
                  fontSize: 16.0,
                  color: const Color(0xff09142E),
                ),
              ),
              GestureDetector(
                onTap: () => null,
                child: Text(
                  "Lihat semua",
                  style: TextStyle(
                    height: 1.2,
                    fontWeight: FontWeight.w900,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 15.0,
                    color: const Color(0xFFE84218),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.22,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: data.buku!
                    .map((e) => SizedBox(
                      width: MediaQuery.of(context).size.width * 0.33,
                      child: GestureDetector(
                        onTap: () => Get.toNamed(Routes.DETAILBOOK, parameters: {"idbook" : e.bukuID.toString()}),
                        child: Column(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  e.coverBuku.toString(),
                                  fit: BoxFit.fill,
                                  width: MediaQuery.of(context).size.width * 0.3,
                                ),
                              ),
                              flex: 20,
                            ),
                            const SizedBox(height: 10,),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.26,
                              child: AutoSizeText(
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                minFontSize: 16,
                                maxFontSize: 20,
                                e.judul.toString(),
                                style: TextStyle(
                                  height: 1.2,
                                  fontWeight: FontWeight.w900,
                                  fontFamily:
                                      GoogleFonts.poppins().fontFamily,
                                  fontSize: 16.0,
                                  color: const Color(0xff09142E),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))
                    .toList(),
              ),
            ),
          ),
        )
      ],
    );
  }
}
