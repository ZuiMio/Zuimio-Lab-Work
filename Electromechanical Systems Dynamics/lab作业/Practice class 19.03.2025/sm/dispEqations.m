disp('*********************************************')
disp('* Equations of forces of 1 element (3 eq.): *')
disp('*********************************************')
disp(feq1);
disp(feq2);
disp(feq3);
disp('*********************************************')
disp('* Equations of motion of 2 element (3 eq.): *')
disp('*********************************************')
disp(feq4);
disp(feq5);
disp(feq6);
disp('*********************************************')
disp('* Equations of motion of 3 element (2 eq.): *')
disp('*********************************************')
disp(feq9);
disp(feq8);
disp('*********************************************')
disp('* Equations of motion of 4 element (1 eq.): *')
disp('*********************************************')
disp(feq10);
disp('*********************************************')
disp('* Equations of motion of 5 element (2 eq.): *')
disp('*********************************************')
disp(feq11);
disp(feq12);

disp('***********************************************************')
disp('* Equations of kinematic constrains of 1 element (3 eq.): *')
disp('***********************************************************')
disp(keq1);
disp(keq2);
disp(keq3);
disp('***********************************************************')
disp('* Equations of kinematic constrains of 2 element (2 eq.): *')
disp('***********************************************************')
disp(keq4);
disp(keq5);
disp('***********************************************************')
disp('* Equations of kinematic constrains of 5 element (2 eq.): *')
disp('***********************************************************')
disp(keq6);
disp(keq7);

disp('*********************************************')
disp('* Equation of friction of 3 element (1 eq): *')
disp('*********************************************')
disp(feq7);

feqn5=[feq11; feq12; keq7; keq6];
unk5=[S5, a5o, e5];
seq5=(eliminate(feqn5,unk5)==0);

feqn3=[feq8; feq7; feq9];
unk3=[T3, N3];
seq3=(eliminate(feqn3,unk3)==0);

feqn2=[feq4; feq5; feq6; seq3; keq5];
unk2=[R2x, R2y, S4, a3];
seq2=(eliminate(feqn2,unk2)==0);

feqn1=[feq1; feq2; feq3; seq5(2); seq2; feq10; keq2; keq3; keq4; keq1];
unk1=[R1x, R1y, S2, S1, S3, a4, a5, e2, a2];
seq1=(eliminate(feqn1,unk1)==0);

e1s=simplify(solve(seq1,e1));
e1s=simplify(e1s(2));

u=symunit;
