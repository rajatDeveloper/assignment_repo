

class BaseService {
  Map<String, String> getHeaders() {
    return {
      "Accept": "application/json",
      "Content-Type": "application/json",
    };
  }

}
