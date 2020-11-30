model Cirship
  Modelica.Electrical.Analog.Sources.ConstantVoltage vbus(V = 28)  annotation(
    Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-80, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R = 50)  annotation(
    Placement(visible = true, transformation(origin = {66, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {66, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput b1Open annotation(
    Placement(visible = true, transformation(origin = {-42, 10}, extent = {{-4, -4}, {4, 4}}, rotation = 0), iconTransformation(origin = {-78, -50}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput b1Close annotation(
    Placement(visible = true, transformation(origin = {-42, 4}, extent = {{-4, -4}, {4, 4}}, rotation = 0), iconTransformation(origin = {26, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  R2B r2b annotation(
    Placement(visible = true, transformation(origin = {-28, 10}, extent = {{-5, -2}, {5, 2}}, rotation = 0)));
  R2B r2b1 annotation(
    Placement(visible = true, transformation(origin = {-28, 4}, extent = {{-5, -2}, {5, 2}}, rotation = 0)));
  Breaker b1(i_trip = 20)  annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 10) annotation(
    Placement(visible = true, transformation(origin = {38, -28}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor(C = 10e-3)  annotation(
    Placement(visible = true, transformation(origin = {38, -2}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground2 annotation(
    Placement(visible = true, transformation(origin = {38, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ground.p, vbus.n) annotation(
    Line(points = {{-80, -20}, {-80, -10}}, color = {0, 0, 255}));
  connect(resistor.n, ground1.p) annotation(
    Line(points = {{66, -20}, {66, -44}}, color = {0, 0, 255}));
  connect(b1Open, r2b.realIn) annotation(
    Line(points = {{-42, 10}, {-32, 10}}, color = {0, 0, 127}));
  connect(b1Close, r2b1.realIn) annotation(
    Line(points = {{-42, 4}, {-32, 4}}, color = {0, 0, 127}));
  connect(vbus.p, b1.pin_p) annotation(
    Line(points = {{-80, 10}, {-80, 16}, {-18, 16}}, color = {0, 0, 255}));
  connect(b1.pin_n, resistor.p) annotation(
    Line(points = {{0, 16}, {66, 16}, {66, 0}}, color = {0, 0, 255}));
  connect(r2b.booleanOut, b1.pull) annotation(
    Line(points = {{-24, 10}, {-18, 10}}, color = {255, 0, 255}));
  connect(r2b1.booleanOut, b1.reset) annotation(
    Line(points = {{-24, 4}, {-18, 4}}, color = {255, 0, 255}));
  connect(capacitor.n, resistor1.p) annotation(
    Line(points = {{38, -12}, {38, -18}}, color = {0, 0, 255}));
  connect(resistor1.n, ground2.p) annotation(
    Line(points = {{38, -38}, {38, -44}}, color = {0, 0, 255}));
  connect(b1.pin_n, capacitor.p) annotation(
    Line(points = {{0, 16}, {38, 16}, {38, 8}}, color = {0, 0, 255}));
protected
  annotation(
    uses(Modelica(version = "3.2.3")));
end Cirship;