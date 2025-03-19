p8t='a3';
assert(isequal(p8,p8t),'Error in the mark, assigned to the linear acceleration of the 3rd element, look at the line %(1.1)');

F12t='Q3';
assert(isequal(F12,F12t),'Error in the mark, assigned to the weight of the 3rd element, look at the block %(0.1)');

F13t='N3';
assert(isequal(F13,F13t),'Error in the mark, assigned to the substrate reaction acting on the 3rd element, look at the line %(1.6)');

F14t='T3';
assert(isequal(F14,F14t),'Error in the mark, assigned to the friction force acting on the 3rd element, look at the line %(1.5)');

F15t='S4';
assert(isequal(F15,F15t),'Error in the mark, assigned to the tension in the chord, try another symbol from line %(1.4)');

L12t=T3;
assert(isequal(lhs(feq7),L12t),'The left side of the friction equation should consist of the friction force T3');

P12t=mu*N3;
assert(isequal(rhs(feq7),P12t),'The friction force is proportional to the substrate reaction force and the sliding friction coefficient');

L13t=-S4-T3+Q3*sin(alpha);
assert(ismember(Q3,symvar(lhs(feq8)))|| ismember(g,symvar(lhs(feq8))),'There is a weight of the 3rd element, acting in the X_s direction');
assert(ismember(S4,symvar(lhs(feq8))),'There is an acting in the X_s direction tension force in the rod connected to the 3rd element');
assert(ismember(T3,symvar(lhs(feq8))),'There is an acting in the X_s direction friction force acting on the 3rd element');
assert(ismember(alpha,symvar(lhs(feq8))),'The force Q3 should be projected to X_s axis, try using the trygonometric functions');
assert(isequal(lhs(feq8),L13t),'Error in the left side of equation of the X_s components of the resultant force acting on the 3rd element');

P13t=m3*a3;
assert(ismember(m3,symvar(rhs(feq8))),'The resultant force in X_s direction is proportional to the mas of the 3rd element');
assert(ismember(a3,symvar(rhs(feq8))),'The resultant force in X_s direction is proportional to the linear acceleration of the 3rd element');
assert(isequal(rhs(feq8),P13t),'Error in the right side of the equation of the resultant force acting on the 3rd element in X_s direction');

L14t=N3-Q3*cos(alpha);
assert(ismember(Q3,symvar(lhs(feq9)))|| ismember(g,symvar(lhs(feq9))),'There is a weight of the 3rd element, acting in the Y_s direction');
assert(ismember(N3,symvar(lhs(feq9))),'There is an acting in the Y_s direction substrate reaction force in the rod connected to the 3rd element');
assert(ismember(alpha,symvar(lhs(feq9))),'The force Q3 should be projected to Y_s axis, try using the trygonometric functions');
assert(isequal(lhs(feq9),L14t),'Error in the left side of the equation of the resultant force acting on the 3rd element in Y_s direction');

P14t=sym(0);
assert(isequal(rhs(feq9),P14t),'Error in the right side of the equation of the resultant force acting on the 3rd element in Y_s direction');


