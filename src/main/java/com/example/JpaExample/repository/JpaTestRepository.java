package com.example.JpaExample.repository;

import com.example.JpaExample.entity.JpaEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface JpaTestRepository extends JpaRepository<JpaEntity,Long> {

}
