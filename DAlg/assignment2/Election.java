/*
*group 06
* RaviPrasad Marike Ramesh 387219
* Darshan Hingu 380584
* Swamy, Seema Narasimha 384418
* Yuchun Chen 387275

*This is implementation for Election Algorithm..
* Exercise 1.2 Part i
*/
import teachnet.algorithm.BasicAlgorithm;
import java.awt.Color;
import java.util.Random;
import java.util.ArrayList;

public class Election extends BasicAlgorithm
{
	Color color = null;
	String caption;
	boolean initiator;
	boolean isParticipant = false;
	int Mp = 0;
	int nodeid = 0;
	static int electionMsg = 0;
	static int leaderMsg = 1;
	static int nodeCounter = 0;
	static ArrayList<Integer> list = new ArrayList<Integer>(); 
	public void setup(java.util.Map<String, Object> config)
	{
		int id = (Integer) config.get("node.id");
		//To configure uni direction ring
		nodeid = id; 
		nodeCounter++;
		//unique id same as node id
		Mp=id;
		//Comment above line Mp=id; and uncomment below lines for random ids for nodes
		//
		// do
		// {
		// 	Random rn = new Random();
		// 	Mp = rn.nextInt(20);
		// }while(list.contains(Mp));
		// list.add(Mp);
		caption = "" + Mp;
		
	}

	public void initiate()
	{
		initiator = true;
		int i = 0;
		send(++i % nodeCounter, new MyMsg(electionMsg,Mp));
		isParticipant = true;
		color = Color.red;
	}

	public void receive(int interf, Object message)
	{
		MyMsg msg = (MyMsg) message;
		int j = msg.getInt();
		int type = msg.getMsgType();
		int msgInfo = -1;
		int msgType = -1;
		Color msgColor;
		if(type == leaderMsg)
		{
			if(isParticipant)
		 	{
		 		msgInfo = j;
		 		msgType = leaderMsg;
				isParticipant = false;
				color = Color.green;
		 	}
		 	else
		 	{
		 		return;
		 	}

		}
		else 
		{
			if(j == Mp)
			{
				msgInfo = j;
				msgType = leaderMsg;
				isParticipant = false;
				color = Color.green;
			}
			else if(Mp < j)
			{
				Mp = j;
				msgInfo = Mp;
				msgType = electionMsg;
				isParticipant = true;
				color = Color.red;
			}
			else
			{
				if(isParticipant) return;
				msgInfo = Mp;
				msgType = electionMsg;
				isParticipant = true;
				color = Color.red;
			}
		}
		send((interf + 1) % checkInterfaces(), new MyMsg(msgType,msgInfo));
		
		return;			

	}
}
