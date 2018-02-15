package controllers;

import database.Account;
import database.Users;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import services.AccountService;
import services.TransactionsService;
import services.UserService;

@Controller

public class ShareMoneyController
{

    @Autowired
    private UserService userServ;

    @Autowired
    private AccountService accountServ;

    @Autowired
    private TransactionsService transactionsServ;

    @RequestMapping(value = "admin/share")
    public String accountBeforeShare(Model model)
    {

        List<Account> accountList = accountServ.getAllAccounts();

        if (!accountList.isEmpty())
        {
            model.addAttribute("accounts", accountList);
        }
        return "accountsList";
    }

    @RequestMapping(value = "admin/shared", method = RequestMethod.POST)
    public String sharedMoney(Model model)
    {

        int num_members = userServ.getAllMembers().size();

        if (num_members > 0)
        {
            double amount = (accountServ.getShareMoneyFromId(userServ.getUserIdByRole("ADMIN"))) / num_members;
            if (amount > 0)
            {
                accountServ.removeShareMoneyFromAdmin(accountServ.getShareMoneyFromId(userServ.getUserIdByRole("ADMIN")), userServ.getUserIdByRole("ADMIN"));
                for (Users user : userServ.getAllMembers())
                {
                    transactionsServ.updateTransactions(userServ.getUserIdByRole("ADMIN"), user.getId(), (double) amount, new Date());
                    accountServ.setMoneyToMember(amount, user);
                }
            }
        }

        List<Account> accountList = accountServ.getAllAccounts();

        if (!accountList.isEmpty())
        {
            model.addAttribute("accounts", accountList);
        }
        return "accountsList";
    }
}
