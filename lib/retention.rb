require "date"

module Retention
  class Error < StandardError; end
  class Plan
    class << self
      PLANS = %w(standard gold platinum)
      NO_OF_DAYS = 42
      NO_OF_MONTHS = 12
      NO_OF_YEARS = 7
      
      def get_retention_date(plan, snapshot_date)
        if PLANS.include?(plan)
          plan_method = "get_#{plan}_plan_retention_date"
          method(plan_method).call(snapshot_date)
        else
          raise "Invalid Plan, Available plans are #{PLANS.join(', ')}"
        end
      end

      def get_standard_plan_retention_date(snapshot_date)
        snapshot_date + NO_OF_DAYS
      end

      def get_gold_plan_retention_date(snapshot_date)
        if snapshot_date.month != snapshot_date.next_day.month 
          snapshot_date.next_month(NO_OF_MONTHS)
        else
          snapshot_date + NO_OF_DAYS
        end
      end

      def get_platinum_plan_retention_date(snapshot_date)
        if snapshot_date.year != snapshot_date.next_day.year
          snapshot_date.next_year(NO_OF_YEARS)
        elsif snapshot_date.month != snapshot_date.next_day.month
          snapshot_date.next_month(NO_OF_MONTHS)
        else
          snapshot_date + NO_OF_DAYS
        end
      end
    end
  end
end
