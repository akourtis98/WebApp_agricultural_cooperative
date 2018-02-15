package controllers;

import database.Transactions;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import services.TransactionsService;

@Controller
@RequestMapping("admin")
public class TranscactionsController
{
    @Autowired
    private TransactionsService transServ;
    
    @RequestMapping("transactions")
    public String getAdminTransactionsList(Model model)
    {
        List<Transactions> transactionsList = transServ.getAllTransactions();

        if (!transactionsList.isEmpty())
        {
            model.addAttribute("transactions", transactionsList);
        }

        return "transactionsList";
    }
}
