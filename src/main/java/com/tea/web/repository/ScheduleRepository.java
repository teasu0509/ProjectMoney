package com.tea.web.repository;

import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.tea.web.entity.ec.Schedule;

@Repository
public interface ScheduleRepository extends JpaRepository<Schedule, Long> {

}
