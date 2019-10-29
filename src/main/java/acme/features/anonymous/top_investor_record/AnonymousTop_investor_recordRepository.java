/*
 * AuthenticatedUserAccountRepository.java
 *
 * Copyright (c) 2019 Rafael Corchuelo.
 *
 * In keeping with the traditional purpose of furthering education and research, it is
 * the policy of the copyright owner to permit non-commercial use and redistribution of
 * this software. It has been tested carefully, but it is not guaranteed for any particular
 * purposes. The copyright owner does not offer any warranties or representations, nor do
 * they accept any liabilities with respect to them.
 */

package acme.features.anonymous.top_investor_record;

import java.util.Collection;

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import acme.entities.investor_records.Investor_record;
import acme.framework.repositories.AbstractRepository;

@Repository
public interface AnonymousTop_investor_recordRepository extends AbstractRepository {

	@Query("select i from Investor_record i where i.id = ?1")
	Investor_record findOneById(int id);

	//@Query("select i from Investor_record i")
	@Query("select i from Investor_record i where i.stars=5")
	Collection<Investor_record> findManyAll();

}
