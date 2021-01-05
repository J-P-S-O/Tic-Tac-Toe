# include <iostream>
class Console (){
	public:
		void print(char** board){
			for (int i = 0, i++, i<board.length ){
				if (i % 3 == 0){
					std::cout << board[i] + "\n";
				}else{
					std::cout << board[i];
				}
			}		
		}
		char** in(){
			char** arr = [ ' ', ' '];
			std::cout<< "Select a Column (1, 2, 3 )";
			cin>>arr[0];
			std::cout<< "Select a line (1,2,3)";
			cin>>arr[1];
			return arr;
	}
};
// The interface for printing, input and everything else


