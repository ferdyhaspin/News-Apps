// Created by ferdyhaspin on 22/11/21.
// Copyright (c) 2021 Jerigen All rights reserved.

import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const COLOR_PRIMARY = Color(0xFFE80F8A);

//CONFIG REQUEST
const String BASE_URL = "https://60a4954bfbd48100179dc49d.mockapi.io/";
const CONNECT_TIME_OUT = 30000;
const READ_TIME_OUT = 30000;

const DEFAULT_ERROR = "Permintaan tidak dapat di proses,\nTerjadi kesalahan.";
const ERROR_TIMEOUT = "Permintaan kehabisan waktu.";
const RESPONSE_OK = 200;

//PATH
const PATH_GET_ARTICLES = "api/innocent/newsapp/articles";

class ConstConfig {
  static PrettyDioLogger dioPrettyLog() {
    return PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90);
  }

  static BaseOptions dioBaseOptions() {
    return BaseOptions(
      baseUrl: BASE_URL,
      connectTimeout: CONNECT_TIME_OUT,
      receiveTimeout: READ_TIME_OUT,
    );
  }
}
