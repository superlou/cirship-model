model Cirship
  Modelica.Electrical.Analog.Sources.ConstantVoltage vbus(V = 28)  annotation(
    Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-80, -18}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Breaker b1(i_trip = 20)  annotation(
    Placement(visible = true, transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.BooleanInput b1Close annotation(
    Placement(visible = true, transformation(origin = {-48, 4}, extent = {{-4, -4}, {4, 4}}, rotation = 0), iconTransformation(extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Interfaces.BooleanInput b1Open annotation(
    Placement(visible = true, transformation(origin = {-48, 10}, extent = {{-4, -4}, {4, 4}}, rotation = 0), iconTransformation(extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {14, 2}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  ACSComputer aCSComputer annotation(
    Placement(visible = true, transformation(origin = {30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Human human annotation(
    Placement(visible = true, transformation(origin = {18, 98}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant temperature(k = 273) annotation(
    Placement(visible = true, transformation(origin = {30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant respirationRate(k = 1 / 3600) annotation(
    Placement(visible = true, transformation(origin = {-32, 102}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Environment env(volume = 10) annotation(
    Placement(visible = true, transformation(origin = {78, 94}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 0)  annotation(
    Placement(visible = true, transformation(origin = {-10, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ground.p, vbus.n) annotation(
    Line(points = {{-80, -14}, {-80, -10}}, color = {0, 0, 255}));
  connect(vbus.p, b1.pin_p) annotation(
    Line(points = {{-80, 10}, {-80, 16}, {-39, 16}}, color = {0, 0, 255}));
  connect(b1Close, b1.reset) annotation(
    Line(points = {{-48, 4}, {-38, 4}}, color = {255, 0, 255}));
  connect(b1Open, b1.pull) annotation(
    Line(points = {{-48, 10}, {-38, 10}}, color = {255, 0, 255}));
  connect(b1.pin_n, aCSComputer.pinPower) annotation(
    Line(points = {{-20, 16}, {22, 16}}, color = {0, 0, 255}));
  connect(ground1.p, aCSComputer.pinReturn) annotation(
    Line(points = {{14, 6}, {14, 10}, {22, 10}}, color = {0, 0, 255}));
  connect(temperature.y, env.temperature) annotation(
    Line(points = {{42, 50}, {54, 50}, {54, 90}, {70, 90}}, color = {0, 0, 127}));
  connect(respirationRate.y, human.respirationRate) annotation(
    Line(points = {{-20, 102}, {10, 102}}, color = {0, 0, 127}));
  connect(human.o2MassRate, env.o2MassRate) annotation(
    Line(points = {{28, 102}, {70, 102}}, color = {0, 0, 127}));
  connect(human.co2MassRate, env.co2MassRate) annotation(
    Line(points = {{28, 94}, {46, 94}, {46, 98}, {70, 98}}, color = {0, 0, 127}));
  connect(const.y, env.ventRate) annotation(
    Line(points = {{2, 70}, {50, 70}, {50, 94}, {70, 94}}, color = {0, 0, 127}));
  connect(env.o2Concentration, human.o2Concentration) annotation(
    Line(points = {{88, 90}, {100, 90}, {100, 120}, {0, 120}, {0, 94}, {10, 94}}, color = {0, 0, 127}));
protected
  annotation(
    uses(Modelica(version = "3.2.3")),
    Diagram(coordinateSystem(extent = {{-150, -150}, {150, 150}})),
    Icon(coordinateSystem(extent = {{-150, -150}, {150, 150}})),
    version = "");
end Cirship;