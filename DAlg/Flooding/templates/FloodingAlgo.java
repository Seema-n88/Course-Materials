import teachnet.algorithm.BasicAlgorithm;

import java.awt.Color;
import java.util.Random;

public class FloodingAlgo extends BasicAlgorithm
{
	Color color = null;
	int markInterface = -1;
	boolean initiator = false;
	String caption;
	Random rand = null;

	public void setup(java.util.Map<String, Object> config)
	{
		int id = (Integer) config.get("node.id");
		caption = "" + id;
		rand = getRandom();
	}
	public void initiate()
	{
		int i;
		for (i = 0; i < checkInterfaces(); ++i) {
			send(i, new MyMsg(rand.nextInt()));
		}
		initiator = true;
	}
	public void receive(int interf, Object message)
	{
		if(initiator) return;
		
		 if (checkInterfaces > 0) {
		 	for (i = 0; i < checkInterfaces(); ++i) {
				send(i, new MyMsg(rand.nextInt()));
			}
			// MyMsg msg = (MyMsg) message;
			// color = msg.getColor();
			// caption = "Got " + message;
			// //markInterface = interf;
			// send((interf + 1) % checkInterfaces(), new MyMsg(1 + msg.getInt()));
		}
		else if (checkInterfaces == 0)
		{
			MyMsg msg = (MyMsg) message;
			color = msg.getColor();
			caption = "Got " + message;
			//markInterface = interf;
			send(interf, msg);
		}

	}
}
