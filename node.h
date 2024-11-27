#ifndef NODE_H
#define NODE_H

#include <stdlib.h>

enum {
	PROG = 1,
	STMT,
	TYPE,
	EQ
};

typedef struct ProgASTNode {
	ASTNode *left = NULL;
	ASTNode *right = NULL;
};

ASTNode *root = NULL;

ASTNode* createPROGASTNode(int type, ASTNode *pnode) {
	ASTNode *temp = (ASTNode*)malloc(sizeof(ASTNode));
	temp->type = PROG;
	temp->
}

#endif /* NODE_H */
