package dz.generator.web.rest;

/**
 * @project afaris-thymleaf2
 * @Author Abdessamie Charik on 29/08/2025
 */

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * REST controller for managing {@link dz.generator.domain.Adherent}.
 */
@RestController
@RequestMapping("/api/v3/adherents")
public class AdherentResource {

    private static final Logger LOG = LoggerFactory.getLogger(AdherentResource.class);


}
