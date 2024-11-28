#ifndef NODE_H
#define NODE_H

#include <iostream>

int indent = 0;
class Node {
	public:
		Node() {
			for(int i=0;i<indent;i++) {
				printf(" ");
			}
			printf("Node\n");
			indent++;
		}
		~Node() {
			indent--;
		}
};

class StatementNode : public Node {
	public:
		StatementNode() {
                        for(int i=0;i<indent;i++) {
                                printf(" ");
                        }
                        printf("StatementNode\n");
                        indent++;
                }
};

class TypeNode : public Node {
	public:
		int typeId;
		TypeNode() {
                        for(int i=0;i<indent;i++) {
                                printf(" ");
                        }
                        printf("TypeNode\n");
                        indent++;
                }

};

class IdenNode : public Node {
	public:
		IdenNode() {
                        for(int i=0;i<indent;i++) {
                                printf(" ");
                        }
                        printf("IdenNode\n");
                        indent++;
                }

};

class EqNode : public Node {
	public:
		EqNode() {
                        for(int i=0;i<indent;i++) {
                                printf(" ");
                        }
                        printf("EqNode\n");
                        indent++;
                }

};

class ValueNode : public Node {
	public:
		ValueNode() {
                        for(int i=0;i<indent;i++) {
                                printf(" ");
                        }
                        printf("ValueNode\n");
                        indent++;
                }

		union val {
			int intVal;
		        char charVal;
		}val;	
};

class TerminateNode : public Node {
	public:
		TerminateNode() {
                        for(int i=0;i<indent;i++) {
                                printf(" ");
                        }
                        printf("TerminateNode\n");
                        indent++;
                }

};


#endif /* NODE_H */
