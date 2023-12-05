int[] x, y, r, g, b;
int rand;

void setup() 
{
    colorMode(RGB, 255);
    size(1024, 1024);
    noSmooth();
    
    rand = 30;
    x = new int[rand];
    y = new int[rand];
    r = new int[rand];
    g = new int[rand];
    b = new int[rand];
    
    for (int i = 0; i < rand; i++)
    {
        x[i] = (int)random(width);
        y[i] = (int)random(height);
        r[i] = (int)random(255);
        g[i] = (int)random(255);
        b[i] = (int)random(255);
    }
    for (int i = 0; i < rand; i++)
    {
        float dir = random(TAU);
        float s = random(2.0) + 1;
        x[i] += s * cos(dir);
        y[i] += s * sin(dir);
    }
    
    drawVoronoi();
}

void draw()
{
}

void drawVoronoi()
{
    for (int i = 0; i < width; i++)
    {
        for (int j = 0; j < height; j++)
        {
            int idx = 0;
            int min = width * width + height * height;
            for (int k = 0; k < rand; k++)
            {
                int d = (int)dist(i, j, x[k], y[k]);
                if (d < min)
                {
                    min = d;
                    idx = k;
                }
                stroke(r[idx], g[idx], b[idx]);
                point(i, j);
            }
        }
    }
}
