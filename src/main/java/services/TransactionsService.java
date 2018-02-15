package services;

import dao.TransactionsDao;
import database.Transactions;
import database.TransactionsId;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TransactionsService
{

    @Autowired
    TransactionsDao transactionsDao;

    public List<Transactions> getAllTransactions()
    {
        return transactionsDao.getAllTransactions();
    }

    public void updateTransactions(int from, int to, double amount, Date transaction)
    {
        Transactions newTransaction = new Transactions();
        TransactionsId newId = new TransactionsId();
        newId.setFromId(from);
        newId.setToId(to);
        newTransaction.setId(newId);
        newTransaction.setAmount(amount);
        newTransaction.setTransactionDate(transaction);

        transactionsDao.updateTransactions(newTransaction);
    }

}
