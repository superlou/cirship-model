model TestEnvironment
  Modelica.Blocks.Sources.Constant respirationRate(k = 1 / 3600) annotation(
    Placement(visible = true, transformation(origin = {-62, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Human human annotation(
    Placement(visible = true, transformation(origin = {-2, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Environment env(volume = 10) annotation(
    Placement(visible = true, transformation(origin = {58, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant temperature(k = 273) annotation(
    Placement(visible = true, transformation(origin = {10, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Step step(height = 0.1, startTime = 500)  annotation(
    Placement(visible = true, transformation(origin = {10, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(respirationRate.y, human.respirationRate) annotation(
    Line(points = {{-51, 14}, {-11, 14}}, color = {0, 0, 127}));
  connect(env.o2Concentration, human.o2Concentration) annotation(
    Line(points = {{68, 6}, {84, 6}, {84, 36}, {-20, 36}, {-20, 6}, {-10, 6}}, color = {0, 0, 127}));
  connect(temperature.y, env.temperature) annotation(
    Line(points = {{22, -58}, {32, -58}, {32, 6}, {50, 6}}, color = {0, 0, 127}));
  connect(step.y, env.ventRate) annotation(
    Line(points = {{22, -20}, {26, -20}, {26, 10}, {50, 10}}, color = {0, 0, 127}));
  connect(human.co2MassRate, env.co2MassRate) annotation(
    Line(points = {{8, 6}, {20, 6}, {20, 14}, {50, 14}}, color = {0, 0, 127}));
  connect(human.o2MassRate, env.o2MassRate) annotation(
    Line(points = {{8, 14}, {16, 14}, {16, 18}, {50, 18}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "3.2.3")));
end TestEnvironment;