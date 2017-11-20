
estaques = [
    [22, 1.21, 160, 0.3, 0],
    [24, 1.13, -110, 0.2, 0.1],
    [21, 1.18, 130, 0.1, -0.2],
    [23, 1.06, -190, 0.15, 0.1],
    [19, 1.17, 160, 0.3, 0.1],
    [22, 1.12, 160, 0.3, -0.15],
    [24.5, 1.02, 160, 0.3, -0.2],
    [23.7, 1.11, -90, -0.2, 0.15],
    [21.6, 1.14, 70, 0.3, -0.2],
    [22.7, 1.21, -130, -0.1, 0.1],
    [23, 1.06, -190, 0.15, 0.1],
    [20.8, 1.17, 160, 0.3, 0.1]
];

offsets = [0, 1.2, 2.4, 3.4, 4.45, 5.74, 6.8, 8.25, 9.0, 10.5, 11.65, 12.6];

module estaca(he,di,tw,tx,ty) {
    intersection() {
        //cilindre
        translate([$dx,$dy,0])
        linear_extrude(height=he,center=false,twist=tw,convexity=0/*,slices=he*/)
        translate([tx,ty,0]) circle(d=di,$fn=10);
        
        //punta
        translate([$dx+cos(tw)*tx,$dy+cos(tw)*ty,0])
            linear_extrude(height=he,center=false,twist=tw/2,scale=[0,0],convexity=0)
            circle(d=di*9,$fn=9);
    }
}

$dx=0;
$dy=0;

//estaca(estaques[0][0],estaques[0][1],estaques[0][2],estaques[0][3],estaques[0][4]);
for(i=[0:11]){
    $dx= offsets[i];
    estaca(estaques[i][0],estaques[i][1],estaques[i][2],estaques[i][3],estaques[i][4]);
}

//  SEGON COSTAT (en diagonal  60º)
for(i=[1:11]){
    $dx= 12.5 + offsets[i]/3;
    $dy= (offsets[i]/3)*2;
    estaca(estaques[i][0],estaques[i][1],estaques[i][2],estaques[i][3],estaques[i][4]);
}

//  TERCER COSTAT (paral·lel a x)
for(i=[1:11]){
    $dx= offsets[i] + 16.6667;
    $dy= 8.3333;
    estaca(estaques[i][0],estaques[i][1],estaques[i][2],estaques[i][3],estaques[i][4]);
}

//  QUART COSTAT (en diagonal  60º)
echo (12.5*4/3);
for(i=[1:11]){
    $dx= 29.1667 + offsets[i]/3;
    $dy= (offsets[i]+12.5)*2/3;
    estaca(estaques[i][0],estaques[i][1],estaques[i][2],estaques[i][3],estaques[i][4]);
}

