package com.springboot.ibiza.surveyapp.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.springboot.ibiza.surveyapp.jpa.beans.QuestionTypeBean;

@Repository
public interface QuestionTypeRepository extends JpaRepository<QuestionTypeBean, Integer> {
    List<QuestionTypeBean> findAll();
    QuestionTypeBean findByQuestionTypeId(int id);
}
