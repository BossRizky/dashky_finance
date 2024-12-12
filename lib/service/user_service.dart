import 'package:dashky_finance/models/user_models.dart';

class UserService {
  // Fungsi untuk login
  static Future<User?> login(String email, String password) async {
    // Simulasi login dengan data statis
    if (email == "rizky" && password == "123") {
      // Simulasi pengguna yang berhasil login
      return User(id: '1', email: email, password: password);
    } else {
      // Jika login gagal, kembalikan null
      return null;
    }
  }

  // Fungsi untuk register pengguna baru
  static Future<User?> register(String email, String password) async {
    // Simulasi pendaftaran pengguna baru
    return User(id: '2', email: email, password: password);
  }
}
