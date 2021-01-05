# include <iostream>
int main(int argc, char **argv){
    int depth = int(argv[1]);
    if (!depth || depth == 0){
        std::cout<< "Invalid Arguments";
        
    }   
}