package com.examHall;

import java.util.Random;

public class RandomNoGenerate 
{
	Random r=new Random();
	private int randumNum;
	public int rNum()
	{
		randumNum=r.nextInt(9999);
		return randumNum;
		
	}
}
