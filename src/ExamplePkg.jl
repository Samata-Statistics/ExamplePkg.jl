module ExamplePkg

"Simple calculation utilities package."

export add, sub, mul, div_safe, pow, mean_vector, std_vector

"""
    add(a, b)

Return `a + b`.
"""
function add(a::Number, b::Number)
    a + b
end

"""
    sub(a, b)

Return `a - b`.
"""
function sub(a::Number, b::Number)
    a - b
end

"""
    mul(a, b)

Return `a * b`.
"""
function mul(a::Number, b::Number)
    a * b
end

"""
    div_safe(a, b)

Return `a / b`, but throw a helpful error if `b == 0`.
"""
function div_safe(a::Number, b::Number)
    b == 0 && error("Division by zero in div_safe(a, b).")
    a / b
end

"""
    pow(a, p)

Return `a^p`.
"""
function pow(a::Number, p::Number)
    a^p
end

"""
    mean_vector(x)

Return the (arithmetic) mean of a numeric vector `x`.

Throws an error if the vector is empty.
"""
function mean_vector(x::AbstractVector{<:Number})
    isempty(x) && error("mean_vector: vector is empty.")
    sum(x) / length(x)
end

"""
    std_vector(x)

Return the sample standard deviation of a numeric vector `x`.

Uses the unbiased denominator `n - 1`. Throws an error if `length(x) < 2`.
"""
function std_vector(x::AbstractVector{<:Number})
    n = length(x)
    n < 2 && error("std_vector: need at least 2 elements.")

    μ = mean_vector(x)
    s2 = sum((xi - μ)^2 for xi in x) / (n - 1)
    sqrt(s2)
end

end # module
