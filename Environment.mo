model Environment
  Modelica.Blocks.Sources.Constant n2MassRate(k = 0) annotation(
    Placement(visible = true, transformation(origin = {-90, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput o2MassRate annotation(
    Placement(visible = true, transformation(origin = {-100, 30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput co2MassRate annotation(
    Placement(visible = true, transformation(origin = {-100, -10}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput ventRate annotation(
    Placement(visible = true, transformation(origin = {-100, -90}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));

  parameter Modelica.SIunits.Volume volume;
  Real n_o2;
  Real n_co2;
  Real n_n2;
  
  Modelica.Blocks.Interfaces.RealOutput o2Concentration annotation(
    Placement(visible = true, transformation(origin = {100, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput temperature annotation(
    Placement(visible = true, transformation(origin = {-100, 90}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput pressure annotation(
    Placement(visible = true, transformation(origin = {100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 totalMass annotation(
    Placement(visible = true, transformation(origin = {10, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.LimIntegrator o2Mass(outMax = 1e10, outMin = 0, y(fixed = true), y_start = volume * 1.429 * 0.2)  annotation(
    Placement(visible = true, transformation(origin = {-50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.LimIntegrator co2Mass(outMax = 1e10, outMin = 0, y(fixed = true), y_start = 0) annotation(
    Placement(visible = true, transformation(origin = {-50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.LimIntegrator n2Mass(outMax = 1e10, outMin = 0, y(fixed = true), y_start = volume * 1.2506 * 0.8) annotation(
    Placement(visible = true, transformation(origin = {-50, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  o2Concentration = o2Mass.y / volume;
  n_o2 = o2Mass.y / 0.032;
  n_co2 = co2Mass.y / 0.044;
  n_n2 = n2Mass.y / 0.028;
  o2Mass.u = o2MassRate - ventRate * o2Mass.y / totalMass.y;
  co2Mass.u = co2MassRate - ventRate * co2Mass.y / totalMass.y;
  n2Mass.u = n2MassRate.y - ventRate * n2Mass.y / totalMass.y;
  pressure = (n_o2 + n_co2 + n_n2) * Modelica.Constants.R * temperature / volume;
  connect(co2Mass.y, totalMass.u2) annotation(
    Line(points = {{-38, -10}, {-2, -10}}, color = {0, 0, 127}));
  connect(n2Mass.y, totalMass.u3) annotation(
    Line(points = {{-38, -50}, {-20, -50}, {-20, -18}, {-2, -18}}, color = {0, 0, 127}));
  connect(o2Mass.y, totalMass.u1) annotation(
    Line(points = {{-38, 30}, {-20, 30}, {-20, -2}, {-2, -2}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "3.2.3")),
    Diagram,
  Icon(graphics = {Text(origin = {-20, 80}, extent = {{-40, 20}, {40, -20}}, textString = "O2"), Text(origin = {-20, 40}, extent = {{-40, 20}, {40, -20}}, textString = "CO2"), Rectangle(extent = {{-100, 100}, {100, -100}}), Text(origin = {0, -111}, extent = {{-100, 9}, {100, -9}}, textString = "volume=%volume"), Text(origin = {-20, 0}, extent = {{-40, 20}, {40, -20}}, textString = "Vent"), Text(origin = {-20, -40}, extent = {{-40, 20}, {40, -20}}, textString = "Temp")}));
end Environment;