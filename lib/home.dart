import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:keyword_clustering_test/csv_to_map.dart';
import 'api.dart';
import 'package:file_picker/file_picker.dart';
// import 'package:flutter/foundation.dart' show Uint8List
import 'dart:convert';
import 'dart:html' as html;
import 'dart:typed_data';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();

}

class _HomeState extends State<Home> {
  final reqBody = [
    {
      "Keyword": "student loan forgiveness",
      "Volume": "1000000",
      "Keyword Difficulty": "96",
      "CPC (USD)": "1.84",
      "Competitive Density": "0",
      "Number of Results": "179000000",
      "Intent": "Informational",
      "SERP Features": "Site links, FAQ, Top stories, People also ask, Video carousel",
      "Trend": "0.13,0.08,0.08,0.07,0.10,0.16,0.29,0.24,0.20,0.66,0.44,1.00"
    },
    {
      "Keyword": "student loans",
      "Volume": "1000000",
      "Keyword Difficulty": "100",
      "CPC (USD)": "7.94",
      "Competitive Density": "0.31",
      "Number of Results": "545000000",
      "Intent": "Informational, Transactional",
      "SERP Features": "Reviews, FAQ, Top stories, People also ask, Video carousel, Knowledge panel, Adwords top",
      "Trend": "0.08,0.29,0.16,0.10,0.29,0.36,0.24,0.24,0.29,1.00,0.10,0.13"
    }
  ];
  Uint8List uploadedCsv = Uint8List(0);
  String option1Text = "";


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(onPressed: ()
          // Api().clusterKeywords(reqBody);
        async {
          html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
          uploadInput.click();

          uploadInput.onChange.listen((e) {
            // read file content as dataURL
            final files = uploadInput.files;
            if (files!.length == 1) {
              final file = files[0];
              html.FileReader reader = html.FileReader();

              reader.onLoadEnd.listen((e) {
                setState(() {
                  uploadedCsv = Base64Decoder()
                      .convert(reader.result.toString().split(",").last);

                  // final fields = CsvToListConverter().convert(utf8.decode(uploadedCsv));
                  // print(fields);
                  // var result = Map.fromIterable(fields, key: (item) => item[0], value: (item) => item[1]);
                  // print(result);
                  // String resultJson = json.encode(result);
                  // final List resultList = [];
                  // // print(resultJson);
                  // resultList.add(result);
                  // print(json.encode(resultList));
                  // final reqBodyCsv = json.encode(resultList);
                  // // Api().clusterKeywords(reqBody);
                  
                  final fieldsMap = CsvToMapConverter().convert(utf8.decode(uploadedCsv));
                  print(fieldsMap);
                  Api().clusterKeywords(fieldsMap);


                  print('uploadedCSV is now ' + utf8.decode(uploadedCsv)); // utf8.decode returns the UInt8List to readable csv
                });
              });

              reader.onError.listen((fileEvent) {
                setState(() {
                  option1Text = "Some Error occured while reading the file";
                });
              });

              reader.readAsDataUrl(file);

            }
          });

        }
        , child: Text("Upload csv"))
      ],
    );
  }

}

