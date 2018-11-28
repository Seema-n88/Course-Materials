import teachnet.algorithm.BasicAlgorithm;

import java.awt.Color;
import java.util.Random;

public class MyAlgorithm extends BasicAlgorithm
{
	Color color = null;
	int initiator = -1;
	String caption;
	Random rand = null;
	int sendCount = 0;
	int confirmCount = 0;
	boolean informed = false;

	public void setup(java.util.Map<String, Object> config)
	{
		int id = (Integer) config.get("node.id");
		System.out.println(id);
		caption = "" + id;
		rand = getRandom();
	}
	public void initiate()
	{
		int i;
		for (i = 0; i < checkInterfaces(); ++i) {
			send(i, new MyMsg(rand.nextInt()));
			sendCount = sendCount+1;
		}
		initiator = 0;
		informed = true;
	}
	public void receive(int interf, Object message)
	{
		if (interf == initiator) 
		{
			if(confirmCount == sendCount)
				System.exit(0);
			else
				return;
		}
		if(informed != true && checkInterfaces() > 0)
		{
			int i;
			for (i = 0; i < checkInterfaces(); ++i) {
				if(i == interf) continue;
				MyMsg msg = (MyMsg) message;
				color = msg.getColor();
				caption = "got " + message;
				send(i, new MyMsg(1 + msg.getInt()));
				sendCount = sendCount+1;
			}
			informed = true;
		}
		else if (checkInterfaces() == 0) {
			MyMsg msg = (MyMsg) message;
			color = msg.getColor();
			caption = "got " + message;
			send(interf, new MyMsg(1 + msg.getInt()));	
		}
	}
}
