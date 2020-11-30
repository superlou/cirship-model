model Breaker
  parameter Modelica.SIunits.Current i_trip "Trip current";

  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(
    Placement(visible = true, transformation(origin = {-146, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(
    Placement(visible = true, transformation(origin = {146, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.GreaterThreshold tripCurrent(threshold = i_trip) annotation(
    Placement(visible = true, transformation(origin = {-100, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor annotation(
    Placement(visible = true, transformation(origin = {-120, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.RSFlipFlop rSFlipFlop annotation(
    Placement(visible = true, transformation(origin = {70, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Ideal.IdealOpeningSwitch switch annotation(
    Placement(visible = true, transformation(origin = {110, 60}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.BooleanInput reset annotation(
    Placement(visible = true, transformation(origin = {-150, -70}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.BooleanInput pull annotation(
    Placement(visible = true, transformation(origin = {-150, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Logical.Or or1 annotation(
    Placement(visible = true, transformation(origin = {10, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.BooleanOutput isOpen annotation(
    Placement(visible = true, transformation(origin = {150, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.GreaterThreshold tripDelay(threshold = 0.02) annotation(
    Placement(visible = true, transformation(origin = {-34, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Timer timer annotation(
    Placement(visible = true, transformation(origin = {-66, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(pin_p, currentSensor.p) annotation(
    Line(points = {{-146, 60}, {-130, 60}}, color = {0, 0, 255}));
  connect(currentSensor.n, switch.p) annotation(
    Line(points = {{-110, 60}, {100, 60}}, color = {0, 0, 255}));
  connect(switch.n, pin_n) annotation(
    Line(points = {{120, 60}, {146, 60}}, color = {0, 0, 255}));
  connect(rSFlipFlop.Q, switch.control) annotation(
    Line(points = {{81, 14}, {109, 14}, {109, 48}}, color = {255, 0, 255}));
  connect(currentSensor.i, tripCurrent.u) annotation(
    Line(points = {{-120, 49}, {-120, 14}, {-112, 14}}, color = {0, 0, 127}));
  connect(reset, rSFlipFlop.R) annotation(
    Line(points = {{-150, -70}, {36, -70}, {36, 2}, {58, 2}}, color = {255, 0, 255}));
  connect(or1.y, rSFlipFlop.S) annotation(
    Line(points = {{22, 14}, {58, 14}}, color = {255, 0, 255}));
  connect(pull, or1.u2) annotation(
    Line(points = {{-150, -30}, {-12, -30}, {-12, 6}, {-2, 6}}, color = {255, 0, 255}));
  connect(rSFlipFlop.Q, isOpen) annotation(
    Line(points = {{82, 14}, {150, 14}}, color = {255, 0, 255}));
  connect(tripDelay.y, or1.u1) annotation(
    Line(points = {{-22, 14}, {-2, 14}}, color = {255, 0, 255}));
  connect(timer.y, tripDelay.u) annotation(
    Line(points = {{-55, 14}, {-47, 14}}, color = {0, 0, 127}));
  connect(tripCurrent.y, timer.u) annotation(
    Line(points = {{-89, 14}, {-79, 14}}, color = {255, 0, 255}));
  annotation(
    uses(Modelica(version = "3.2.3")),
    Diagram(coordinateSystem(extent = {{-150, -100}, {150, 100}})),
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Text(origin = {-1.42109e-14, -115}, extent = {{-100, 15}, {100, -15}}, textString = "%i_trip"), Rectangle(origin = {0.141589, -0.0289181}, extent = {{-100.142, 100.009}, {100.142, -100.009}}), Text(origin = {-7, -60}, extent = {{-47, 20}, {47, -20}}, textString = "close", horizontalAlignment = TextAlignment.Left), Text(origin = {-7, 0}, extent = {{-47, 20}, {47, -20}}, textString = "open", horizontalAlignment = TextAlignment.Left), Ellipse(origin = {0, 61}, extent = {{-40, -15}, {40, 15}}, endAngle = 180), Ellipse(origin = {0, 58}, fillColor = {255, 255, 255}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-42, -16}, {42, 16}}, startAngle = 10, endAngle = 170), Ellipse(origin = {-40, 60}, fillPattern = FillPattern.Solid, extent = {{-2, 2}, {2, -2}}, endAngle = 360), Ellipse(origin = {40, 60}, fillPattern = FillPattern.Solid, extent = {{-2, 2}, {2, -2}}, endAngle = 360), Line(origin = {-60, 60}, points = {{-20, 0}, {20, 0}}), Line(origin = {60, 60}, points = {{20, 0}, {-20, 0}}), Text(origin = {0, -10},lineColor = {0, 0, 255}, extent = {{-150, 150}, {150, 110}}, textString = "%name")}),
    version = "");
end Breaker;