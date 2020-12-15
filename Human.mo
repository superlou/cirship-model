model Human
  Modelica.Blocks.Interfaces.RealOutput o2MassRate annotation(
    Placement(visible = true, transformation(origin = {100, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput co2MassRate annotation(
    Placement(visible = true, transformation(origin = {100, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput respirationRate annotation(
    Placement(visible = true, transformation(origin = {-100, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput o2Concentration annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Math.Product o2MassFlowRate annotation(
    Placement(visible = true, transformation(origin = {-50, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant conversionEfficiency(k = 0.04)  annotation(
    Placement(visible = true, transformation(origin = {-30, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product annotation(
    Placement(visible = true, transformation(origin = {10, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain(k = -1)  annotation(
    Placement(visible = true, transformation(origin = {60, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = 1.375) annotation(
    Placement(visible = true, transformation(origin = {60, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(o2Concentration, o2MassFlowRate.u2) annotation(
    Line(points = {{-100, 0}, {-72, 0}, {-72, 14}, {-62, 14}}, color = {0, 0, 127}));
  connect(conversionEfficiency.y, product.u1) annotation(
    Line(points = {{-19, 60}, {-10, 60}, {-10, 32.5}, {-2, 32.5}, {-2, 32}}, color = {0, 0, 127}));
  connect(o2MassFlowRate.y, product.u2) annotation(
    Line(points = {{-38, 20}, {-2, 20}}, color = {0, 0, 127}));
  connect(product.y, gain.u) annotation(
    Line(points = {{22, 26}, {48, 26}}, color = {0, 0, 127}));
  connect(gain.y, o2MassRate) annotation(
    Line(points = {{71, 26}, {100, 26}}, color = {0, 0, 127}));
  connect(product.y, gain1.u) annotation(
    Line(points = {{22, 26}, {28, 26}, {28, -20}, {48, -20}}, color = {0, 0, 127}));
  connect(gain1.y, co2MassRate) annotation(
    Line(points = {{71, -20}, {100, -20}}, color = {0, 0, 127}));
  connect(respirationRate, o2MassFlowRate.u1) annotation(
    Line(points = {{-100, 40}, {-74, 40}, {-74, 26}, {-62, 26}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "3.2.3")));
end Human;