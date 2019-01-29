// シード値を1000で固定する
noiseSeed(1000);
println(noise(0));
println(noise(1));
println(noise(2));

println("--------");

// シード値をランダムに設定する
int seed = (int)random(10000);
noiseSeed(seed);
println(noise(0));
println(noise(1));
println(noise(2));
