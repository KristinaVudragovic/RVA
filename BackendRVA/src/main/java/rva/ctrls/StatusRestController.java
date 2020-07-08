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
import rva.jpa.Status;
import rva.repository.StatusRepository;


@Api(tags = { "Status CRUD operacije" })
@RestController
@CrossOrigin
public class StatusRestController {
	
	@Autowired
	private StatusRepository statusRepository;
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@ApiOperation(value = "Vraća kolekciju svih statusa iz baze podataka")
	@GetMapping("status")
	public Collection<Status> getStatusi() {
		return statusRepository.findAll();
	}
	
	@ApiOperation(value = "Vraća status iz baze podataka čija je id vrednost prosleđena kao path varijabla")
	@GetMapping("status/{id}")
	public Status getStatus(@PathVariable("id") Integer id) {
		return statusRepository.getOne(id);
	}
	
	@ApiOperation(value = "Vraća kolekciju svih statusa iz baze podataka koji u nazivu sadrže string prosleđen kao path varijabla")
	@GetMapping("statusNaziv/{naziv}")
	public Collection<Status> getStatusByNaziv(@PathVariable("naziv") String naziv) {
		return statusRepository.findByNazivContainingIgnoreCase(naziv);
	}
	
	@ApiOperation(value = "Upisuje status u bazu podataka")
	@PostMapping("status")
	public ResponseEntity<Status> insertStatus(@RequestBody Status status) {
		if (!statusRepository.existsById(status.getId())) {
			statusRepository.save(status);
			return new ResponseEntity<>(HttpStatus.OK);
		}
		return new ResponseEntity<>(HttpStatus.CONFLICT);
	}
	
	@ApiOperation(value = "Modifikuje postojeći status u bazi podataka")
	@PutMapping("status")
	public ResponseEntity<Status> updateStatus(@RequestBody Status status) {
		if (!statusRepository.existsById(status.getId()))	
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		statusRepository.save(status);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	@ApiOperation(value = "Briše status iz baze podataka čija je id vrednost prosleđena kao path varijabla")
	@DeleteMapping("status/{id}")
	public ResponseEntity<Status> deleteStatus(@PathVariable ("id") Integer id) {
		if (!statusRepository.existsById(id))	
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		statusRepository.deleteById(id);
		if (id == -100) {
			jdbcTemplate.execute("INSERT INTO \"status\"(\"id\", \"naziv\", \"oznaka\")"
					+ "VALUES (-100, 'nazivtest', 'oznakatest')");
		}
		return new ResponseEntity<>(HttpStatus.OK);
	}

}
