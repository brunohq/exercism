# frozen_string_literal: true

class TwoBucket
  attr_reader :buckets, :moves, :goal

  def initialize(bucket1, bucket2, goal, start)
    @buckets = {
      one: { max: bucket1, current: 0 },
      two: { max: bucket2, current: 0 }
    }
    @goal = goal
    @moves = 0

    solve(start)
  end

  def solve(start)
    one = bucket_id(start)
    two = bucket_id(start, true)
    fill(one)

    until solved?
      if moves == 1 then transfer(one, two)
      elsif buckets[one][:current].zero? then fill(one)
      elsif buckets[one][:current] == buckets[one][:max] && buckets[two][:current] < buckets[two][:max] then transfer(one, two)
      elsif buckets[two][:current] == buckets[two][:max] then empty(two)
      elsif buckets[two][:current].zero? && buckets[one][:current] < buckets[one][:max] then transfer(one, two)
      end
    end
  end

  def goal_bucket
    @buckets.each { |id, bucket| return bucket_name(id) if bucket[:current] == @goal }
  end

  def other_bucket
    @buckets.each { |_id, bucket| return bucket[:current] if bucket[:current] != @goal }
  end

  def transfer(from, to)
    max_amount = @buckets[to][:max] - @buckets[to][:current]
    transfer_amount = [max_amount, @buckets[from][:current]].min

    @buckets[to][:current] += transfer_amount
    @buckets[from][:current] -= transfer_amount

    @moves += 1
  end

  def fill(bucket)
    @buckets[bucket][:current] = @buckets[bucket][:max]
    @moves += 1
  end

  def empty(bucket)
    @buckets[bucket][:current] = 0
    @moves += 1
  end

  def solved?
    @buckets.any? { |_id, bucket| bucket[:current] == @goal }
  end

  def bucket_name(id)
    id == :one ? 'one' : 'two'
  end

  def bucket_id(name, opposite = false)
    if !opposite
      name == 'one' ? :one : :two
    else
      name == 'one' ? :two : :one
    end
  end
end
