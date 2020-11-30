#!/usr/bin/python3
from OMSimulator import OMSimulator


if __name__ == '__main__':
    oms = OMSimulator()
    oms.newModel('model')
    oms.addSystem('model.root', oms.system_sc)
    oms.addSubModel('model.root.system1', 'Cirship.fmu')
    oms.instantiate('model')
    oms.initialize('model')
    oms.stepUntil('model', 0.5)
    print(oms.getReal('model.root.system1.resistor.i'))
    oms.setReal('model.root.system1.b1Open', 1)
    oms.stepUntil('model', 1.0)
    oms.setReal('model.root.system1.b1Open', 0)
    oms.stepUntil('model', 1.1)
    print(oms.getReal('model.root.system1.resistor.i'))
    oms.terminate('model')
    oms.delete('model')
