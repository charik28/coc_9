package dz.coc9.vo;

import java.time.Instant;
import java.util.List;
import lombok.Data;

/**
 * Value Object representing a declaration of suspicious goods.
 * (Déclaration de marchandises suspectes)
 */
@Data
public class DeclarationMarchandisesSuspectesVo {

    /** ID interne / référence */
    private Long idd;

    /** Organisation ou Brigade déclarant */
    private OrgnVo orgn;

    /** Wilaya où la déclaration a eu lieu */
    private VilleVo wilaya;

    /** Date et heure de saisie de la déclaration */
    private Instant dateSaisie;

    /** Coordonnées géographiques GPS (Point OGC) */
    private PointVo coordonneesGps;

    /** Lieu ou point de contrôle exact */
    private String lieu;

    /** Type de marchandise (référence) */
    private MarchandiseVo marchandise;

    /** Quantité ou volume saisi */
    private String quantite;

    /** Unité de mesure (kg, L, m³, etc.) */
    private String unite;

    /** Moyen de transport utilisé (camion, voiture, bateau, etc.) */
    private String moyenTransport;

    /** Provenance possible de la marchandise */
    private List<String> provenance;

    /** Destination prévue de la marchandise */
    private List<String> destination;

    /** Observations diverses des agents */
    private String observations;

    /** Nom ou matricule de l’agent déclarant */
    private String agentDeclarant;

    /** Date de création de l’enregistrement */
    private Instant createdAt;

    /** Date de dernière mise à jour */
    private Instant updatedAt;
}
