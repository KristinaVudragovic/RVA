package rva.ctrls;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import rva.jpa.Departman;
import rva.jpa.Student;
import rva.repository.DepartmanRepository;
import rva.repository.StudentRepository;


@Api(tags = { "Student CRUD operacije" })
@RestController
@CrossOrigin
public class StudentRestController {
	
	@Autowired
	private StudentRepository studentRepository;
	
	@Autowired
	private DepartmanRepository departmanRepository;
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@ApiOperation(value = "Vraća kolekciju svih studenata iz baze podataka")
	@GetMapping("student")
	public Collection<Student> getStudenti() {
		return studentRepository.findAll();
	}
	
	@ApiOperation(value = "Vraća studenta iz baze podataka čija je id vrednost prosleđena kao path varijabla")
	@GetMapping("student/{id}")
	public Student getStudent(@PathVariable("id") Integer id) {
		return studentRepository.getOne(id);
	}
	
	@ApiOperation(value = "Vraća kolekciju svih studenata iz baze podataka koji u broju indeksa sadrže string prosleđen kao path varijabla")
	@GetMapping("studentBrIndeksa/{broj_indeksa}")
	public Collection<Student> getStudentByBrIndeksa(@PathVariable("broj_indeksa") String broj_indeksa) {
		return studentRepository.findByBrojIndeksaContainingIgnoreCase(broj_indeksa);
	}
	
	@ApiOperation(value = "Vraća kolekciju svih studenata iz baze podataka koji se nalaze na departmanu čija je id vrednost prosleđena kao path varijabla")
	@GetMapping("studentiNaDepartmanu/{id}")
	public Collection<Student> studentiNaDepartmanu(@PathVariable("id") Integer id) {
		Departman d = departmanRepository.getOne(id);
		return studentRepository.findByDepartman(d);
	}
	
	@ApiOperation(value = "Upisuje studenta u bazu podataka")
	@PostMapping("student")
	public ResponseEntity<Student> insertStudent (@RequestBody Student student) {
		if (!studentRepository.existsById(student.getId())) {
			studentRepository.save(student);
			return new ResponseEntity<>(HttpStatus.OK);
		}
		return new ResponseEntity<>(HttpStatus.CONFLICT);
	}
	
	@ApiOperation(value = "Modifikuje postojećeg studenta u bazi podataka")
	@PutMapping("student")
	public ResponseEntity<Student> updateStudent(@RequestBody Student student) {
		if (!studentRepository.existsById(student.getId()))	
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		studentRepository.save(student);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	@ApiOperation(value = "Briše studenta iz baze podataka čija je id vrednost prosleđena kao path varijabla")
	@DeleteMapping("student/{id}")
	public ResponseEntity<Student> deleteStudent(@PathVariable ("id") Integer id) {
		if (!studentRepository.existsById(id))	
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		studentRepository.deleteById(id);
		if (id == -100) {
			jdbcTemplate.execute("INSERT INTO \"student\"(\"id\", \"departman\", \"status\", \"ime\", \"prezime\", \"broj_indeksa\")"
					+ "VALUES ('-100', '17', '2', 'test', 'test', 'test')");
		}
		return new ResponseEntity<>(HttpStatus.OK);
	}

}
