within HotelModel.ConnectingPackage;
model ConnectingLoop
  replaceable package MediumDW =
      Buildings.Media.ConstantPropertyLiquidWater
    "Medium for domestic hot water";
      //Buildings.Media.Interfaces.PartialSimpleMedium
   parameter Modelica.SIunits.MassFlowRate mDW_flow_nominal
    "Nominal mass flow rate";
      parameter Modelica.SIunits.Pressure dpDW_nominal
    "Nominal pressure difference";
  Buildings.Fluid.Actuators.Valves.TwoWayLinear val1(redeclare package Medium
      = MediumDW, m_flow_nominal=mDW_flow_nominal,
    dpValve_nominal=dpDW_nominal,
    riseTime=60)
    annotation (Placement(transformation(extent={{60,50},{40,70}})));
  Buildings.Fluid.Actuators.Valves.TwoWayLinear val2(redeclare package Medium
      = MediumDW, m_flow_nominal=mDW_flow_nominal,
    dpValve_nominal=dpDW_nominal,
    riseTime=60)                                     annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,30})));
  Buildings.Fluid.Actuators.Valves.TwoWayLinear val3(redeclare package Medium
      = MediumDW, m_flow_nominal=mDW_flow_nominal,
    dpValve_nominal=dpDW_nominal,
    riseTime=60)
    annotation (Placement(transformation(extent={{38,-10},{58,10}})));
  Buildings.Fluid.Actuators.Valves.TwoWayLinear val4(redeclare package Medium
      = MediumDW, m_flow_nominal=mDW_flow_nominal,
    dpValve_nominal=dpDW_nominal,
    riseTime=60)                                     annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={50,-60})));
  Buildings.Fluid.Movers.FlowMachine_m_flow pum(redeclare package Medium =
        MediumDW, m_flow_nominal=mDW_flow_nominal,
    motorCooledByFluid=false)
    annotation (Placement(transformation(extent={{-40,-70},{-20,-50}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b1(redeclare package Medium =
        MediumDW)
    "Fluid connector b (positive design flow direction is from port_a to port_b)"
    annotation (Placement(transformation(extent={{92,-70},{112,-50}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a1(redeclare package Medium =
        MediumDW)
    "Fluid connector a (positive design flow direction is from port_a to port_b)"
    annotation (Placement(transformation(extent={{90,50},{110,70}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b2(redeclare package Medium =
        MediumDW)
    "Fluid connector b (positive design flow direction is from port_a to port_b)"
    annotation (Placement(transformation(extent={{-110,50},{-90,70}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a2(redeclare package Medium =
        MediumDW)
    "Fluid connector a (positive design flow direction is from port_a to port_b)"
    annotation (Placement(transformation(extent={{-110,-70},{-90,-50}})));
  Buildings.Fluid.Sources.Boundary_pT CitWat(          redeclare package Medium
      = MediumDW, nPorts=1) "City Water"
    annotation (Placement(transformation(extent={{-98,-10},{-78,10}})));
  Buildings.Fluid.Sensors.MassFlowRate MasFloRatCloWat(redeclare package Medium
      = MediumDW) "Mass flow rate of the cooling water load"
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Control.Hex2ControlGroup2 Hex2ConGro2(
    mDW_flow_nominal=mDW_flow_nominal,
    dpDW_nominal=dpDW_nominal)          annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-40,82})));
  Modelica.Blocks.Interfaces.IntegerInput sta1 annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={-40,120})));
  Modelica.Blocks.Interfaces.RealOutput m_flow1 "Mass flow rate of city water"
                                           annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={40,110})));
  inner Modelica.Fluid.System system
    annotation (Placement(transformation(extent={{80,80},{100,100}})));
  Modelica.Blocks.Interfaces.RealInput m_flow_in "Prescribed mass flow rate"
    annotation (Placement(transformation(extent={{-140,-40},{-100,0}})));
  Buildings.Fluid.Movers.FlowMachine_m_flow pum1(
                                                redeclare package Medium =
        MediumDW, m_flow_nominal=mDW_flow_nominal,
    motorCooledByFluid=false,
    addPowerToMedium=false)
    annotation (Placement(transformation(extent={{-70,10},{-50,-10}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort senTem(redeclare package Medium =
        MediumDW, m_flow_nominal=mDW_flow_nominal)
    annotation (Placement(transformation(extent={{-2,-70},{18,-50}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=if val4.y > 0 then
        m_flow_in else 0)
    annotation (Placement(transformation(extent={{-68,-52},{-48,-32}})));
equation
  connect(val3.port_b, port_b1) annotation (Line(
      points={{58,0},{80,0},{80,-60},{102,-60}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=1));
  connect(val4.port_b, port_b1) annotation (Line(
      points={{60,-60},{102,-60}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=1));
  connect(val1.port_a, port_a1) annotation (Line(
      points={{60,60},{100,60}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=1));
  connect(val1.port_b, val2.port_b) annotation (Line(
      points={{40,60},{0,60},{0,40}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=1));
  connect(val2.port_b, port_b2) annotation (Line(
      points={{0,40},{0,60},{-100,60}},
      color={0,127,255},
      smooth=Smooth.None,
      arrow={Arrow.Filled,Arrow.None},
      thickness=1));
  connect(val2.port_a, val3.port_a) annotation (Line(
      points={{0,20},{0,0},{38,0}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=1));
  connect(pum.port_a, port_a2) annotation (Line(
      points={{-40,-60},{-100,-60}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=1));
  connect(MasFloRatCloWat.port_b, val3.port_a) annotation (Line(
      points={{-20,0},{38,0}},
      color={0,127,255},
      smooth=Smooth.None,
      thickness=1));
  connect(Hex2ConGro2.MV4, val4.y) annotation (Line(
      points={{-41,71},{-41,14},{20,14},{20,-20},{50,-20},{50,-48}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(Hex2ConGro2.MV3, val3.y) annotation (Line(
      points={{-38,71},{-38,20},{48,20},{48,12}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(Hex2ConGro2.MV2, val2.y) annotation (Line(
      points={{-35,71},{-35,54},{-20,54},{-20,30},{-12,30}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(Hex2ConGro2.MV1, val1.y) annotation (Line(
      points={{-32,71},{-32,64},{20,64},{20,80},{50,80},{50,72}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(Hex2ConGro2.sta, sta1) annotation (Line(
      points={{-40,94},{-40,120}},
      color={255,127,0},
      smooth=Smooth.None));
  connect(MasFloRatCloWat.m_flow, m_flow1) annotation (Line(
      points={{-30,11},{-30,46},{30,46},{30,86},{40,86},{40,110}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(port_a2, port_a2) annotation (Line(
      points={{-100,-60},{-100,-60}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(port_a1, port_a1) annotation (Line(
      points={{100,60},{100,60}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(port_b1, port_b1) annotation (Line(
      points={{102,-60},{102,-65},{102,-65},{102,-60}},
      color={0,127,255},
      smooth=Smooth.None));

  connect(CitWat.ports[1], pum1.port_a) annotation (Line(
      points={{-78,0},{-70,0}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pum1.port_b, MasFloRatCloWat.port_a) annotation (Line(
      points={{-50,0},{-40,0}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pum1.m_flow_in, m_flow_in) annotation (Line(
      points={{-60.2,-12},{-60.2,-20},{-120,-20}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dash));
  connect(val4.port_a, senTem.port_b) annotation (Line(
      points={{40,-60},{18,-60}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(senTem.port_a, pum.port_b) annotation (Line(
      points={{-2,-60},{-20,-60}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(realExpression.y, pum.m_flow_in) annotation (Line(
      points={{-47,-42},{-30.2,-42},{-30.2,-48}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
        Rectangle(
          extent={{-98,70},{-60,50}},
          fillColor={0,128,255},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Rectangle(
          extent={{-98,-50},{-60,-70}},
          fillColor={0,128,255},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Rectangle(
          extent={{60,-50},{100,-70}},
          fillColor={0,128,255},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Rectangle(
          extent={{60,70},{98,50}},
          fillColor={0,128,255},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Rectangle(
          extent={{-60,70},{-40,-70}},
          fillColor={0,128,255},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Rectangle(
          extent={{40,70},{60,-70}},
          fillColor={0,128,255},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Rectangle(
          extent={{-40,30},{0,-30}},
          pattern=LinePattern.None,
          fillColor={0,128,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-20,40},{0,-42}},
          fillColor={0,128,255},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Rectangle(
          extent={{0,20},{40,-20}},
          pattern=LinePattern.None,
          fillColor={0,128,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{0,28},{20,-30}},
          fillColor={0,128,255},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0})}));
end ConnectingLoop;
