import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/Features/search/view/custom_search_tab.dart';
import 'package:movie/Features/search/view_model/search_cubit.dart';

class Search extends StatelessWidget {
  static const String routeName = "s";

  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          var cubit = SearchCubit.get(context);
          return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SafeArea(
                  child: Column(children: [
                    TextFormField(
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      cursorColor: Colors.white.withOpacity(0.67),
                      onChanged: (query) {
                        cubit.getSearchMovie(query);
                        if (query == '') {
                          cubit.searchModel?.results?.isEmpty ?? true;
                        }
                      },
                      decoration: InputDecoration(
                        filled: true,
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        fillColor: Colors.grey,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        hintText: 'Search',
                        hintStyle: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          color: Colors.white.withOpacity(0.67),
                          fontSize: 14,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            color: Color(0xff7a7a7a),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            color: Color(0xff7a7a7a),
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            color: Color(0xff7a7a7a),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height*0.01,),
                    const CustomSearchTab()

                  ]),
                ),
              ));
        },
      ),
    );
  }
}

