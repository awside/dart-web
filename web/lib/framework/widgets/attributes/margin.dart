class Margin {
  double left;
  double top;
  double right;
  double bottom;

  Margin.all(double value) {
    left = value;
    top = value;
    right = value;
    bottom = value;
  }

  Margin.LTRB(this.left, this.top, this.right, this.bottom);

  Margin.only({this.left, this.top, this.right, this.bottom});

  applyTo(Widget widget) {
    widget.element.style
      ..marginLeft = '${left}px'
      ..marginTop = '${top}px'
      ..marginRight = '${right}px'
      ..marginBottom = '${bottom}px';
  }
}