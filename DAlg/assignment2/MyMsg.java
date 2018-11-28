/*
*group 06
* RaviPrasad Marike Ramesh 387219
* Darshan Hingu 380584
* Swamy, Seema Narasimha 384418
* Yuchun Chen 387275

*This is implementation for Echo Algorithm..
* Exercise 1.3 Part ii
*/
import java.awt.Color;
import teachnet.view.renderer.Shape;

public class MyMsg {
	Color color;
	int rand;
	int msgType;
	Shape shape = Shape.RHOMBUS;
	static int counter = 0;
	int id;

	public MyMsg(int msgType,int rand) {
		this.msgType = msgType;
		this.rand = rand;
		this.color = new Color(16 * rand);
		this.counter++;
		id = rand;
	}
	public int getMsgType()
	{
		return msgType;
	}
	public int getInt() {
		return rand;
	}

	public Color getColor() {
		return color;
	}

	public String toString() {
		String type = msgType == 0?"election":"leader"; 
		return "#" + type + ":" + id;
	}
}
