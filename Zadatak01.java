package edunova;

import javax.swing.JOptionPane;


public class Zadatak01 {
	public static void main(String[] args) {
		
	
	int broj1 = Integer.parseInt(JOptionPane.showInputDialog("Unesi prvi broj"));
	int broj2 = Integer.parseInt(JOptionPane.showInputDialog("Unesi drugi broj"));
	int broj3 = Integer.parseInt(JOptionPane.showInputDialog("Unesi treci broj"));
	
	if((broj1 > broj2 && broj1 > broj3)|| (broj1 == broj2 || broj1 == broj3)) {
		System.out.println(broj1);
	}else if((broj2 > broj1 && broj2 > broj3) || (broj2 == broj1 || broj2 == broj3)) {
		System.out.println(broj2);
	}else if((broj3 > broj2 && broj3 > broj1) || (broj3 == broj2 || broj3 == broj1)) {
		System.out.println(broj3);
	}
	}
}


