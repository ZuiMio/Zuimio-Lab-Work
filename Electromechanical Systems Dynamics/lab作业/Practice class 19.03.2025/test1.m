p1t='e1';
assert(isequal(p1,p1t),'Error in the mark, assigned to the angular acceleration of the 1st element, look at the line %(1.2)');

p2t='a2';
assert(isequal(p2,p2t),'Error in the mark, assigned to the linear acceleration of the 2nd element, look at the line %(1.1)');

p3t='a4';
assert(isequal(p3,p3t),'Error in the mark, assigned to the linear acceleration of the 4th element, look at the line %(1.1)');

p4t='a5';
assert(isequal(p4,p4t),'Error in the mark, assigned to the linear acceleration of the 5th element, look at the line %(1.1)');

F1t='R1y';
assert(isequal(F1,F1t),'Error in the mark, assigned to the force in the support of the 1st element, look at the line %(1.3)');

F2t='R1x';
assert(isequal(F2,F2t),'Error in the mark, assigned to the force in the support of the 1st element, look at the line %(1.3)');

F3t='Q1';
assert(isequal(F3,F3t),'Error in the mark, assigned to the weight of the 1st element, look at the block %(0.1)');

F4t='S1';
assert(isequal(F4,F4t),'Error in the mark, assigned to the tension in the rod, try another symbol from line %(1.4)');

F5t='S2';
assert(isequal(F5,F5t),'Error in the mark, assigned to the tension in the rod, try another symbol from line %(1.4)');

F6t='S3';
assert(isequal(F6,F6t),'Error in the mark, assigned to the tension in the rod, try another symbol from line %(1.4)');

L1t=R1x+S1;
assert(ismember(R1x,symvar(lhs(feq1))),'There is an acting in the X direction reaction force in the support of the 1st element');
assert(ismember(S1,symvar(lhs(feq1))),'There is an acting in the X direction tension force in the rod connected to the 1st element');
assert(isequal(lhs(feq1),L1t),'Error in the left side of equation of the X components of the resultant force acting on the 1st element');

P1t=sym(0);
assert(isequal(rhs(feq1),P1t),'There is no linear acceleration of the 1st element, so the right hand of equation of the resultant forces allong the X direction should be equal to zero');

L2t=R1y-S2-S3-Q1;
assert(ismember(R1y,symvar(lhs(feq2))),'There is an acting in the Y direction reaction force in the support of the 1st element');
assert(ismember(S2,symvar(lhs(feq2))),'There are two acting in the Y direction tension forces in the rod connected to the 1st element');
assert(ismember(S3,symvar(lhs(feq2))),'There are two acting in the Y direction tension forces in the rod connected to the 1st element');
assert(ismember(Q1,symvar(lhs(feq2))) || ismember(g,symvar(lhs(feq2))),'There is a weight of the 1st element, acting in the Y direction');
assert(isequal(lhs(feq2),L2t),'Error in the left side of equation of the Y components of the resultant force acting on the 1st element');

P2t=sym(0);
assert(isequal(rhs(feq2),P2t),'There is no linear acceleration of the 1st element, so the right hand of equation of the resultant forces allong the Y direction should be equal to zero');

L3t=-S1*R1-S2*r1+S3*R1;
assert(ismember(S1,symvar(lhs(feq3))),'There is a moment of force results from the force S1 acting on the 1st element');
assert(ismember(S2,symvar(lhs(feq3))),'There is a moment of force results from the force S2 acting on the 1st element');
assert(ismember(S3,symvar(lhs(feq3))),'There is a moment of force results from the force S3 acting on the 1st element');
assert(isequal(lhs(feq3),L3t),'Error in the left side of the equation of the resultant moments of the forces acting on the 1st element');

P3t=-I1*e1;
assert(ismember(I1,symvar(rhs(feq3))) || ismember(M1,symvar(rhs(feq3))),'The resultant moment of forces is proportional to the moment of inertia of the 1st element');
assert(ismember(e1,symvar(rhs(feq3))),'The resultant moment of forces is proportional to the angular acceleration of the 1st element');
assert(isequal(rhs(feq3),P3t),'Error in the right side of the equation of the resultant moments of the forces acting on the 1st element');

L4t=e1*R1;
assert(ismember(R1,symvar(lhs(keq1))),'Check if You put the right arm');
assert(isequal(lhs(keq1),L4t),'The left side of the kinematic equation should contain the product of the angular acceleration of the 1st element and the arm');

P4t=a2;
assert(isequal(rhs(keq1),P4t),'The right side of the kinematic equation should contain the linear acceleration of the rod a2');

L5t=e1*r1;
assert(ismember(r1,symvar(lhs(keq2))),'Check if You put the right arm');
assert(isequal(lhs(keq2),L5t),'The left side of the kinematic equation should contain the product of the angular acceleration of the 1st element and the arm');

P5t=a4;
assert(isequal(rhs(keq2),P5t),'The right side of the kinematic equation should contain the linear acceleration of the rod a4');

L6t=e1*R1;
assert(ismember(R1,symvar(lhs(keq3))),'Check if You put the right arm');
assert(isequal(lhs(keq3),L6t),'The left side of the kinematic equation should contain the product of the angular acceleration of the 1st element and the arm');

P6t=a5;
assert(isequal(rhs(keq3),P6t),'The right side of the kinematic equation should contain the linear acceleration of the rod a5');








assert(isequal(lhs(keq2),L5t),'blad w definicji lewej strony 2 rownania wezlow');
assert(isequal(rhs(keq2),P5t),'blad w definicji prawej strony 2 rownania wezlow');

assert(isequal(lhs(keq3),L6t),'blad w definicji lewej strony 3 rownania wezlow');
assert(isequal(rhs(keq3),P6t),'blad w definicji prawej strony 3 rownania wezlow');
%disp('Testy elementu nr. 2 przebiegly pomyslnie')