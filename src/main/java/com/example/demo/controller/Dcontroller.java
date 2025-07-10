package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.Model.DModel;
import com.example.demo.Repo.Repository;

@Controller
public class Dcontroller {

    @Autowired
    private Repository repo;

    @GetMapping("/")
    public String home() {
        // Show login page
        return "Login"; // Login.jsp under /webapp/pages/ or wherever your prefix points
    }

    @PostMapping("/index")
    public String showIndex() {
        // After login redirect to index page (dashboard or student list)
        return "index"; // index.jsp
    }

    @PostMapping("/addStudentForm")
    public String showAddStudentForm() {
        // Show the form for adding a new student
        return "addStudent"; // addStudent.jsp (create this JSP)
    }

    @PostMapping("/addStudent")
    public String addStudent(@ModelAttribute DModel user, ModelMap model) {
        repo.save(user);
        model.addAttribute("student1", repo.findAll());
        return "viewStudents"; // viewStudents.jsp
    }

    @GetMapping("/viewStudents")
    public String viewStudents(ModelMap model) {
        model.addAttribute("student1", repo.findAll());
        return "viewStudents";
    }

    @GetMapping("/updateStudent")
    public String showUpdateForm(@RequestParam("id") int id, ModelMap model) {
        DModel student = repo.findById(id).orElse(null);
        if (student != null) {
            model.addAttribute("student", student);
            return "updateStudent"; // updateStudent.jsp
        }
        return "redirect:/viewStudents";
    }

    @PostMapping("/updateStudent")
    public String updateStudent(@ModelAttribute DModel student, ModelMap model) {
        repo.save(student);
        model.addAttribute("student1", repo.findAll());
        return "viewStudents";
    }

    @PostMapping("/deleteStudent")
    public String deleteStudent(@RequestParam("id") int id, ModelMap model) {
        repo.deleteById(id);
        model.addAttribute("student1", repo.findAll());
        return "viewStudents";
    }

    @GetMapping("/searchStudent")
    public String searchStudent(@RequestParam("keyword") String keyword, ModelMap model) {
        List<DModel> matched = repo.findByNameContainingIgnoreCase(keyword);
        model.addAttribute("student1", matched);
        return "viewStudents";
    }
}
