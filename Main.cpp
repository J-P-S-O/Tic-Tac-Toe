# include <iostream>
# include <stdlib.h>
# include <Interface.h>
int main(int argc, char **argv){
    int depth = int(argv[1]);
    if (!depth || depth == 0){
        std::cout<< "Invalid Arguments";
        exit(1);
    }
    Console Interface;
    
    
}