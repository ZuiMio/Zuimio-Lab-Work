p9t='a4';
assert(isequal(p9,p9t),'Error in the mark, assigned to the linear acceleration of the 4th element, look at the line %(1.1)');

F16t='S2';
assert(isequal(F16,F16t),'Error in the mark, assigned to the tension in the chord, try another symbol from line %(1.4)');

F17t='Q4';
assert(isequal(F17,F17t),'Error in the mark, assigned to the weight of the 4th element, look at the block %(0.1)');

L15t=-Q4+S2;
assert(ismember(Q4,symvar(lhs(feq10)))|| ismember(g,symvar(lhs(feq10))),'There is a weight of the 4th element, acting in the Y direction');
assert(ismember(S2,symvar(lhs(feq10))),'There is an acting in the Y direction tension force in the rod connected to the 4th element');
assert(isequal(lhs(feq10),L15t),'Error in the left side of equation of the Y components of the resultant force acting on the 4th element');

P15t=-m4*a4;
assert(ismember(m4,symvar(rhs(feq10))),'The resultant force in Y direction is proportional to the mas of the 4th element');
assert(ismember(a4,symvar(rhs(feq10))),'The resultant force in Y direction is proportional to the linear acceleration of the 4th element');
assert(isequal(rhs(feq10),P15t),'Error in the right side of the equation of the resultant force acting on the 3rd element in Y direction');
