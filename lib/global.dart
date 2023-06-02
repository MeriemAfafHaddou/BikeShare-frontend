class SessionData{
  late String userId;
  late String email;
  late String name;
  late String password;
  late String address;

}
SessionData? globalSessionData=SessionData();


//Having a clear function is pretty handy
void clearSessionData(){
  globalSessionData = SessionData();
}