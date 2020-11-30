model R2B
  Modelica.Blocks.Interfaces.RealInput realIn annotation(
    Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-36, 0}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  Modelica.Blocks.Interfaces.BooleanOutput booleanOut annotation(
    Placement(visible = true, transformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold = 0.5)  annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(realIn, greaterThreshold.u) annotation(
    Line(points = {{-50, 0}, {-12, 0}}, color = {0, 0, 127}));
  connect(greaterThreshold.y, booleanOut) annotation(
    Line(points = {{12, 0}, {50, 0}}, color = {255, 0, 255}));

annotation(
    uses(Modelica(version = "3.2.3")),
    Diagram(coordinateSystem(extent = {{-50, -20}, {50, 20}})),
    Icon(coordinateSystem(extent = {{-50, -20}, {50, 20}}), graphics = {Rectangle(origin = {-0.34763, 0.0260686}, extent = {{-49.7095, 20.2871}, {49.7095, -20.2871}}), Text(origin = {0, 1}, extent = {{-16, 9}, {16, -9}}, textString = "R2B")}),
    version = "");
end R2B;