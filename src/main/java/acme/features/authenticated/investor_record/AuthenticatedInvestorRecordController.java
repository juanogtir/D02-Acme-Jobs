
package acme.features.authenticated.investor_record;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import acme.entities.investor_records.Investor_record;
import acme.framework.components.BasicCommand;
import acme.framework.controllers.AbstractController;
import acme.framework.entities.Authenticated;

@Controller
@RequestMapping("/authenticated/investor_record/")
public class AuthenticatedInvestorRecordController extends AbstractController<Authenticated, Investor_record> {

	// Internal state ---------------------------------------------------------

	@Autowired
	private AuthenticatedInvestorRecordListService	listService;

	@Autowired
	private AuthenticatedInvestorRecordShowService	showService;


	// Constructors -----------------------------------------------------------

	@PostConstruct
	private void initialise() {
		super.addBasicCommand(BasicCommand.LIST, this.listService);
		super.addBasicCommand(BasicCommand.SHOW, this.showService);
	}

}
