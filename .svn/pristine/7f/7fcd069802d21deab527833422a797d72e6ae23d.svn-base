package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.support.incrementer.OracleSequenceMaxValueIncrementer;
import org.springframework.stereotype.Service;

@Service
public class SequenceGenerator {
	private static final String ID_INCREASE = "ID_INCREASE";
	
	 @Autowired  
	    public OracleSequenceMaxValueIncrementer oracleSequenceMaxValueIncrementer;  
	   
	    public Integer nextRechargeOrderSeq(){  
	        oracleSequenceMaxValueIncrementer.setIncrementerName(ID_INCREASE);  
	        String currval = oracleSequenceMaxValueIncrementer.nextStringValue();
	        System.out.println(currval);
	        return Integer.parseInt(currval);  
	        //20140328175835 100 10 10000002814  共30 位  
	    }  

}
