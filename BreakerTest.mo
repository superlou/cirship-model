model BreakerTest
  Modelica.Electrical.Analog.Basic.Resistor resistor(R = 1)  annotation(
    Placement(visible = true, transformation(origin = {40, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-60, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.TableVoltage tableVoltage(table = [0, 0; 1, 5; 2, 5; 3, 1; 10, 1])  annotation(
    Placement(visible = true, transformation(origin = {-60, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.BooleanTable pushSignal(table = {5, 5.1, 7, 7.1})  annotation(
    Placement(visible = true, transformation(origin = {-60, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanTable pullSignal(table = {6, 6.1})  annotation(
    Placement(visible = true, transformation(origin = {-60, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {40, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Breaker breaker(i_trip = 2)  annotation(
    Placement(visible = true, transformation(origin = {0, -6}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
equation
  connect(ground.p, tableVoltage.n) annotation(
    Line(points = {{-60, -48}, {-60, -40}}, color = {0, 0, 255}));
  connect(resistor.n, ground1.p) annotation(
    Line(points = {{40, -40}, {40, -48}}, color = {0, 0, 255}));
  connect(tableVoltage.p, breaker.pin_p) annotation(
    Line(points = {{-60, -20}, {-60, 0}, {-8, 0}}, color = {0, 0, 255}));
  connect(breaker.pin_n, resistor.p) annotation(
    Line(points = {{10, 0}, {40, 0}, {40, -20}}, color = {0, 0, 255}));
  connect(pushSignal.y, breaker.reset) annotation(
    Line(points = {{-48, 18}, {-28, 18}, {-28, -12}, {-8, -12}}, color = {255, 0, 255}));
  connect(pullSignal.y, breaker.pull) annotation(
    Line(points = {{-48, 46}, {-20, 46}, {-20, -6}, {-8, -6}}, color = {255, 0, 255}));
protected
  annotation(
    uses(Modelica(version = "3.2.3")));
end BreakerTest;