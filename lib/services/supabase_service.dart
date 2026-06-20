class SupabaseService {
  static const String supabaseUrl = 'AQUI_VA_TU_SUPABASE_URL';
  static const String supabaseAnonKey = 'AQUI_VA_TU_SUPABASE_ANON_KEY';

  static bool estaConfigurado() {
    return supabaseUrl != 'AQUI_VA_TU_SUPABASE_URL' &&
        supabaseAnonKey != 'AQUI_VA_TU_SUPABASE_ANON_KEY';
  }
}