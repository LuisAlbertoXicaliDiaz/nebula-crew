import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static const String supabaseUrl = 'https://rjvcsnbftzcscjclvqlo.supabase.co';

  static const String supabaseAnonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJqdmNzbmJmdHpjc2NqY2x2cWxvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODE5OTM3MDMsImV4cCI6MjA5NzU2OTcwM30.g-GRT1sxgrqnPOSO_A0vnpEJtUK5VeehazHib-3HhTU';

  static SupabaseClient get client {
    return Supabase.instance.client;
  }

  static Future<void> inicializar() async {
    await Supabase.initialize(
      url: supabaseUrl,
      publishableKey: supabaseAnonKey,
    );
  }
}