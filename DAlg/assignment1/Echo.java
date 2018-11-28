/*
*group 06
* RaviPrasad Marike Ramesh 387219
* Darshan Hingu 380584
* Swamy, Seema Narasimha 384418
* Yuchun Chen 387275

*This is implementation for Echo Algorithm..
* Exercise 1.3 Part ii
*/
import teachnet.algorithm.BasicAlgorithm;
import java.awt.Color;
import java.util.Random;

public class Echo extends BasicAlgorithm
{
	Color color = null;
	//For Initiator Node
	int markInterface = -1;
	String caption;
	int count = 0;
	boolean initiator;
	boolean informed = false;

	public void setup(java.util.Map<String, Object> config)
	{
		int id = (Integer) config.get("node.id");
		caption = "" + id;
	}

	public void initiate()
	{
		//To identify the node is initiator
		initiator = true;
		int i;
		for (i = 0; i < checkInterfaces(); ++i)
		{
			caption = caption + " -> Explorer ";
			send(i, new MyMsg(1));
		}
		//Color: Red
		color= new Color(16711680);
		informed = true;
	}

	public void receive(int interf, Object message)
	{
	//If node has not informed to neighbors
		if(informed != true)
		{
			caption = caption + " -> Explorer ";
			int i;
			for (i = 0; i < checkInterfaces(); ++i)
			{
				if(i == interf) continue;
				MyMsg msg = (MyMsg) message;
				//Spread the message further
				send(i, msg);
			}
			//Color: Red
			color= new Color(16711680);
			informed = true;
			markInterface = interf;
		}
		count = count + 1;
		//If count=Number of neighbours
		if(count == checkInterfaces())
		{
			//If not initiator
			if(initiator != true)
			{
				caption = caption + " -> Echo ";
				//Color: Green
				color= new Color(6619000);
				//Send Echo to it's first edge
				send(markInterface, true);
			}
			//If initiator
			else
			{
				//Terminate
				return;
			}
		}
	}
}
