package br.com.applications.generic;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.NoRepositoryBean;
import org.springframework.data.repository.PagingAndSortingRepository;

@NoRepositoryBean
public interface GenericRepository<T extends GenericEntity<T>> extends JpaRepository<T, Integer>, CrudRepository<T, Integer>, PagingAndSortingRepository<T, Integer> {
}

