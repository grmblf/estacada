
//  ESTACADA 24
/*
estaques = [ //alçada(mm), diàmetre(mm), torsió(º), desplaçament X(mm), desplaçament Y(mm)
    [22.3, 2.5, 160, 0.1, 0.3],
    [24.1, 2.3, -110, 0.1, -0.2],
    [21.6, 2.4, 130, 0.1, 0.2],
    [23.4, 2.3, -190, 0.1, 0.1],
    [20.1, 2.2, 160, 0.1, -0.15],
    [22.5, 2.4, 160, 0.1, 0.15],
    [24.5, 2.5, 160, 0.1, -0.2]
];
offsets = [0, 2.2, 4.2, 6.3, 8.2, 10.1, 12.3];
quant = 6;


//  ESTACADA 28
estaques = [ //alçada(mm), diàmetre(mm), torsió(º), desplaçament X(mm), desplaçament Y(mm)
    [22.3, 2.8, 160, 0.1, 0.3],
    [24.1, 2.6, -110, 0.1, -0.2],
    [21.6, 3.0, 130, 0.1, 0.2],
    [23.4, 2.9, -190, 0.1, 0.1],
    [20.1, 2.7, 160, 0.1, -0.15],
    [22.5, 2.8, 160, 0.1, 0.15]
];
offsets = [0, 2.6, 5.2, 7.9, 10.2, 12.1];
quant = 5;
*/

//  ESTACADA 32
estaques = [ //alçada(mm), diàmetre(mm), torsió(º), desplaçament X(mm), desplaçament Y(mm)
    [22.3, 3.2, 160, 0.1, 0.3],
    [24.1, 3.1, -110, 0.1, -0.2],
    [21.6, 3.5, 130, 0.1, 0.2],
    [23.4, 3.1, -190, 0.1, 0.1],
    [20.1, 3.3, 160, 0.1, -0.15]
];
offsets = [0.3, 3.1, 6.1, 9.2, 12.0];
quant = 4;



module estaca(he,di,tw,tx,ty) { //alçada(mm), diàmetre(mm), torsió(º), desplaçament X(mm), desplaçament Y(mm)
    intersection() {
        //cilindre
        linear_extrude(height=he,center=false,twist=tw,convexity=0,slices=40)
        translate([tx,ty,0]) circle(d=di,$fn=35);
        
        //punta
        translate([cos(tw)*tx,cos(tw)*ty,0])
            linear_extrude(height=he,center=false,twist=tw/2,scale=[0,0],convexity=0)
            circle(d=di*7,$fn=9);
    }
}


//  PRIMER COSTAT (sobre X)
for(i=[0:quant]){
    translate([offsets[i],0,0])
    estaca(estaques[i][0],estaques[i][1],estaques[i][2],estaques[i][3],estaques[i][4]);
}


//  SEGON COSTAT (en diagonal  60º)
translate([12.5,-1,0])
rotate(60)
for(i=[1:quant]){
    translate([offsets[i],0,0])
    estaca(estaques[i][0],estaques[i][1],estaques[i][2],estaques[i][3],estaques[i][4]);
}

//  TERCER COSTAT (paral·lel a X)
translate([18.0,10.3,0])
for(i=[1:quant]){
    translate([offsets[i],0,0])
    estaca(estaques[i][0],estaques[i][1],estaques[i][2],estaques[i][3],estaques[i][4]);
}

//  QUART COSTAT (en diagonal  60º)
translate([30.0,9.8,0])
rotate(60)
for(i=[1:quant]){
    translate([offsets[i],0,0])
    estaca(estaques[i][0],estaques[i][1],estaques[i][2],estaques[i][3],estaques[i][4]);
}

