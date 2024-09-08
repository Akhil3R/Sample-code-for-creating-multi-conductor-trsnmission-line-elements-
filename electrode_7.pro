Group {
  Diel1 = Region[11]; // Air region
  Ground = Region[12]; // If you have a ground plane, else remove this
  Electrode1 = Region[1];
  Electrode2 = Region[2];
  Electrode3 = Region[3];
  Electrode4 = Region[4];
  Electrode5 = Region[5];
  Electrode6 = Region[6];
  Electrode7 = Region[7];
  Electrode8 = Region[8];
  Electrode9 = Region[9];
  Electrode10 = Region[10];
  Vol_Ele = Region[ {Diel1} ];
  Sur_Neu_Ele = Region[ {} ];
}

Function {
  eps0 = 8.854187818e-12;
  epsilon[Diel1] = 1 * eps0;
}

Constraint {
  { Name Dirichlet_Ele; Type Assign;
    Case {
      { Region Ground; Value 0.; }      { Region Electrode1; Value 0.; }      { Region Electrode2; Value 0.; }      { Region Electrode3; Value 0.; }      { Region Electrode4; Value 0.; }      { Region Electrode5; Value 0.; }      { Region Electrode6; Value 0.; }      { Region Electrode7; Value 1.; }      { Region Electrode8; Value 0.; }      { Region Electrode9; Value 0.; }      { Region Electrode10; Value 0.; }
    }
  }
}

Group {
  Dom_Hgrad_v_Ele = Region[ {Vol_Ele, Sur_Neu_Ele} ];
}

Jacobian {
  { Name Vol ;
    Case {
      { Region All ; Jacobian Vol ; }
    }
  }
  { Name Sur ;
    Case {
      { Region All ; Jacobian Sur ; }
    }
  }
}

Integration {
  { Name Int ;
    Case {
      { Type Gauss ;
        Case {
          { GeoElement Point       ; NumberOfPoints  1 ; }
          { GeoElement Line        ; NumberOfPoints  4 ; }
          { GeoElement Triangle    ; NumberOfPoints  4 ; }
          { GeoElement Quadrangle  ; NumberOfPoints  4 ; }
          { GeoElement Tetrahedron ; NumberOfPoints  4 ; }
          { GeoElement Hexahedron  ; NumberOfPoints  6 ; }
          { GeoElement Prism       ; NumberOfPoints  6 ; }
        }
      }
    }
  }
}

FunctionSpace {
  { Name Hgrad_v_Ele; Type Form0;
    BasisFunction {
      { Name sn; NameOfCoef vn; Function BF_Node;
        Support Dom_Hgrad_v_Ele; Entity NodesOf[ All, Not {Electrode1, Electrode2, Electrode3, Electrode4, Electrode5, Electrode6, Electrode7, Electrode8, Electrode9, Electrode10} ]; }
      { Name sf1; NameOfCoef vf1; Function BF_GroupOfNodes;
        Support Dom_Hgrad_v_Ele; Entity GroupsOfNodesOf[ Electrode1 ]; }
      { Name sf2; NameOfCoef vf2; Function BF_GroupOfNodes;
        Support Dom_Hgrad_v_Ele; Entity GroupsOfNodesOf[ Electrode2 ]; }
      { Name sf3; NameOfCoef vf3; Function BF_GroupOfNodes;
        Support Dom_Hgrad_v_Ele; Entity GroupsOfNodesOf[ Electrode3 ]; }
      { Name sf4; NameOfCoef vf4; Function BF_GroupOfNodes;
        Support Dom_Hgrad_v_Ele; Entity GroupsOfNodesOf[ Electrode4 ]; }
      { Name sf5; NameOfCoef vf5; Function BF_GroupOfNodes;
        Support Dom_Hgrad_v_Ele; Entity GroupsOfNodesOf[ Electrode5 ]; }
      { Name sf6; NameOfCoef vf6; Function BF_GroupOfNodes;
        Support Dom_Hgrad_v_Ele; Entity GroupsOfNodesOf[ Electrode6 ]; }
      { Name sf7; NameOfCoef vf7; Function BF_GroupOfNodes;
        Support Dom_Hgrad_v_Ele; Entity GroupsOfNodesOf[ Electrode7 ]; }
      { Name sf8; NameOfCoef vf8; Function BF_GroupOfNodes;
        Support Dom_Hgrad_v_Ele; Entity GroupsOfNodesOf[ Electrode8 ]; }
      { Name sf9; NameOfCoef vf9; Function BF_GroupOfNodes;
        Support Dom_Hgrad_v_Ele; Entity GroupsOfNodesOf[ Electrode9 ]; }
      { Name sf10; NameOfCoef vf10; Function BF_GroupOfNodes;
        Support Dom_Hgrad_v_Ele; Entity GroupsOfNodesOf[ Electrode10 ]; }
    }
    GlobalQuantity {
      { Name GlobalPotential1; Type AliasOf; NameOfCoef vf1; }
      { Name GlobalPotential2; Type AliasOf; NameOfCoef vf2; }
      { Name GlobalPotential3; Type AliasOf; NameOfCoef vf3; }
      { Name GlobalPotential4; Type AliasOf; NameOfCoef vf4; }
      { Name GlobalPotential5; Type AliasOf; NameOfCoef vf5; }
      { Name GlobalPotential6; Type AliasOf; NameOfCoef vf6; }
      { Name GlobalPotential7; Type AliasOf; NameOfCoef vf7; }
      { Name GlobalPotential8; Type AliasOf; NameOfCoef vf8; }
      { Name GlobalPotential9; Type AliasOf; NameOfCoef vf9; }
      { Name GlobalPotential10; Type AliasOf; NameOfCoef vf10; }
      { Name ArmatureCharge1; Type AssociatedWith; NameOfCoef vf1; }
      { Name ArmatureCharge2; Type AssociatedWith; NameOfCoef vf2; }
      { Name ArmatureCharge3; Type AssociatedWith; NameOfCoef vf3; }
      { Name ArmatureCharge4; Type AssociatedWith; NameOfCoef vf4; }
      { Name ArmatureCharge5; Type AssociatedWith; NameOfCoef vf5; }
      { Name ArmatureCharge6; Type AssociatedWith; NameOfCoef vf6; }
      { Name ArmatureCharge7; Type AssociatedWith; NameOfCoef vf7; }
      { Name ArmatureCharge8; Type AssociatedWith; NameOfCoef vf8; }
      { Name ArmatureCharge9; Type AssociatedWith; NameOfCoef vf9; }
      { Name ArmatureCharge10; Type AssociatedWith; NameOfCoef vf10; }
    }
    Constraint {
      { NameOfCoef vn; EntityType NodesOf; NameOfConstraint Dirichlet_Ele; }
      { NameOfCoef vf1; EntityType GroupsOfNodesOf; NameOfConstraint Dirichlet_Ele; }
      { NameOfCoef vf2; EntityType GroupsOfNodesOf; NameOfConstraint Dirichlet_Ele; }
      { NameOfCoef vf3; EntityType GroupsOfNodesOf; NameOfConstraint Dirichlet_Ele; }
      { NameOfCoef vf4; EntityType GroupsOfNodesOf; NameOfConstraint Dirichlet_Ele; }
      { NameOfCoef vf5; EntityType GroupsOfNodesOf; NameOfConstraint Dirichlet_Ele; }
      { NameOfCoef vf6; EntityType GroupsOfNodesOf; NameOfConstraint Dirichlet_Ele; }
      { NameOfCoef vf7; EntityType GroupsOfNodesOf; NameOfConstraint Dirichlet_Ele; }
      { NameOfCoef vf8; EntityType GroupsOfNodesOf; NameOfConstraint Dirichlet_Ele; }
      { NameOfCoef vf9; EntityType GroupsOfNodesOf; NameOfConstraint Dirichlet_Ele; }
      { NameOfCoef vf10; EntityType GroupsOfNodesOf; NameOfConstraint Dirichlet_Ele; }
    }
  }
}

Formulation {
  { Name Electrostatics_v; Type FemEquation;
    Quantity {
      { Name v; Type Local; NameOfSpace Hgrad_v_Ele; }
      { Name U1; Type Global; NameOfSpace Hgrad_v_Ele[GlobalPotential1]; }
      { Name U2; Type Global; NameOfSpace Hgrad_v_Ele[GlobalPotential2]; }
      { Name U3; Type Global; NameOfSpace Hgrad_v_Ele[GlobalPotential3]; }
      { Name U4; Type Global; NameOfSpace Hgrad_v_Ele[GlobalPotential4]; }
      { Name U5; Type Global; NameOfSpace Hgrad_v_Ele[GlobalPotential5]; }
      { Name U6; Type Global; NameOfSpace Hgrad_v_Ele[GlobalPotential6]; }
      { Name U7; Type Global; NameOfSpace Hgrad_v_Ele[GlobalPotential7]; }
      { Name U8; Type Global; NameOfSpace Hgrad_v_Ele[GlobalPotential8]; }
      { Name U9; Type Global; NameOfSpace Hgrad_v_Ele[GlobalPotential9]; }
      { Name U10; Type Global; NameOfSpace Hgrad_v_Ele[GlobalPotential10]; }
      { Name Q1; Type Global; NameOfSpace Hgrad_v_Ele[ArmatureCharge1]; }
      { Name Q2; Type Global; NameOfSpace Hgrad_v_Ele[ArmatureCharge2]; }
      { Name Q3; Type Global; NameOfSpace Hgrad_v_Ele[ArmatureCharge3]; }
      { Name Q4; Type Global; NameOfSpace Hgrad_v_Ele[ArmatureCharge4]; }
      { Name Q5; Type Global; NameOfSpace Hgrad_v_Ele[ArmatureCharge5]; }
      { Name Q6; Type Global; NameOfSpace Hgrad_v_Ele[ArmatureCharge6]; }
      { Name Q7; Type Global; NameOfSpace Hgrad_v_Ele[ArmatureCharge7]; }
      { Name Q8; Type Global; NameOfSpace Hgrad_v_Ele[ArmatureCharge8]; }
      { Name Q9; Type Global; NameOfSpace Hgrad_v_Ele[ArmatureCharge9]; }
      { Name Q10; Type Global; NameOfSpace Hgrad_v_Ele[ArmatureCharge10]; }
    }
    Equation {
      Integral { [ epsilon[] * Dof{d v} , {d v} ];
        In Vol_Ele; Jacobian Vol; Integration Int; }
      GlobalTerm { [ -Dof{Q1} , {U1} ]; In Electrode1; }
      GlobalTerm { [ -Dof{Q2} , {U2} ]; In Electrode2; }
      GlobalTerm { [ -Dof{Q3} , {U3} ]; In Electrode3; }
      GlobalTerm { [ -Dof{Q4} , {U4} ]; In Electrode4; }
      GlobalTerm { [ -Dof{Q5} , {U5} ]; In Electrode5; }
      GlobalTerm { [ -Dof{Q6} , {U6} ]; In Electrode6; }
      GlobalTerm { [ -Dof{Q7} , {U7} ]; In Electrode7; }
      GlobalTerm { [ -Dof{Q8} , {U8} ]; In Electrode8; }
      GlobalTerm { [ -Dof{Q9} , {U9} ]; In Electrode9; }
      GlobalTerm { [ -Dof{Q10} , {U10} ]; In Electrode10; }
    }
  }
}

Resolution {
  { Name EleSta_v;
    System {
      { Name Sys_Ele; NameOfFormulation Electrostatics_v; }
    }
    Operation {
      Generate[Sys_Ele]; Solve[Sys_Ele]; SaveSolution[Sys_Ele];
    }
  }
}

// ... [Previous sections remain unchanged] ...

// ... [Previous sections remain unchanged] ...

PostProcessing {
  { Name EleSta_v; NameOfFormulation Electrostatics_v;
    Quantity {
      { Name v; Value { Term { [ {v} ]; In Dom_Hgrad_v_Ele; Jacobian Vol; } } }
      { Name e; Value { Term { [ -{d v} ]; In Dom_Hgrad_v_Ele; Jacobian Vol; } } }
      { Name d; Value { Term { [ -epsilon[] * {d v} ]; In Dom_Hgrad_v_Ele; Jacobian Vol; } } }
      { Name Q1; Value { Term { [ {Q1} ]; In Electrode1; } } }
      { Name Q2; Value { Term { [ {Q2} ]; In Electrode2; } } }
      { Name Q3; Value { Term { [ {Q3} ]; In Electrode3; } } }
      { Name Q4; Value { Term { [ {Q4} ]; In Electrode4; } } }
      { Name Q5; Value { Term { [ {Q5} ]; In Electrode5; } } }
      { Name Q6; Value { Term { [ {Q6} ]; In Electrode6; } } }
      { Name Q7; Value { Term { [ {Q7} ]; In Electrode7; } } }
      { Name Q8; Value { Term { [ {Q8} ]; In Electrode8; } } }
      { Name Q9; Value { Term { [ {Q9} ]; In Electrode9; } } }
      { Name Q10; Value { Term { [ {Q10} ]; In Electrode10; } } }
    }
  }
}

PostOperation {
  { Name Map; NameOfPostProcessing EleSta_v;
    Operation {
      Print[ Q1, OnRegion Electrode1, Format Table, File > "output.txt" ];
      Print[ Q2, OnRegion Electrode2, Format Table, File >> "output.txt" ];
      Print[ Q3, OnRegion Electrode3, Format Table, File >> "output.txt" ];
      Print[ Q4, OnRegion Electrode4, Format Table, File >> "output.txt" ];
      Print[ Q5, OnRegion Electrode5, Format Table, File >> "output.txt" ];
      Print[ Q6, OnRegion Electrode6, Format Table, File >> "output.txt" ];
      Print[ Q7, OnRegion Electrode7, Format Table, File >> "output.txt" ];
      Print[ Q8, OnRegion Electrode8, Format Table, File >> "output.txt" ];
      Print[ Q9, OnRegion Electrode9, Format Table, File >> "output.txt" ];
      Print[ Q10, OnRegion Electrode10, Format Table, File >> "output.txt" ];
    }
  }
}
