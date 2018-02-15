package dao;

import database.Transactions;
import database.TransactionsId;
import java.util.Date;
import java.util.List;

public interface TransactionsDaoImpl {

    public List<Transactions> getAllTransactions();
    
    public void updateTransactions(Transactions transaction);
    
}
