# frozen_string_literal: true

require 'spec_helper'
require 'yaml'
require 'date'

RSpec.describe 'Course schedule dates' do
  let(:repo_root) { File.expand_path('..', __dir__) }
  let(:schedule) { YAML.load_file(File.join(repo_root, '_data/schedule.yml')) }
  let(:calendar) { YAML.load_file(File.join(repo_root, '_data/academic_calendar_fa26.yml')) }
  let(:syllabus) { YAML.unsafe_load_file(File.join(repo_root, '_data/syllabus.yml')) }

  def parse_date(value)
    Date.parse(value.to_s)
  end

  def weekday(value)
    parse_date(value).wday
  end

  def normalize_date(value)
    parse_date(value).strftime('%Y-%m-%d')
  end

  def all_session_dates
    schedule.fetch('weeks').flat_map do |week|
      week.fetch('sessions').flat_map do |session|
        session.fetch('dates').map do |entry|
          {
            week: week.fetch('week'),
            date: entry.fetch('date'),
            type: session.fetch('type')
          }
        end
      end
    end
  end

  it 'aligns each schedule week with the academic calendar Mon-Sun bounds' do
    calendar_weeks = calendar.fetch('weeks').each_with_object({}) do |w, hash|
      hash[w.fetch('week')] = w
    end

    schedule.fetch('weeks').each do |week|
      num = week.fetch('week')
      cal = calendar_weeks.fetch(num)
      expect(week.fetch('start')).to eq(cal.fetch('start'))
      expect(week.fetch('end')).to eq(cal.fetch('end'))
      expect(weekday(week.fetch('start'))).to eq(1), "Week #{num} start is not Monday"
      expect(weekday(week.fetch('end'))).to eq(0), "Week #{num} end is not Sunday"
      expect((parse_date(week.fetch('end')) - parse_date(week.fetch('start'))).to_i).to eq(6)
    end
  end

  it 'uses Mon/Wed class days unless the session is a holiday' do
    all_session_dates.each do |entry|
      next if entry[:type] == 'holiday'

      expect([1, 3]).to include(weekday(entry[:date])),
        "Week #{entry[:week]} #{entry[:date]} (#{entry[:type]}) is not Mon/Wed"
    end
  end

  it 'does not duplicate the same session type on the same date within a week' do
    schedule.fetch('weeks').each do |week|
      keys = week.fetch('sessions').flat_map do |session|
        session.fetch('dates').map { |d| [d.fetch('date'), session.fetch('type')] }
      end
      expect(keys).to eq(keys.uniq),
        "Week #{week.fetch('week')} has duplicate session/date pairs"
    end
  end

  it 'includes Mon/Wed Berkeley holidays from the academic calendar on the schedule' do
    holiday_dates = calendar.fetch('holidays').map { |h| normalize_date(h.fetch('date')) }
    scheduled_dates = all_session_dates.map { |entry| normalize_date(entry[:date]) }

    holiday_dates.each do |holiday_date|
      next unless [1, 3].include?(weekday(holiday_date))

      expect(scheduled_dates).to include(holiday_date),
        "Calendar holiday #{holiday_date} is missing from the schedule"
    end
  end

  it 'notes Thanksgiving Thu-Fri in the schedule flags' do
    week14 = schedule.fetch('weeks').find { |w| w.fetch('week') == 14 }
    flag_text = week14.fetch('sessions').flat_map { |s| (s['flags'] || []).map { |f| f.fetch('text') } }.join(' ')
    expect(flag_text).to include('Nov 26-27')
  end

  it 'includes Mon/Wed syllabus holiday dates on the schedule' do
    holiday_dates = syllabus.fetch('extra_days_col2').map { |entry| normalize_date(entry.fetch('date')) }
    scheduled_dates = all_session_dates.map { |entry| normalize_date(entry[:date]) }

    holiday_dates.each do |holiday_date|
      next unless [1, 3].include?(weekday(holiday_date))

      expect(scheduled_dates).to include(holiday_date),
        "Syllabus holiday #{holiday_date} is missing from the schedule"
    end
  end

  it 'has exactly one lab row per instruction week W1-W15' do
    schedule.fetch('weeks').each do |week|
      num = week.fetch('week')
      cal = calendar.fetch('weeks').find { |w| w.fetch('week') == num }
      lab_count = week.fetch('sessions').count { |s| s.fetch('type') == 'lab' }

      if cal.fetch('lab')
        expect(lab_count).to eq(1), "Week #{num} should have exactly one lab row"
      else
        expect(lab_count).to eq(0), "Week #{num} should not have a lab row"
      end
    end
  end

  it 'places Wed Sep 9 in week 3 after Labor Day' do
    week3 = schedule.fetch('weeks').find { |w| w.fetch('week') == 3 }
    dates = week3.fetch('sessions').flat_map { |s| s.fetch('dates').map { |d| d.fetch('date') } }
    expect(dates).to include('2026-09-07', '2026-09-09')
    expect(week3.fetch('start')).to eq('2026-09-07')
    expect(week3.fetch('end')).to eq('2026-09-13')
  end

  it 'marks Veterans Day as a holiday, not a lecture' do
    week12 = schedule.fetch('weeks').find { |w| w.fetch('week') == 12 }
    veterans = week12.fetch('sessions').find do |s|
      s.fetch('type') == 'holiday' && s.fetch('dates').any? { |d| d.fetch('date') == '2026-11-11' }
    end
    expect(veterans).not_to be_nil
    week11 = schedule.fetch('weeks').find { |w| w.fetch('week') == 11 }
    transit_lecture = week11.fetch('sessions').find do |s|
      s.fetch('type') == 'lecture' && s.fetch('dates').any? { |d| d.fetch('date') == '2026-11-04' }
    end
    expect(transit_lecture.fetch('topics').first.fetch('title')).to eq('Transit equity')
  end

  it 'has each curriculum lecture title at most once' do
    titles = schedule.fetch('weeks').flat_map do |week|
      week.fetch('sessions').select { |s| s.fetch('type') == 'lecture' }.map do |s|
        s.fetch('topics').first.fetch('title')
      end
    end
    titles.reject! { |t| t == 'Final Project Exhibition' }
    expect(titles).to eq(titles.uniq), "Duplicate lectures: #{titles.group_by(&:itself).select { |_, v| v.size > 1 }.keys.join(', ')}"
  end

  it 'places Data behind the map on Wed Sep 2 with A0 on Mon Aug 31' do
    week2 = schedule.fetch('weeks').find { |w| w.fetch('week') == 2 }
    mon = week2.fetch('sessions').find { |s| s.fetch('type') == 'lecture' && s.fetch('dates').any? { |d| d.fetch('date') == '2026-08-31' } }
    wed = week2.fetch('sessions').find { |s| s.fetch('type') == 'lecture' && s.fetch('dates').any? { |d| d.fetch('date') == '2026-09-02' } }
    expect(mon.fetch('topics').first.fetch('title')).to eq('Computational thinking through urban problems')
    expect(wed.fetch('topics').first.fetch('title')).to eq('The data behind the map')
    flag_text = (mon['flags'] || []).map { |f| f.fetch('text') }.join(' ')
    expect(flag_text).to include('A0')
    expect(flag_text).to include('Aug 31')
  end

  it 'schedules every instruction Mon/Wed through formal classes end' do
    instruction_start = parse_date(calendar.fetch('instruction_begins'))
    instruction_end = parse_date(calendar.fetch('formal_classes_end'))
    holiday_dates = calendar.fetch('holidays').map { |h| normalize_date(h.fetch('date')) }.to_set

    class_days = []
    d = instruction_start
    while d <= instruction_end
      class_days << normalize_date(d) if [1, 3].include?(d.wday) && !holiday_dates.include?(normalize_date(d))
      d += 1
    end

    covered = all_session_dates
      .reject { |entry| entry[:type] == 'holiday' }
      .map { |entry| normalize_date(entry[:date]) }
      .to_set

    missing = class_days.reject { |day| covered.include?(day) }
    expect(missing).to be_empty, "Missing sessions on instruction days: #{missing.join(', ')}"
  end
end
