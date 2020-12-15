model ACSComputer
  "Atmosphere Control & Supply Computer"
  Modelica.Electrical.Analog.Basic.Capacitor capacitor(C = 10e-3) annotation(
    Placement(visible = true, transformation(origin = {-60, 16}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R = 50) annotation(
    Placement(visible = true, transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 50) annotation(
    Placement(visible = true, transformation(origin = {-60, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Interfaces.PositivePin pinPower annotation(
    Placement(visible = true, transformation(origin = {-88, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin pinReturn annotation(
    Placement(visible = true, transformation(origin = {-88, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(capacitor.n, resistor1.p) annotation(
    Line(points = {{-60, 6}, {-60, 0}}, color = {0, 0, 255}));
  connect(pinPower, capacitor.p) annotation(
    Line(points = {{-88, 40}, {-60, 40}, {-60, 26}}, color = {0, 0, 255}));
  connect(pinPower, resistor.p) annotation(
    Line(points = {{-88, 40}, {-30, 40}, {-30, 20}}, color = {0, 0, 255}));
  connect(resistor1.n, pinReturn) annotation(
    Line(points = {{-60, -20}, {-60, -40}, {-88, -40}}, color = {0, 0, 255}));
  connect(resistor.n, pinReturn) annotation(
    Line(points = {{-30, 0}, {-30, -40}, {-88, -40}}, color = {0, 0, 255}));
  annotation(
    uses(Modelica(version = "3.2.3")),
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {-57, 60}, extent = {{-17, 10}, {17, -10}}, textString = "PWR"), Text(origin = {-55, -2}, extent = {{-17, 10}, {17, -10}}, textString = "RTN"), Text(origin = {0, 110}, extent = {{-100, 10}, {100, -10}}, textString = "ACS Computer")}));
end ACSComputer;