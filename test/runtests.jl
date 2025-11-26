using Test
using ExamplePkg   # change to CalcPkg if that’s your module name

@testset "basic arithmetic" begin
    @test add(1, 2) == 3
    @test add(-1, 2) == 1

    @test sub(5, 3) == 2
    @test sub(0, 3) == -3

    @test mul(2, 3) == 6
    @test mul(-2, 3) == -6

    @test div_safe(10, 2) == 5
    @test div_safe(7.0, 2.0) ≈ 3.5

    @test pow(2, 3) == 8
    @test pow(4.0, 0.5) ≈ 2.0
end

@testset "div_safe errors" begin
    @test_throws ErrorException div_safe(1, 0)
end

@testset "mean_vector" begin
    x = [1.0, 2.0, 3.0, 4.0]
    @test mean_vector(x) ≈ 2.5

    y = [10, 10, 10]
    @test mean_vector(y) == 10
end

@testset "std_vector" begin
    x = [1.0, 2.0, 3.0, 4.0]  # sample std with n-1 denominator
    # compute expected by hand: mean = 2.5, deviations = [-1.5, -0.5, 0.5, 1.5]
    # sum of squares = 1.5^2 + 0.5^2 + 0.5^2 + 1.5^2 = 5
    # variance = 5 / (4 - 1) = 5/3, std = sqrt(5/3)
    @test std_vector(x) ≈ sqrt(5/3)

    z = [0.0, 0.0]
    @test std_vector(z) ≈ 0.0
end

@testset "std_vector errors" begin
    @test_throws ErrorException std_vector([1.0])  # length < 2
end


