p5t='e2';
assert(isequal(p5,p5t),'Error in the mark, assigned to the angular acceleration of the 2nd element, look at the line %(1.2)');

p6t='a2';
assert(isequal(p6,p6t),'Error in the mark, assigned to the linear acceleration of the 2nd element, look at the line %(1.1)');

p7t='a3';
assert(isequal(p7,p7t),'Error in the mark, assigned to the linear acceleration of the 3rd element, look at the line %(1.1)');

F7t='R2x';
assert(isequal(F7,F7t),'Error in the mark, assigned to the force in the support of the 2nd element, look at the line %(1.3)');

F8t='R2y';
assert(isequal(F8,F8t),'Error in the mark, assigned to the force in the support of the 2nd element, look at the line %(1.3)');

F9t='Q2';
assert(isequal(F9,F9t),'Error in the mark, assigned to the weight of the 2nd element, look at the block %(0.1)');

F10t='S1';
assert(isequal(F10,F10t),'Error in the mark, assigned to the tension in the rod, try another symbol from line %(1.4)');

F11t='S4';
assert(isequal(F11,F11t),'Error in the mark, assigned to the tension in the rod, try another symbol from line %(1.4)');

L7t=-S1+S4*cos(alpha)+R2x;
assert(ismember(R2x,symvar(lhs(feq4))),'There is an acting in the X direction reaction force in the support of the 2nd element');
assert(ismember(S1,symvar(lhs(feq4))),'There is an acting in the X direction tension force in the rod connected to the 2nd element');
assert(ismember(S4,symvar(lhs(feq4))),'There is an acting in the X direction tension force in the rod connected to the 2nd element');
assert(ismember(alpha,symvar(lhs(feq4))),'The force S4 should be projected to X axis, try using the trygonometric functions');
assert(isequal(lhs(feq4),L7t),'Error in the left side of equation of the X components of the resultant force acting on the 2nd element');

P7t=sym(0);
assert(isequal(rhs(feq4),P7t),'There is no linear acceleration of the 2nd element, so the right hand of equation of the resultant forces allong the X direction should be equal to zero');

L8t=R2y-Q2-S4*sin(alpha);
assert(ismember(R2y,symvar(lhs(feq5))),'There is an acting in the Y direction reaction force in the support of the 2nd element');
assert(ismember(Q2,symvar(lhs(feq5)))|| ismember(g,symvar(lhs(feq5))),'There is a weight of the 2nd element, acting in the Y direction');
assert(ismember(S4,symvar(lhs(feq5))),'There is an acting in the Y direction tension force in the rod connected to the 2nd element');
assert(ismember(alpha,symvar(lhs(feq5))),'The force S4 should be projected to Y axis, try using the trygonometric functions');
assert(isequal(lhs(feq5),L8t),'Error in the left side of equation of the Y components of the resultant force acting on the 2nd element');

P8t=sym(0);
assert(isequal(rhs(feq5),P8t),'There is no linear acceleration of the 2nd element, so the right hand of equation of the resultant forces allong the Y direction should be equal to zero');

L9t=S1*r2-S4*r2;
assert(ismember(S1,symvar(lhs(feq6))),'There is a moment of force results from the force S1 acting on the 2nd element');
assert(ismember(S4,symvar(lhs(feq6))),'There is a moment of force results from the force S4 acting on the 2nd element');
assert(isequal(lhs(feq6),L9t),'Error in the left side of the equation of the resultant moments of the forces acting on the 2nd element');

P9t=-I2*e2;
assert(ismember(I2,symvar(rhs(feq6))) || ismember(m2,symvar(rhs(feq6))),'The resultant moment of forces is proportional to the moment of inertia of the 2nd element');
assert(ismember(e2,symvar(rhs(feq6))),'The resultant moment of forces is proportional to the angular acceleration of the 2nd element');
assert(isequal(rhs(feq6),P9t),'Error in the right side of the equation of the resultant moments of the forces acting on the 2nd element');


L10t=e2*r2;
assert(ismember(r2,symvar(lhs(keq4))),'Check if You put the right arm');
assert(isequal(lhs(keq4),L10t),'The left side of the kinematic equation should contain the product of the angular acceleration of the 2nd element and the arm');

P10t=a2;
assert(isequal(rhs(keq4),P10t),'The right side of the kinematic equation should contain the linear acceleration of the rod a2');

L11t=e2*r2;
assert(ismember(r2,symvar(lhs(keq5))),'Check if You put the right arm');
assert(isequal(lhs(keq5),L11t),'The left side of the kinematic equation should contain the product of the angular acceleration of the 2nd element and the arm');

P11t=a3;
assert(isequal(rhs(keq5),P11t),'The right side of the kinematic equation should contain the linear acceleration of the rod a3');
