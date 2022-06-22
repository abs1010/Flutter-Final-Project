import 'package:http/http.dart';
import 'package:projeto_cadastro_final/infra/http/htttp_adapter.dart';

HttpAdapter makeHttpAdapter() => HttpAdapter(client: Client());
