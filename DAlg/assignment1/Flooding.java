/*
*group 06
* RaviPrasad Marike Ramesh 387219
* Darshan Hingu 380584
* Swamy, Seema Narasimha 384418
* Yuchun Chen 387275

*This is implementation for Flooding Algorithm..
* Exercise 1.3 Part i
*/
import teachnet.algorithm.BasicAlgorithm;
import java.awt.Color;
import java.util.Random;

public class Flooding extends BasicAlgorithm
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
		for (i = 0; i < checkInterfaces(); ++i) {
			caption = caption + " -> Explorer ";
			send(i, new MyMsg(1));
		}
		informed = true;
	}

	public void receive(int interf, Object message)
	{
		//If the message is an acknowledgement
		if (message instanceof Boolean)
		{
			caption = caption + "-> Acknowledgement ";
			count = count + 1;
			//Non initiator nodes routing acknowledgement
			if(initiator != true && count == checkInterfaces()-1)
			{
				send(markInterface, true);
			}
			//Exit when initiator node receives all acknowledgments
			if(initiator == true && count == checkInterfaces())
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
				caption = caption + " -> Explorer ";
				int i;
				for (i = 0; i < checkInterfaces(); ++i)
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
				//Send acknowledgement
				send(interf, true);
			}
		}
	}
}
