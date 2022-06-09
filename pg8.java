import java.util.Scanner;

class pg8{
    public static void main(String[] args){
        
        //Initialization
        Scanner s = new Scanner(System.in);
        System.out.println("Enter no. process & resources");
        int numP = s.nextInt();
        int numR = s.nextInt();
        int order = 1;
        int [] res = new int[numP];
        for(int i=0;i<numP;i++)res[i] = -1;
        System.out.println("Enter alloc matrix"); 
        int [][] alloc = new int[numP][numR];
        for(int i=0;i<numP;i++){
            for(int j=0;j<numR;j++){
                alloc[i][j] = s.nextInt();
            }
        }
        System.out.println("Enter max matrix");
        int[][] max = new int[numP][numR];
        for(int i=0;i<numP;i++){
            for(int j=0;j<numR;j++){
                max[i][j] = s.nextInt();
            }
        }
        System.out.println("Enter avail matrix");
        int [] avail = new int[numR];
        for(int i=0;i<numR;i++)avail[i] = s.nextInt();

        //Logic
        boolean check;
        //iterate through array numP no of times
        for(int n=0;n<numP;n++){
            for(int i=0;i<numP;i++){
                check = true;
                if(res[i]==-1){
                    for(int j=0;j<numR;j++){
                        //check resources for process
                        if(max[i][j]>alloc[i][j]+avail[j]){
                            check = false;
                            break;
                        }
                    }
                    if(check){
                        //free resources
                        res[i] = order++;
                        for(int j=0;j<numR;j++){
                            avail[j] += alloc[i][j];
                        }
                    }
                }
                
            }
        }

        //Display Result
        System.out.println("The process order:");
        for(int i=1;i<=numP;i++){
            for(int j=0;j<numP;j++){
                if(i==res[j])System.out.printf("P%d",j+1);
            }
        }
        s.close();
    }
}