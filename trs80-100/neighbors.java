import java.util.Random;

public class Neighbors {
    public static void main(String[] args) {
        Random rand = new Random();
        int width = 5;
        int height = 4;
        int[] grid = new int[width * height];

        for (int i = 0; i < grid.length; i++) {
            grid[i] = rand.nextInt(2);
        }

        for (int i = 0; i < grid.length; i++) {
            System.out.print(i + ") " + grid[i] + "\t");

            if ((i+1) % width == 0) {
                System.out.println();
            }
        }

        int col = 0;
        int row = 0;

        for (int i = 0; i < grid.length; i++) {
            System.out.println(i + ") analyzing: " + grid[i]);
            int sum = 0;

            int top_row = ((row - 1) + height) % height;
            int bottom_row = ((row + 1) % height);

            // the formula is: (a % w) + (w * r) where w = width, r = row and A can be:
            //  -w-1 , -w  ,  +w+1
            //  -1   ,  i  ,  +1
            //  +w-1 , +w  ,  +w+1

            int left = (((((i - 1) % width)) + width) % width) + (width*row);
            int right = ((i + 1) % width) + (width*row);
            int top_left = (((((i - width - 1) % width)) + width) % width) + (width*top_row);
            int top_right = (((((i - width + 1) % width)) + width) % width) + (width*top_row);
            int top = (((((i - width) % width)) + width) % width) + (width*top_row);
            int bottom = ((i + width) % width) + (width*bottom_row);
            int bottom_right = ((i + width + 1) % width) + (width*bottom_row);
            int bottom_left = ((i + width - 1) % width) + (width*bottom_row);

            sum = grid[left] + grid[right] + grid[top_left] + grid[top_right] + grid[top] + grid[bottom]+ grid[bottom_right] + grid[bottom_left];

            System.out.println("neighbors: " + sum);

            col = (col + 1) % width;
            if ((i+1) % width == 0)
                row++;
        }
    }
}
