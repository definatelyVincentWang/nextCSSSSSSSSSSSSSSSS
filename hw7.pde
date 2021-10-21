int endRecord = 300;

int[] xs = new int[endRecord];
int[] ys = new int[endRecord];
int recorded = 0;

int state = 0; // 0 = doing nothing yet, 1 = recording, 2 = displaying

int radius_recording = 4;
int radius_displaying = 10;
boolean display_forward = true;

void setup() {
  size(600,400);
  background(200);
  frameRate(60);
}

void mousePressed() {
  if (state == 0) state = 1;
}

void keyPressed() {
  state = 0;
  recorded = 0;
  background(200);
  fill(0);
}

void draw() {
  if (state == 0) return;
  if (recorded == endRecord) {
    state = 2;
    background(200);
  }
  if (state == 1) {
    fill(0);
    xs[recorded] = mouseX;
    ys[recorded] = mouseY;
    circle(mouseX, mouseY, radius_recording);
    recorded++;
    return;
  }
  if (display_forward) {
    fill(0,255,0);
    circle(xs[recorded % endRecord], ys[recorded % endRecord], radius_displaying);
  }
  if (recorded % endRecord == 0) {
    background(200);
    display_forward = !display_forward;
  }
  if (!display_forward) {
    fill(255,0,0);
    circle(xs[(endRecord - 1) - recorded % endRecord], ys[(endRecord - 1) - recorded % endRecord], radius_displaying);
  }
  
  recorded++;
// your excellent code here
}

import java.util.Scanner;

class account {
  private String name;
  private String SSN;
  private float balance;
    
  public account(String name, String SSN, float balance) {
    this.name = name;
    this.SSN = SSN;
    this.balance = balance;
  }
  
  public float getBalance() {
    return balance;
  }
  
  public void depositMoneys(float moneys) {
    balance += moneys;
  }
  
  public void withdrawMoneys(float moneys) {
    
    balance -= moneys;
  }
  private checkIdentification() {
    Scanner scan = new Scanner(System.in);
    println("SSN: ");
    String input = scan.nextLine();
  }
  
  private String decrypt(String SSN, char key) {
    String res = "";
    for (int i = 0; i < SSN.length(); i++) {
      res += SSN.charAt(i) ^ key;
    }
    return res;
  }
}
