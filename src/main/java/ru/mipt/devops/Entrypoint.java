package ru.mipt.devops;

import lombok.RequiredArgsConstructor;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@RequiredArgsConstructor
public class Entrypoint {
    public static void main(String[] args) {
        SpringApplication.run(Entrypoint.class, args);
    }
}
