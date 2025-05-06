namespace Geo_Object
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Point p = new Point(10.0, 20.0);
            Point p2 = new Point(100.0, 200.0);

            Console.WriteLine($"p.x = {p.getX()}, p.y = {p.getY()}");
            Console.WriteLine($"p2.x = {p2.getX()}, p2.y = {p2.getY()}");

            GeoObj geo = new GeoObj(p2);
            Console.WriteLine($"geo.x = {geo.getXCoordinate()}, geo.y = {geo.getYCoordinate()}");
        }
    }

    internal class GeoObj
    {
        private Point position;

        public GeoObj(Point p)
        {
            this.position = p;
        }

        public double getXCoordinate()
        {
            return position.getX();
        }
        public double getYCoordinate()
        {
            return position.getY();
        }

    }
    internal class Point
    {
        private double x;
        private double y;

        public double getX()
        {
            return this.x;
        }

        public double getY()
        {
            return this.y;
        }

        public Point(double x, double y)
        {
            this.x = x;
            this.y = y;
        }
    }
}
