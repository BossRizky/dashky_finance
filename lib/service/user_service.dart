import 'package:dashky_finance/models/user_models.dart';

class UserService {
  // Database sementara untuk menyimpan pengguna
  static List<User> _users = [];
  static User? _currentUser;

  // Fungsi untuk login
  static Future<User?> login(String email, String password) async {
    // Cari pengguna di daftar yang sudah ada
    for (var user in _users) {
      if (user.email == email && user.password == password) {
        _currentUser = user; // Simpan pengguna yang berhasil login
        return user;
      }
    }
    return null; // Jika tidak ditemukan
  }

  // Fungsi untuk register pengguna baru
  static Future<User?> register(String email, String password) async {
    // Cek apakah email sudah terdaftar
    for (var user in _users) {
      if (user.email == email) {
        return null; // Email sudah terdaftar
      }
    }

    // Validasi format email
    if (!isValidEmail(email)) {
      return null; // Email tidak valid
    }

    // Simulasi ID unik (misalnya dengan nomor urut)
    String newUserId = (_users.length + 1).toString();
    User newUser = User(id: newUserId, email: email, password: password);
    
    _users.add(newUser); // Menambahkan pengguna baru ke dalam "database" sementara
    _currentUser = newUser; // Simpan data pengguna yang baru saja terdaftar
    return newUser;
  }

  // Fungsi untuk mendapatkan data pengguna yang sedang login
  static Future<User?> getUser() async {
    return _currentUser; // Kembalikan data pengguna yang sedang login
  }

  // Fungsi untuk menghapus data pengguna (logout)
  static Future<void> logout() async {
    _currentUser = null; // Hapus data pengguna yang sedang login
  }

  // Fungsi untuk memvalidasi format email
  static bool isValidEmail(String email) {
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return regex.hasMatch(email);
  }

  // Fungsi untuk mendapatkan semua pengguna (untuk testing atau pengelolaan)
  static List<User> getAllUsers() {
    return _users;
  }
}
