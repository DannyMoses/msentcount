%{
#include <iostream>

#define YY_DECL extern "C" int yylex()
int sentenceCount;
%}

%%

[\.:space:]    {sentenceCount++;}
[0-9]+\.[0-9]+ ;
[0-9]          ;
[a-zA-Z0-9]+   ;
[ \t\n]        ;
%%
int main(int argc, char* argv[]) {
  FILE *myfile = fopen(argv[1], "r");
  if (myfile == NULL) {
    perror("The following error has occurred");
    return -1;
    }
  yyin = myfile;
  yylex();
  std::cout << "There are " << sentenceCount << " sentences in this file." << std::endl;
}
