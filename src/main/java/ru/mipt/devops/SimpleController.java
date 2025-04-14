package ru.mipt.devops;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import ru.mipt.devops.dto.LogRq;
import ru.mipt.devops.dto.StatusRs;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

@RestController
@Slf4j
@Setter
public class SimpleController {
    @Value("${app.greeting}")
    private String greeting;

    @Value("${logging.file.name}")
    private String logPath;

    @GetMapping("/")
    public String root() {
        return greeting;
    }

    @GetMapping("/status")
    public StatusRs getStatus() {
        return StatusRs.builder().status("ok").build();
    }

    @PostMapping("/log")
    public void postLog(@RequestBody LogRq logRq) {
        log.info(logRq.getMessage());
    }

    @GetMapping("/logs")
    public String getLogs() throws IOException {
        Path path = Path.of(logPath);
        return Files.exists(path) ? Files.readString(path) : "";
    }
}