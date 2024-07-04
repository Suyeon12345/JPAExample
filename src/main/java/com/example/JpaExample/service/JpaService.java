package com.example.JpaExample.service;

import com.example.JpaExample.entity.JpaEntity;
import com.example.JpaExample.repository.JpaTestRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class JpaService {
    @Autowired
    private JpaTestRepository jpaTestRepository;

    @Transactional
    public JpaEntity saveJpaTest(String text2) {
        JpaEntity testEntity = JpaEntity.builder()
                .text(text2) // text 필드에 text2 값 insert
                .build();
        return jpaTestRepository.save(testEntity);
    }

    @Transactional(readOnly = true)
    public List<JpaEntity> getAllJpaTests() {
        return jpaTestRepository.findAll();
    }

    @Transactional(readOnly = true)
    public Optional<JpaEntity> getJpaTestById(Long id) {
        return jpaTestRepository.findById(id);
    }
}
