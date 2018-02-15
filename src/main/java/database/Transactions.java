package database;
// Generated Feb 5, 2018 1:12:41 PM by Hibernate Tools 3.6.0


import java.util.Date;

/**
 * Transactions generated by hbm2java
 */
public class Transactions  implements java.io.Serializable {


     private TransactionsId id;
     private Users usersByFromId;
     private Users usersByToId;
     private double amount;
     private Date transactionDate;

    public Transactions() {
    }

    public Transactions(TransactionsId id, Users usersByFromId, Users usersByToId, double amount, Date transactionDate) {
       this.id = id;
       this.usersByFromId = usersByFromId;
       this.usersByToId = usersByToId;
       this.amount = amount;
       this.transactionDate = transactionDate;
    }
   
    public TransactionsId getId() {
        return this.id;
    }
    
    public void setId(TransactionsId id) {
        this.id = id;
    }
    public Users getUsersByFromId() {
        return this.usersByFromId;
    }
    
    public void setUsersByFromId(Users usersByFromId) {
        this.usersByFromId = usersByFromId;
    }
    public Users getUsersByToId() {
        return this.usersByToId;
    }
    
    public void setUsersByToId(Users usersByToId) {
        this.usersByToId = usersByToId;
    }
    public double getAmount() {
        return this.amount;
    }
    
    public void setAmount(double amount) {
        this.amount = amount;
    }
    public Date getTransactionDate() {
        return this.transactionDate;
    }
    
    public void setTransactionDate(Date transactionDate) {
        this.transactionDate = transactionDate;
    }




}

