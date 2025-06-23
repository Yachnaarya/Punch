# app/helpers/punches_helper.rb
module PunchsHelper
    def total_break_for(punches)
      total_seconds = punches.select { |p| p.in_time && p.out_time }.sum do |p|
        p.out_time - p.in_time
      end
  
      hours = (total_seconds / 3600).to_i
      minutes = ((total_seconds % 3600) / 60).to_i
  
      "#{hours}h #{minutes}m"
    end

    def total_entry_for(punches)
      total_entry = 0
      punches.each do |punch|
        if punch.in_time.present? && punch.out_time.present?
          total_entry +=2
        elsif punch.in_time.present? || punch.out_time.present?
          total_entry +=1
        end
      end
      total_entry
    end
  end
  