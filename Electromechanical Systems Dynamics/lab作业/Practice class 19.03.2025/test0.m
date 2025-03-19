Q1t=(m1+M1)*g;
Q2t=m2*g;
Q3t=m3*g;
Q4t=m4*g;
Q5t=m5*g;

I1t=0.5*m1*r1^2+0.5*M1*R1^2;
I2t=0.5*m2*r2^2;
I5t=0.5*m5*r5^2;

assert(ismember(M1,symvar(Q1)),'The weight of the 1st element depends on the mass M1');
assert(ismember(m1,symvar(Q1)),'The weight of the 1st element depends on the mass m1');
assert(ismember(g,symvar(Q1)),'The weight Q1 is proportional to the mass to the acceleration of the Earth g');
assert(isequal(simplify(Q1),simplify(Q1t)),'Error in the definition of the weight of 1st element');

assert(ismember(m2,symvar(Q2)),'The weight of the 2nd element depends on the mass m2');
assert(ismember(g,symvar(Q2)),'The weight Q2 is proportional to the mass to the acceleration of the Earth g');
assert(isequal(Q2,Q2t),'Error in the definition of the weight of 2nd element');

assert(ismember(m3,symvar(Q3)),'The weight of the 3rd element depends on the mass m3');
assert(ismember(g,symvar(Q3)),'The weight Q3 is proportional to the mass to the acceleration of the Earth g');
assert(isequal(Q3,Q3t),'Error in the definition of the weight of 3rd element');

assert(ismember(m4,symvar(Q4)),'The weight of the 4th element depends on the mass m4');
assert(ismember(g,symvar(Q4)),'The weight Q4 is proportional to the mass to the acceleration of the Earth g');
assert(isequal(Q4,Q4t),'Error in the definition of the weight of 4th element');

assert(ismember(m5,symvar(Q5)),'The weight of the 5th element depends on the mass m5');
assert(ismember(g,symvar(Q5)),'The weight Q5 is proportional to the mass to the acceleration of the Earth g');
assert(isequal(Q5,Q5t),'Error in the definition of the weight of 5th element');

assert(ismember(m1,symvar(I1)),'The moment of inertia of the 1st element depends on the mass m1 and M1');
assert(ismember(M1,symvar(I1)),'The moment of inertia of the 1st element depends on the mass m1 and M1');
assert(ismember(r1,symvar(I1)),'The moment of inertia of the 1st element depends on the radii r1 and R1');
assert(ismember(R1,symvar(I1)),'The moment of inertia of the 1st element depends on the radii r1 and R1');
assert(isequal(simplify(I1),simplify(I1t)),'Error in the definition of the moment of inertia of 1st element');

assert(ismember(m2,symvar(I2)),'The moment of inertia of the 2nd element depends on the mass m2');
assert(ismember(r2,symvar(I2)),'The moment of inertia of the 2nd element depends on the radii r2');
assert(isequal(simplify(sym(I2)),simplify(I2t)),'Error in the definition of the moment of inertia of 2nd element');

assert(ismember(m5,symvar(I5)),'The moment of inertia of the 5th element depends on the mass m5');
assert(ismember(r5,symvar(I5)),'The moment of inertia of the 5th element depends on the radii r5');
assert(isequal(simplify(sym(I5)),simplify(I5t)),'Error in the definition of the moment of inertia of 5th element');

%disp('Testy czesci wprowadzajacej przebiegly pomyslnie')