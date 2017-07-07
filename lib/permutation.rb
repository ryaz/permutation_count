class Permutation
  def initialize(str, type = 'lexicographic_order')
    @str = is_a?(String) ? str : str.to_s
    @list_type = type
  end

  def count
    size = @str.size
    list.select {|i| i.to_i.to_s.size == size}.count
  end

  def list
    if @list_type == 'lexicographic_order'
      lexicographic_order # using lexicographic order - https://en.wikipedia.org/wiki/Permutation#Algorithms_to_generate_permutations
    else
      standard # standard ruby implementation
    end
  end

  def standard
    @str.chars.to_a.permutation.map{|i| i.join.to_i}.uniq
  end

  def lexicographic_order
    a = sort(@str)
    perms = []
    finished = false
    until finished
      perms.push(a.dup)
      i = a.size - 1
      while i >= 0
        i -= 1
        break if a[i] < a[i + 1]
      end

      if i == -1
        finished = true
      else
        ceil = find_ceil(a, a[i], i + 1, a.size - 1)
        temp = a[i]
        a[i] = a[ceil]
        a[ceil] = temp
        a = a[0..i] + sort(a[(i + 1)..(a.size - 1)])
      end
    end
    perms
  end

  def sort(st)
    st.chars.to_a.sort.join
  end

  def find_ceil(a, first, l, h)
    ceil = l
    for i in (l + 1)..h do
      ceil = i if a[i] > first && a[i] < a[ceil]
    end
    ceil
  end
end
