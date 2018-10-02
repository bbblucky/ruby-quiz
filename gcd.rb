# find the greatest common divisor of array
def gcd(a, b)
  a, b = b, a if a < b
  if b == 0
    return a
  else
    return gcd(b, a%b)
  end
end

# n = arr.size
def ngcd(arr, n)
  return arr[0] if n == 1
  return gcd(arr[n-1], ngcd(arr, n-1))
end

def ngcd2(arr)
  if arr.size == 0
    return 0
  else
    res = gcd(arr[0], 0)
    for i in 1..arr.size-1
      res = gcd(res, arr[i])
    end
    return res
  end
end
