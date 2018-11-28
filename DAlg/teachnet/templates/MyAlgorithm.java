import teachnet.algorithm.BasicAlgorithm;
import java.awt.Color;
import java.util.Random;

public class MyAlgorithm extends BasicAlgorithm
{
	Color color = null;
	//For Initiator Node
	int markInterface = -1; 
	String caption;
	int count = 0;
	boolean informed = false;

	public void setup(java.util.Map<String, Object> config)
	{
		int id = (Integer) config.get("node.id");
		caption = "" + id;
	}
	
	public void initiate()
	{
		int i;
		for (i = 0; i < checkInterfaces(); ++i) {
			send(i, new MyMsg(1));
		}
		informed = true;
	}
	
	public void receive(int interf, Object message)
	{
		//If the message is an acknowledgement
		if (message instanceof Boolean) 
		{
			count = count + 1;
			if(markInterface != 0 && count == checkInterfaces()-1)
			{
				send(interf, true);
			}
			if(markInterface == 0 && count == checkInterfaces())
			{
				return;
			}
		}
		//If the message is an explorer
		else
		{
			//If node has not informed to neighbors
			if(informed != true) 
			{
				caption = caption + "Got from " + interf;
				int i;
				for (i = 0; i < checkInterfaces(); i++) 
				{
					if(i == interf) continue;
					MyMsg msg = (MyMsg) message;
					color = msg.getColor();
					//Spread the message further
					send(i, msg); 
				}
			informed = true;
			markInterface = interf;
			}
			//If already informed
			else
			{
				MyMsg msg = (MyMsg) message;
				color = msg.getColor();
				caption = caption + "-> got " + message;
				//Send acknowledgement
				send(interf, true);
			}
		}
	}
}
