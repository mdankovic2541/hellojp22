package edunova;

import javax.swing.JOptionPane;

public class Zadatak02 {
public static void main(String[] args) {
	//Program unosu broj od 1-5
	//Ako je unesen broj veci od 5 ili manji od 1
	//program ispisuje nije dobar broj
	// u slucaju dobrog unosa za brojcanu ocjenu program 
	//ispsije opisnu ocjenu: nedovovoljan.....
	
	int broj = Integer.parseInt(JOptionPane.showInputDialog("Unesite broj"));
	 
	if (broj < 1 || broj > 5) {
		System.out.println("Nije dobar broj");
	}else {
		switch(broj) {
		case 1: 
			System.out.println("nedovoljan");
			break;
		case 2: 
			System.out.println("dovoljan");
			break;
		case 3: 
			System.out.println("dobra");
			break;
		case 4: 
			System.out.println("vrlo dobar");
			break;
		case 5: 
			System.out.println("odlican");
			break;
	}

	
}
}
}

