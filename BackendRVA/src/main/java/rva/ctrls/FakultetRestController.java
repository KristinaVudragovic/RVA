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
import rva.jpa.Fakultet;
import rva.repository.FakultetRepository;


@Api(tags = { "Fakultet CRUD operacije" })
@RestController
@CrossOrigin
public class FakultetRestController {
	
	@Autowired
	private FakultetRepository fakultetRepository;
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@ApiOperation(value = "Vraća kolekciju svih fakulteta iz baze podataka")
	@GetMapping("fakultet")
	public Collection<Fakultet> getFakulteti() {
		return fakultetRepository.findAll();
	}
	
	@ApiOperation(value = "Vraća fakultet iz baze podataka čija je id vrednost prosleđena kao path varijabla")
	@GetMapping("fakultet/{id}")
	public Fakultet getFakultet(@PathVariable("id") Integer id) {
		return fakultetRepository.getOne(id);
	}
	
	@ApiOperation(value = "Vraća kolekciju svih fakulteta iz baze podataka koji u nazivu sadrže string prosleđen kao path varijabla")
	@GetMapping("fakultetNaziv/{naziv}")
	public Collection<Fakultet> getFakultetByNaziv(@PathVariable("naziv") String naziv) {
		return fakultetRepository.findByNazivContainingIgnoreCase(naziv);
	}
	
	@ApiOperation(value = "Upisuje fakultet u bazu podataka")
	@PostMapping("fakultet")
	public ResponseEntity<Fakultet> insertFakultet(@RequestBody Fakultet fakultet) {
		if (!fakultetRepository.existsById(fakultet.getId())) {
			fakultetRepository.save(fakultet);
			return new ResponseEntity<>(HttpStatus.OK);
		}
		return new ResponseEntity<>(HttpStatus.CONFLICT);
	}
	
	@ApiOperation(value = "Modifikuje postojeći fakultet u bazi podataka")
	@PutMapping("fakultet")
	public ResponseEntity<Fakultet> updateFakultet(@RequestBody Fakultet fakultet) {
		if (!fakultetRepository.existsById(fakultet.getId()))	
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		fakultetRepository.save(fakultet);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	@ApiOperation(value = "Briše fakultet iz baze podataka čija je id vrednost prosleđena kao path varijabla")
	@DeleteMapping("fakultet/{id}")
	public ResponseEntity<Fakultet> deleteFakultet(@PathVariable ("id") Integer id) {
		if (!fakultetRepository.existsById(id))	
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		fakultetRepository.deleteById(id);
		if (id == -100) {
			jdbcTemplate.execute("INSERT INTO \"fakultet\"(\"id\", \"naziv\", \"sediste\")"
					+ "VALUES (-100, 'naziv test', 'sediste test')");
		}
		return new ResponseEntity<>(HttpStatus.OK);
	}

}
