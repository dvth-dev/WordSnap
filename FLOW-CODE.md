# 1.Cấu trúc khi tạo Feature mới #

    features/
    └── flashcard/          ← Tạo folder mới
        ├── data/
        │   ├── models/
        │   ├── datasources/
        │   └── repositories/
        ├── bloc/
        └── presentation/
        ├── screens/
        └── widgets/

# 2.Tạo Datasource: Lấy dữ liệu từ đâu: Local/API? #

* LAYER NÀY CHỈ CÓ VIỆC LÀ GỬI API *
    - Tạo 1 Abstract class: abstract class ___Datasource
        + Định nghĩa các function gửi request đến server
    - Tạo 1 class Implement các function từ abstract Datasource

# 3.Tạo Repository: Logic xử lý dữ liệu thế nào? #

* Tạo Abstract class ___Repository: Định nghĩa các function cần thiết
* Tạo class Implement Repository: Impl các function và xử lý data ở đây

# 4.Tạo Event và State: Người dùng tương tác gì? App phản hồi thế nào #

* Events: là các hành động trên UI như tăng bộ số đếm, xóa,...
* State: là các phản hồi cho User như Loading, Error, Success,...

# 5.Tạo BLOC: Xử lý Event và Emit State #

* Xử lý phản hồi thì tương tác của User và emit đi State phù hợp

# 6.Tạo UI: Xây dựng UI như design #

* Lệnh để build lại Model Hive
  `dart run build_runner build --delete-conflicting-outputs`
