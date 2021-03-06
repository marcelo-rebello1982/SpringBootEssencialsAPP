package br.com.applications.generic;


import br.com.applications.errors.ResourceNotFoundException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import javax.transaction.Transactional;
import java.util.List;

public abstract class GenericService<T extends GenericEntity<T>> {

    private final GenericRepository<T> genericRepository;

    public GenericService(GenericRepository<T> genericRepository) {
        this.genericRepository = genericRepository;
    }

    public Page<T> getPage(Pageable pageable) {
        return genericRepository.findAll(pageable);
    }

    public List<T> findAll() {
        return genericRepository.findAll();
    }


    public T get(Integer Id) {
        return genericRepository.findById(Id)
                .orElseThrow(() -> new ResourceNotFoundException("Id nao encontrado " + Id));
    }

    @Transactional
    public T update(T updated) {
        T dbDomain = get(updated.getId());
        dbDomain.update(updated);
        return genericRepository.save(dbDomain);
    }

    @Transactional
    public T save(T newDomain) {
        T dbDomain = newDomain.createNewInstance();
        return genericRepository.save(dbDomain);
    }

    @Transactional
    public void delete(Integer Id) {
        get(Id);
        genericRepository.deleteById(Id);
    }
}