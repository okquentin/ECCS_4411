#include <iostream>
#include <string>

using namespace std;

int main(){
  string Data = "Data";
  string Type = "Types";
  string DataType = Data + Type;

  printf("%s\n", DataType.c_str());
  
  string extractedType = DataType.substr(Data.length());
  printf("%s", extractedType.c_str());
}
