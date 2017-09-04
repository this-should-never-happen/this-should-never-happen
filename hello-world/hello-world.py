#!/usr/bin/python

class Data(object):
  """__name__"""

  def __init__(__main__):
    Hello = None
    World = None


if (globals()[Data.__doc__] ==
    ''.join(Data.__init__.__code__.co_varnames[
        :Data.__init__.__code__.co_argcount])):
  print(' '.join(Data.__init__.__code__.co_varnames[
      Data.__init__.__code__.co_argcount:]));
