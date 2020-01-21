package com.tea.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.tea.web.entity.ec.Calendar;

@Repository
public interface CalendarRepository extends JpaRepository<Calendar, Integer> {

}
