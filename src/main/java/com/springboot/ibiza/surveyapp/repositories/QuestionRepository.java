package com.springboot.ibiza.surveyapp.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.springboot.ibiza.surveyapp.jpa.beans.QuestionBean;

@Repository
public interface QuestionRepository extends CrudRepository<QuestionBean, Long> {
    List<QuestionBean> findAll();
}