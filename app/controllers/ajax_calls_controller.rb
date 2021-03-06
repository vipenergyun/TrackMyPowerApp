class AjaxCallsController < ApplicationController
  require 'date'
  include ActionView::Helpers::DateHelper
#  before_action :authenticate, except: :refresh_alert_list

  layout 'blank'

  def load_energies
    variable = params[:variable]
    units = params[:units]
    variable = "created_at" if variable.downcase == "last_update"
    @result = SharkPanelsEnergyMeasurement.last[variable] if !SharkPanelsEnergyMeasurement.last.nil?
    @result = "#{@result.to_i}#{units(variable)}" if units == "true"
    @result = 'N/A' if @result.blank?
    timestamp = "#{time_ago_in_words(SharkPanelsEnergyMeasurement.last.created_at)} ago" if !SharkPanelsEnergyMeasurement.last.nil?
    if variable.downcase == "timestamp"
      @result = "#{time_ago_in_words(SharkPanelsEnergyMeasurement.last.created_at)} ago"
    end
    case variable
    when "energy_watt"
      variable = "energy_watt"
      query = "extract(month from created_at) = ? and extract(year from created_at) = ? and energy_watt != 0"
      max_current_month_watt = SharkPanelsEnergyMeasurement.where(query, Time.now.month, Time.now.year ).maximum("energy_watt").to_f
      min_current_month_watt = SharkPanelsEnergyMeasurement.where(query, Time.now.month, Time.now.year ).minimum("energy_watt").to_f
      @result = max_current_month_watt - min_current_month_watt
    when "energy_va"
      variable = "energy_va"
      query = "extract(month from created_at) = ? and extract(year from created_at) = ? and energy_va != 0"
      max_current_month_va = SharkPanelsEnergyMeasurement.where(query, Time.now.month, Time.now.year ).maximum("energy_va").to_f
      min_current_month_va = SharkPanelsEnergyMeasurement.where(query, Time.now.month, Time.now.year ).minimum("energy_va").to_f
      @result = max_current_month_va - min_current_month_va
    when "energy_var"
      variable = "energy_var"
      query = "extract(month from created_at) = ? and extract(year from created_at) = ? and energy_var != 0"
      max_current_month_var = SharkPanelsEnergyMeasurement.where(query, Time.now.month, Time.now.year ).maximum("energy_var").to_f
      min_current_month_var = SharkPanelsEnergyMeasurement.where(query, Time.now.month, Time.now.year ).minimum("energy_var").to_f
      @result = max_current_month_var - min_current_month_var
    when "created_at"
      @result = SharkPanelsEnergyMeasurement.last[variable] if !SharkPanelsEnergyMeasurement.last.nil?
      timestamp = @result.strftime("%F")
      @result = @result.strftime("%T")
      variable = "last_update"
    end
    if variable.downcase == "total_delivered_energy"
      real_value = SharkPanelsEnergyMeasurement.maximum("energy_watt")
      @result = (real_value)/100
      timestamp = "Since April 2018"
    end
    if variable.downcase == "monthly_active_energy"
      query = "extract(month from created_at) = ? and extract(year from created_at) = ? and energy_watt != 0"
      max_current_month = SharkPanelsEnergyMeasurement.where(query, Time.now.month, Time.now.year ).maximum("energy_watt").to_f
      min_current_month = SharkPanelsEnergyMeasurement.where(query, Time.now.month, Time.now.year ).minimum("energy_watt").to_f
      @result = max_current_month - min_current_month
      timestamp = "Last Month"
    end
    render json: { result: @result, variable: variable, timestamp: timestamp }, layout: true
  end

  def load_energies_mpk
    variable = params[:variable]
    units = params[:units]
    variable = "created_at" if variable.downcase == "last_update"
    @result = SharkMapukaEnergiesMeasurement.last[variable] if !SharkMapukaEnergiesMeasurement.last.nil?
    @result = "#{@result.to_i}#{units(variable)}" if units == "true"
    @result = 'N/A' if @result.blank?
    timestamp = "#{time_ago_in_words(SharkMapukaEnergiesMeasurement.last.created_at)} ago" if !SharkMapukaEnergiesMeasurement.last.nil?
    if variable.downcase == "timestamp"
      @result = "#{time_ago_in_words(SharkMapukaEnergiesMeasurement.last.created_at)} ago"
    end
    case variable
    when "energy_watt_mpk"
      variable = "energy_watt_mpk"
      query = "extract(month from created_at) = ? and extract(year from created_at) = ? and energy_watt_mpk != 0"
      max_current_month_watt_mpk = SharkMapukaEnergiesMeasurement.where(query, Time.now.month, Time.now.year ).maximum("energy_watt_mpk").to_f
      min_current_month_watt_mpk = SharkMapukaEnergiesMeasurement.where(query, Time.now.month, Time.now.year ).minimum("energy_watt_mpk").to_f
      @result = max_current_month_watt_mpk - min_current_month_watt_mpk
    when "energy_va_mpk"
      variable = "energy_va_mpk"
      query = "extract(month from created_at) = ? and extract(year from created_at) = ? and energy_va_mpk != 0"
      max_current_month_va_mpk = SharkMapukaEnergiesMeasurement.where(query, Time.now.month, Time.now.year ).maximum("energy_va_mpk").to_f
      min_current_month_va_mpk = SharkMapukaEnergiesMeasurement.where(query, Time.now.month, Time.now.year ).minimum("energy_va_mpk").to_f
      @result = max_current_month_va_mpk - min_current_month_va_mpk
    when "energy_var_mpk"
      variable = "energy_var_mpk"
      query = "extract(month from created_at) = ? and extract(year from created_at) = ? and energy_var_mpk != 0"
      max_current_month_var_mpk = SharkMapukaEnergiesMeasurement.where(query, Time.now.month, Time.now.year ).maximum("energy_var_mpk").to_f
      min_current_month_var_mpk = SharkMapukaEnergiesMeasurement.where(query, Time.now.month, Time.now.year ).minimum("energy_var_mpk").to_f
      @result = max_current_month_var_mpk - min_current_month_var_mpk
    when "created_at"
      @result = SharkMapukaEnergiesMeasurement.last[variable] if !SharkMapukaEnergiesMeasurement.last.nil?
      timestamp = @result.strftime("%F")
      @result = @result.strftime("%T")
      variable = "last_update"
    end
    if variable.downcase == "total_delivered_energy"
      @result = SharkMapukaEnergiesMeasurement.maximum("energy_watt_mpk")
      timestamp = "Since April 2018"
    end
    if variable.downcase == "monthly_active_energy"
      query = "extract(month from created_at) = ? and extract(year from created_at) = ? and energy_watt_mpk != 0"
      max_current_month = SharkMapukaEnergiesMeasurement.where(query, Time.now.month, Time.now.year ).maximum("energy_watt_mpk").to_f
      min_current_month = SharkMapukaEnergiesMeasurement.where(query, Time.now.month, Time.now.year ).minimum("energy_watt_mpk").to_f
      @result = max_current_month - min_current_month
      timestamp = "Last Month"
    end
    if variable.downcase == "historic_pf"
      query = "extract(month from created_at) = ? and extract(year from created_at) = ? and energy_watt_mpk != 0 and energy_va_mpk != 0"
      active_energy = SharkMapukaEnergiesMeasurement.last["energy_watt_mpk"]
      apparent_energy = SharkMapukaEnergiesMeasurement.last["energy_va_mpk"]
      @result = (active_energy/apparent_energy)*100
      timestamp = "Last data"
    end
    render json: { result: @result, variable: variable, timestamp: timestamp }, layout: true
  end

  def power_mpk_chart
    @result = SharkMapukaPowersMeasurement.where('created_at >= ?', 0.day.ago.change(hour: 0, min: 0, sec: 0)).order(:created_at).select(:power_watt_mpk, :power_va_mpk, :power_var_mpk, :created_at)
    timestamp =  @result.pluck(:created_at)
    timestamp.collect! { |element| element.strftime("%F %T") }
    x_data = @result.pluck(:power_watt_mpk)
    y_data = @result.pluck(:power_va_mpk)
    z_data = @result.pluck(:power_var_mpk)
    k_data = @result.pluck(100)
    render json: { timestamp: timestamp, x_data: x_data, y_data: y_data, z_data: z_data, k_data: k_data }, layout: true
  end

  def pf_mpk_chart
    @result = SharkMapukaVariablesMeasurement.where('created_at >= ?', 0.day.ago.change(hour: 0, min: 0, sec: 0)).order(:created_at).select(:pf_mpk, :created_at)
    timestamp =  @result.pluck(:created_at)
    timestamp.collect! { |element| element.strftime("%F %T") }
    x_data = @result.pluck(:pf_mpk)
    render json: { timestamp: timestamp, x_data: x_data }, layout: true
  end

  def monthly_panels_energy_chart
    variable = params[:variable]
    monthly_panels_energy = {}
    query = "extract(month from created_at) = ? and extract(year from created_at) = ? and energy_watt != 0"
    (1..12).to_a.each do |month|
       min_month = SharkPanelsEnergyMeasurement.where(query, month, Time.now.year ).minimum(variable).to_f
       max_month = SharkPanelsEnergyMeasurement.where(query, month, Time.now.year ).maximum(variable).to_f
       monthly_panels_energy[Date::MONTHNAMES[month]] = max_month - min_month
    end
    render json: { months: monthly_panels_energy.keys, y_data: monthly_panels_energy.values }
  end

  def monthly_mpk_energy_chart
    variable = params[:variable]
    monthly_mpk_energy = {}
    query = "extract(month from created_at) = ? and extract(year from created_at) = ? and energy_watt_mpk != 0"
    (1..12).to_a.each do |month|
       min_month = SharkMapukaEnergiesMeasurement.where(query, month, Time.now.year ).minimum(variable).to_f
       max_month = SharkMapukaEnergiesMeasurement.where(query, month, Time.now.year ).maximum(variable).to_f
       monthly_mpk_energy[Date::MONTHNAMES[month]] = max_month - min_month
    end
    render json: { months: monthly_mpk_energy.keys, y_data: monthly_mpk_energy.values }
  end

  def power_chart
    @result = SharkPanelsPowerMeasurement.where('created_at >= ?', 0.day.ago.change(hour: 0, min: 0, sec: 0)).order(:created_at).select(:power_watt, :power_va, :power_var, :created_at)
    timestamp =  @result.pluck(:created_at)
    timestamp.collect! { |element| element.strftime("%F %T") }
    x_data = @result.pluck(:power_watt)
    y_data = @result.pluck(:power_va)
    z_data = @result.pluck(:power_var)
    render json: { timestamp: timestamp, x_data: x_data, y_data: y_data, z_data: z_data }, layout: true
  end

  def hsp_chart
    hsps = []
    days = []
    6.downto(0).to_a.each do |n_day|
      start = n_day.day.ago.change(hour: 0, min: 0, sec: 0)
      stop = n_day.day.ago.change(hour: 23, min: 59, sec: 59)
      day_name = start.strftime("%A")
      query = MeteorologicalMeasurement.where("created_at >= ? and created_at <= ?", start, stop).order(:created_at)
      calc = 0.0
      query.select(:solar_radiation).each_with_index do |entry, index|
        if index == 0 || index == query.count-1
          calc = calc + entry.solar_radiation/24.0
        else
          calc = calc + entry.solar_radiation/12.0
        end
      end
      hsps.push(((calc/10.0).round)/100.0)
      days.push(day_name)
    end
    days.pop and days.push("Today")
    render json: { values: hsps, labels: days }
  end

  def load_electrical
    variable = params[:variable]
    units = params[:units]
    @result = ElectricalMeasurement.last[variable] if !ElectricalMeasurement.last.nil?
    if variable.downcase == "energy_med1"
      query = "extract(month from created_at) = ? and extract(year from created_at) = ? and energy_med1 != 0"
      max_current_month = ElectricalMeasurement.where(query, Time.now.month, Time.now.year ).maximum(variable).to_f
      min_current_month = ElectricalMeasurement.where(query, Time.now.month, Time.now.year ).minimum(variable).to_f
      @result = max_current_month - min_current_month
    end
    if variable.downcase == "total_delivered_energy"
      @result = ElectricalMeasurement.maximum("energy_med1")
      timestamp = "Since August 2016"
    end
    @result = "#{@result} #{units(variable)}" if units == "true"
    if variable.downcase == "timestamp"
      @result = "#{time_ago_in_words(ElectricalMeasurement.last.created_at)} ago"
    end
    if @result.blank? || @result.nil?
      @result = 'N/A'
    end
    render json: { result: @result, variable: variable, timestamp: timestamp }, layout: true
  end

  def load_internal
    variable = params[:variable]
    units = params[:units]
    variable = "created_at" if variable.downcase == "last_update"
    @result = InternalConditionsMeasurement.last[variable] if !InternalConditionsMeasurement.last.nil?
    @result = "#{@result.to_i}#{units(variable)}" if units == "true"
    @result = 'N/A' if @result.blank?
    case variable
    when "temperature_int"
      variable = "internal_temperature"
      timestamp = "Control Room"
    when "humidity_int"
      variable = "internal_humidity"
      timestamp = "Control Room"
    when "created_at"
      @result = ElectricalMeasurement.last[variable] if !ElectricalMeasurement.last.nil?
      timestamp = @result.strftime("%F")
      @result = @result.strftime("%T")
      variable = "last_update"
    end
    render json: { result: @result, variable: variable, timestamp: timestamp }, layout: true
  end

  def load_metereological
    variable = params[:variable]
    units = params[:units]
    @result = MeteorologicalMeasurement.last[variable] if !MeteorologicalMeasurement.last.nil?
    timestamp = "#{time_ago_in_words(MeteorologicalMeasurement.last.created_at)} ago" if !MeteorologicalMeasurement.last.nil?
    @result =  "<h3>#{@result.to_i}</h3>" if variable != "temperature"
    if variable.downcase == "timestamp"
      @result = "#{time_ago_in_words(MeteorologicalMeasurement.last.created_at)} ago"
    end
    if @result.blank?
      @result = 'N/A'
    end
    render json: { result: @result, variable: variable, timestamp: timestamp}, layout: true
  end

  def load_panel
    variable = params[:variable]
    units = params[:units]
    variable = "created_at" if variable.downcase == "last_update"
    @result = PanelConditionMeasurement.last[variable] if !PanelConditionMeasurement.last.nil?
    @result = "#{@result.to_i}#{units(variable)}" if units == "true"
    @result = 'N/A' if @result.blank?
    case variable
    when "temp_panel"
      variable = "panel_temp"
      timestamp = nil
    when "temp_ext"
      variable = "ext_temp"
      timestamp = nil
    when "radiation"
      variable = "radiation_panel"
      timestamp = nil
   when "current_panel"
      variable = "panel_current"
      timestamp = nil
    when "voltage_panel"
      variable = "panel_voltage"
      timestamp = nil
    when "created_at"
      @result = PanelConditionMeasurement.last[variable] if !PanelConditionMeasurement.last.nil?
      timestamp = @result.strftime("%F")
      @result = @result.strftime("%T")
      variable = "last_update"
    end

    render json: { result: @result, variable: variable, timestamp: timestamp}, layout: true
  end

  def load_stream
    url = Stream.last["url"] if !Stream.last.nil?
    timestamp = "#{time_ago_in_words(Stream.last.created_at)} ago" if !Stream.last.nil?
    timestamp = "just now" if timestamp == "less than a minute ago"
    render json: { url: url, timestamp: timestamp }
  end

  def voltage_chart
    @result = ElectricalMeasurement.where('created_at >= ?', 1.day.ago.change(hour: 0, min: 0, sec: 0)).order(:created_at).select(:voltage_med1, :created_at)
    timestamp =  @result.pluck(:created_at)
    timestamp.collect! { |element| element.strftime("%F %T") }
    y_data = @result.pluck(:voltage_med1)
    render json: { timestamp: timestamp, y_data: y_data }, layout: true
  end

  def wind_chart
    output_hash = {}
    cardinals = ["North", "Northeast", "East", "Southeast", "South", "Southwest", "West", "Northwest", "North"]
    2.downto(0).to_a.each do |n_day|
    	start=n_day.day.ago.change(hour: 0, min: 0, sec: 0)
    	stop=n_day.day.ago.change(hour: 23, min: 59, sec: 59)
      max_speed = {}
      (0..8).to_a.each do |norm_direction|
        result = MeteorologicalMeasurement.where("created_at >= ? and created_at <= ? and
            round(wind_direction/45) = #{norm_direction}", start, stop).maximum(:wind_speed)
        if norm_direction == 8
          result = [result.to_f, max_speed[:North]].max
        end
        max_speed[cardinals[norm_direction].to_sym] = result.to_f
      end
      output_hash[n_day] = { result: max_speed, date: start.strftime("%m-%d") }
    end
    cardinals.pop
    output_hash[:labels] = cardinals
    render json: output_hash
  end

  def temperature_chart
    @result = PanelConditionMeasurement.where('created_at >= ?', 1.day.ago.change(hour: 0, min: 0, sec: 0)).order(:created_at).select(:temp_panel, :created_at)
    timestamp =  @result.pluck(:created_at)
    timestamp.collect! { |element| element.strftime("%F %T") }
    y_data = @result.pluck(:temp_panel)
    render json: { timestamp: timestamp, y_data: y_data }, layout: true
  end

  def radiation_chart
    hsps = []
    days = []
    6.downto(0).to_a.each do |n_day|
      start = n_day.day.ago.change(hour: 0, min: 0, sec: 0)
      stop = n_day.day.ago.change(hour: 23, min: 59, sec: 59)
      day_name = start.strftime("%A")
      query = PanelConditionMeasurement.where("created_at >= ? and created_at <= ?", start, stop).order(:created_at)
      calc = 0.0
      query.select(:radiation).each_with_index do |entry, index|
        if index == 0 || index == query.count-1
          calc = calc + entry.radiation/24.0
        else
          calc = calc + entry.radiation/12.0
        end
      end
      hsps.push(((calc/10.0).round)/100.0)
      days.push(day_name)
    end
    days.pop and days.push("Today")
    render json: { values: hsps, labels: days }
  end

  def vibration_chart
    @result = WindTurbineVibrationMeasurement.where('created_at >= ?', 1.day.ago.change(hour: 0, min: 0, sec: 0)).order(:created_at).select(:m_ejex, :m_ejey, :m_ejez, :created_at)
    timestamp =  @result.pluck(:created_at)
    timestamp.collect! { |element| element.strftime("%F %T") }
    x_data = @result.pluck(:m_ejex)
    y_data = @result.pluck(:m_ejey)
    z_data = @result.pluck(:m_ejez)
    render json: { timestamp: timestamp, x_data: x_data, y_data: y_data, z_data: z_data }, layout: true
  end

  def vibration_freq_chart
    @result = WindTurbineFrequenciesMeasurement.last(100)
    x_data = @result.pluck(:mag)
    y_data = @result.pluck(:mag_y)
    z_data = @result.pluck(:mag_z)
    ejey_data = @result.pluck(:freq)
    render json: { x_data: x_data, y_data: y_data, z_data: z_data, ejey_data: ejey_data }, layout: true
  end

  def load_speed
    variable = params[:variable]
    units = params[:units]
    variable = "created_at" if variable.downcase == "last_update"
    @result = WindTurbineSpeedMeasurement.last[variable] if !WindTurbineSpeedMeasurement.last.nil?
    @result = "#{@result.to_i}#{units(variable)}" if units == "true"
    @result = 'N/A' if @result.blank?
    timestamp = "#{time_ago_in_words(WindTurbineSpeedMeasurement.last.created_at)} ago" if !WindTurbineSpeedMeasurement.last.nil?
    if variable.downcase == "timestamp"
      @result = "#{time_ago_in_words(WindTurbineSpeedMeasurement.last.created_at)} ago"
    end
    case variable
    when "rpm"
      variable = "rpm"
      @result = WindTurbineSpeedMeasurement.last["rpm"]
    when "created_at"
      @result = WindTurbineSpeedMeasurement.last[variable] if !WindTurbineSpeedMeasurement.last.nil?
      timestamp = @result.strftime("%F")
      @result = @result.strftime("%T")
      variable = "last_update"
    end
    render json: { result: @result, variable: variable, timestamp: timestamp }, layout: true
  end

  def speed_chart
    @result = WindTurbineSpeedMeasurement.where('created_at >= ?', 1.day.ago.change(hour: 0, min: 0, sec: 0)).order(:created_at).select(:rpm, :created_at)
    timestamp =  @result.pluck(:created_at)
    timestamp.collect! { |element| element.strftime("%F %T") }
    y_data = @result.pluck(:rpm)
    render json: { timestamp: timestamp, y_data: y_data }, layout: true
  end

  def temperature_historic
    date_start = params[:variable][:start_date]
    date_end = params[:variable][:end_date]

    @result = PanelConditionMeasurement.where("created_at >= ? and created_at <= ?", date_start, date_end).order(:created_at).select(:temp_panel, :created_at)

    timestamp =  @result.pluck(:created_at)
    timestamp.collect! { |element| element.strftime("%F %T") }
    y_data = @result.pluck(:temp_panel)
    render json: { timestamp: timestamp, y_data: y_data }, layout: true
  end

  def radiation_historic
    date_start = params[:variable][:start_date]
    date_end = params[:variable][:end_date]

    @result = PanelConditionMeasurement.where("created_at >= ? and created_at <= ?", date_start, date_end).order(:created_at).select(:radiation, :created_at)

    timestamp =  @result.pluck(:created_at)
    timestamp.collect! { |element| element.strftime("%F %T") }
    y_data = @result.pluck(:radiation)
    render json: { timestamp: timestamp, y_data: y_data }, layout: true
  end

  def speed_historic
    date_start = params[:variable][:start_date]
    date_end = params[:variable][:end_date]

    @result = WindTurbineSpeedMeasurement.where("created_at >= ? and created_at <= ?", date_start, date_end).order(:created_at).select(:rpm, :created_at)

    timestamp =  @result.pluck(:created_at)
    timestamp.collect! { |element| element.strftime("%F %T") }
    y_data = @result.pluck(:rpm)
    render json: { timestamp: timestamp, y_data: y_data }, layout: true
  end

  def vibration_x_historic
    date_start = params[:variable][:start_date]
    date_end = params[:variable][:end_date]

    @result = WindTurbineVibrationMeasurement.where("created_at >= ? and created_at <= ?", date_start, date_end).order(:created_at).select(:m_ejex, :created_at)

    timestamp =  @result.pluck(:created_at)
    timestamp.collect! { |element| element.strftime("%F %T") }
    y_data = @result.pluck(:m_ejex)
    render json: { timestamp: timestamp, y_data: y_data }, layout: true
  end

  def vibration_y_historic
    date_start = params[:variable][:start_date]
    date_end = params[:variable][:end_date]

    @result = WindTurbineVibrationMeasurement.where("created_at >= ? and created_at <= ?", date_start, date_end).order(:created_at).select(:m_ejey, :created_at)

    timestamp =  @result.pluck(:created_at)
    timestamp.collect! { |element| element.strftime("%F %T") }
    y_data = @result.pluck(:m_ejey)
    render json: { timestamp: timestamp, y_data: y_data }, layout: true
  end

  def vibration_z_historic
    date_start = params[:variable][:start_date]
    date_end = params[:variable][:end_date]

    @result = WindTurbineVibrationMeasurement.where("created_at >= ? and created_at <= ?", date_start, date_end).order(:created_at).select(:m_ejez, :created_at)

    timestamp =  @result.pluck(:created_at)
    timestamp.collect! { |element| element.strftime("%F %T") }
    y_data = @result.pluck(:m_ejez)
    render json: { timestamp: timestamp, y_data: y_data }, layout: true
  end

  def refresh_checkboxes_tables
    group = params[:variable]
    group_class = group.squish.downcase.tr(" ","_").classify.constantize
    if group.include? "measurement"
      column_names = group_class.column_names - ["created_at", "id"]
    end
    respond_to do |format|
      format.html { render partial: 'checkbox_list', locals: { variables: column_names } }
      format.json { render json: { column_names: column_names.map{|x| "#{x.humanize.titleize}#{" [#{units(x.downcase)}]" if !units(x.downcase).empty?}"} - ["Id", "Updated At"] } }
    end
  end

  def refresh_table
    table_info = params[:variable]
    group = table_info["type"].classify.constantize
    start_date = table_info["start_date"]
    end_date = table_info["end_date"]
    columns = table_info["columns"]
    dataSet = group.where("updated_at >= ? and updated_at <= ?", start_date, end_date).as_json(only: columns)
    if columns.include? 'updated_at'
      dataSet.map{ |x| x["updated_at"] = x["updated_at"].strftime("%F %T") }
    end
    columns_hash = []
    columns.each do |column|
      columns_hash.push({title: column.humanize.titleize, data: column})
    end


    render json: { columns: columns_hash, dataSet: dataSet}
  end

  def new_alert
    alert_params = params.require(:variable).permit(:type,:variable,:comparator,:value1,:value2,:email,:enabled)
    alert_params["type"] = alert_params["type"].squish.parameterize(separator: '_')
    alert_params["variable"] = alert_params["variable"].split("[")[0].squish.parameterize(separator: '_')
    alert_params["comparator"] = alert_params["comparator"].squish.parameterize(separator: '_')
    alert_params["email"] = (true if "true") || (false if "false") || false
    alert_params["enabled"] = true
    alert_params["user"] = current_user
    alert = Alert.create(alert_params)
    message = {}
    if alert.errors.any?
      type = "error"
      title = "Alert could not be created"
      text = "The form contains #{alert.errors.count} #{"error".pluralize(alert.errors.count)}: <br>"
      alert.errors.full_messages.each do |msg|
        text << "<li>#{msg}</li>"
      end
    else
      type= "success"
      title = "New Alert created"
      text = "Alert succesfuly created!"
    end
    message = {type: type, title: title, text: text }
    render json: message
  end

  def refresh_alert_list
    page = params["variable"]
    @alerts = current_user.alerts.paginate(:page => page, :per_page => 10)
    render partial: 'dynamic_pages/list_alerts'
  end

  def delete_alert
    my_alert = params["variable"]
    if my_alert == "all"
      n_alerts = current_user.alerts.count
      current_user.alerts.destroy_all
    else
      n_alerts = 1
      current_user.alerts.destroy(my_alert.to_i)
    end
    type= "success"
    title = "Success"
    text = "#{'Alert'.pluralize(n_alerts)} sucessfuly deleted!"
    message = {type: type, title: title, text: text }
    render json: message
  end

  def check_new_notifications
    executed_from = params[:variable]
    pop_notifications = current_user.notifications.where(seen: false, created_at: (10.seconds.ago..Time.now)).order(created_at: :desc)
    response = {}
    if pop_notifications.any?
      response[:json] = { notifications: pop_notifications.as_json(only: [:type,:title,:text]), count: current_user.notifications.where(seen: false).count }
    else
      response[:json] = { notifications: [], count: current_user.notifications.where(seen: false).count }
    end
    @notifications = last_notifications.first(5)
    @user = current_user
    if executed_from == "navbar"
      Notification.where(id: @notifications.pluck(:id)).update_all seen: true
    end
    respond_to do |format|
      format.html { render partial: 'layouts/navbar_notifications' }
      format.json { render json: response[:json] }
    end
  end

  def refresh_notification_list
    page = params["variable"]
    @notifications = last_notifications.paginate(page: page, per_page: 10)
    Notification.where(id: @notifications.pluck(:id)).update_all seen: true
    render partial: 'dynamic_pages/list_notifications'
  end

  def delete_notification
    my_alert = params["variable"]
    if my_alert == "all"
      n_alerts = last_notifications.count
      last_notifications.destroy_all
    end
    type= "success"
    title = "Success"
    text = "#{'Notification'.pluralize(n_alerts)} sucessfuly deleted!"
    message = {type: type, title: title, text: text }
    render json: message
  end

#  private
#    def authenticate
#      authenticate_or_request_with_http_basic('Administration') do |username, password|
#        username == ENV['http_basic_user'] && password == ENV['http_basic_password']
#      end
#    end

end
