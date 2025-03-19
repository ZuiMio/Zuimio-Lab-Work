p10t='e5';
assert(isequal(p10,p10t),'Error in the mark, assigned to the angular acceleration of the 5th element, look at the line %(1.2)');

p11t='a5o';
assert(isequal(p11,p11t),'Error in the mark, assigned to the linear acceleration of the center of mas of the 5th element, look at the line %(1.1)');

p12t='a5';
assert(isequal(p12,p12t),'Error in the mark, assigned to the linear acceleration of the chord attached to the right edge of the 5th element, look at the line %(1.1)');

F18t='Q5';
assert(isequal(F18,F18t),'Error in the mark, assigned to the weight of the 5th element, look at the block %(0.1)');

F19t='S5';
assert(isequal(F19,F19t),'Error in the mark, assigned to the tension in the chord, try another symbol from line %(1.4)');

F20t='S3';
assert(isequal(F20,F20t),'Error in the mark, assigned to the tension in the chord, try another symbol from line %(1.4)');

L16t=S5+S3-Q5;
assert(ismember(S5,symvar(lhs(feq11))),'There is an acting in the Y direction tension force in the rod connected to the 5th element');
assert(ismember(S3,symvar(lhs(feq11))),'There is an acting in the Y direction tension force in the rod connected to the 5th element');
assert(ismember(Q5,symvar(lhs(feq11)))|| ismember(g,symvar(lhs(feq11))),'There is a weight of the 5th element, acting in the Y direction');
assert(isequal(lhs(feq11),L16t),'Error in the left side of equation of the Y components of the resultant force acting on the 5th element');

P16t=m5*a5o;
assert(ismember(m5,symvar(rhs(feq11))),'The resultant force in X_s direction is proportional to the mas of the 3rd element');
assert(ismember(a5o,symvar(rhs(feq11))),'The resultant force in X_s direction is proportional to the linear acceleration of the 3rd element');
assert(isequal(rhs(feq11),P16t),'Error in the right side of the equation of the resultant force acting on the 3rd element in X_s direction');

L17t=S3*r5-S5*r5;
assert(ismember(S3,symvar(lhs(feq12))),'There is a moment of force results from the force S3 acting on the 5th element');
assert(ismember(S5,symvar(lhs(feq12))),'There is a moment of force results from the force S5 acting on the 5th element');
assert(isequal(lhs(feq12),L17t),'Error in the left side of the equation of the resultant moments of the forces acting on the 5th element');

P17t=I5*e5;
assert(ismember(I5,symvar(rhs(feq12))) || ismember(m5,symvar(rhs(feq12))),'The resultant moment of forces is proportional to the moment of inertia of the 5th element');
assert(ismember(e5,symvar(rhs(feq12))),'The resultant moment of forces is proportional to the angular acceleration of the 5th element');
assert(isequal(rhs(feq12),P17t),'Error in the right side of the equation of the resultant moments of the forces acting on the 5th element');


L18t=a5;
assert(isequal(lhs(keq6),L18t),'The right side of the kinematic equation should contain the linear acceleration of the rod a5');

P18t=simplify(e5*(2*r5));
P18tx=e5*r5;
assert(ismember(r5,symvar(rhs(keq6))),'Check if You put the right arm');
assert(not(isequal(rhs(keq6),P18tx)),'The linear acceleration of the rod connected to right edge of 5th element is eqaul to doubled linear acceleration of the mass center.');
assert(isequal(rhs(keq6),P18t),'The left side of the kinematic equation should contain the product of the angular acceleration of the 5th element and the arm');

L19t=a5;
assert(isequal(lhs(keq7),L19t),'The right side of the kinematic equation should contain the linear acceleration of the rod a5');

P19t1=2*a5o;
P19t2=e5*r5;
assert(isequal(rhs(keq7),P19t1)|| isequal(rhs(keq7),P19t2),'Error in the kinematic equation connecting linear acceleration a5 and angular acceleration e5 or linear acceleration of the mass center a5o.');

