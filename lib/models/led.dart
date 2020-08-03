class Led{
  bool _aceso;
  Led(this._aceso);
}

class LedA extends Led{
  LedA(bool aceso) : super (aceso);
}