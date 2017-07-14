#include <stdio.h>

// Criação do tipo ponto

typedef struct {

    float x, y;

}ponto;

float sign (ponto p1, ponto p2, ponto p3){

    return (p1.x - p3.x) * (p2.y - p3.y) - (p2.x - p3.x) * (p1.y - p3.y);
}

// Verifica se o ponto está
// no triângulo

float isPointInTri (ponto pt, ponto v1, ponto v2, ponto v3){

    int b1, b2, b3;

    b1 = sign(pt, v1, v2) < 0.0f;
    b2 = sign(pt, v2, v3) < 0.0f;
    b3 = sign(pt, v3, v1) < 0.0f;

    if((b1 == b2) && (b2 == b3)){
        return 1;
    }
    else{
        return 0;
    }
}

int main (){

    ponto A, B, C, D;

    printf("Digite x de A: ");
    scanf("%f", &A.x);
    printf("Digite y de A: ");
    scanf("%f", &A.y);
    printf("Digite x de B: ");
    scanf("%f", &B.x);
    printf("Digite y de B: ");
    scanf("%f", &B.y);
    printf("Digite o x de C: ");
    scanf("%f", &C.x);
    printf("Digite o y de C: ");
    scanf("%f", &C.y);
    printf("Digite o x do ponto: ");
    scanf("%f", &D.x);
    printf("Digite o y do ponto: ");
    scanf("%f", &D.y);

    if(isPointInTri(D, A, B, C)){
        printf("O ponto esta no triangulo!\n");
    }
    else{
        printf("O ponto nao esta no triangulo!\n");
    }
}
