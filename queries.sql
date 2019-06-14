# Functional Requirement 1: The user must be able to get full taxonomic information for each unique fossil
SELECT f.ImageID, g.GENUS, g.SPECIES, fa.FAMILY, o.ORDER, c.CLASS
FROM fossil f, genus g JOIN family fa JOIN orderfs o JOIN class c
WHERE f.GSID=g.GSID AND g.FAMILY = fa.FAMILY AND fa.ORDER = o.ORDER AND o.CLASS=c.CLASS
ORDER BY f.ImageID;

# Functional Requirement 2: The user needs to be able to view the smaller images of fossils and associated 
#   genus and species based on a grouping of fossils found in a specific location
SELECT PHOTO, GENUS, SPECIES, COUNTRY
FROM fossil f JOIN locality l, genus
WHERE f.LOCNO=l.LOCNO AND COUNTRY="BELGIUM"
ORDER BY PHOTO;


# Functional Requirement 3: The user needs to be able to view the larger image side by side with another larger 
#   image and some associated information (such as family, genus, species, location, formation, taxacode, locno) about both of them for identification comparison.
SELECT f.PHOTO Photo1, fa.FAMILY, g.GENUS, g.SPECIES, l.COUNTRY, FORMATION, TAXACODE, f.LOCNO
FROM locality l, fossil f, genus g JOIN family fa JOIN orderfs o JOIN class c
WHERE f.GSID=g.GSID AND f.LOCNO=l.LOCNO AND g.FAMILY = fa.FAMILY AND fa.ORDER = o.ORDER AND o.CLASS=c.CLASS
AND f.PHOTO LIKE "%S28.jpg"
ORDER BY f.PHOTO;


# Functional Requirement 4: The user needs to be able to print labels for any specific fossil or a group of 
    #fossils with information in the database- the labels have the following information: Genus, Species, Phylum, Class, Period, Formation, Location, Taxacode, and LocNo
SELECT GENUS, SPECIES, PHYLUM, c.CLASS, PERIOD, FORMATION, COUNTRY, TAXACODE, f.LOCNO
FROM locality l, fossil f, genus g JOIN family fa JOIN orderfs o JOIN class c
WHERE f.GSID=g.GSID AND f.LOCNO=l.LOCNO AND g.FAMILY = fa.FAMILY AND fa.ORDER = o.ORDER AND o.CLASS=c.CLASS;
    
    
# Functional Requirement 5: The user needs to be able create or view “sets” of arbitrarily selected fossils for 
    # quick access to images and associate names
SELECT ImageID,`COMMON NAME`,PHOTO,REFNO
FROM fossil
WHERE REFNO="25";
    
    
# Functional Requirement 6: The user needs to be able to view the smaller images of fossils and associated genus and 
    # species based on a grouping of fossils that were identified through a specific refno
SELECT PHOTO,GENUS,SPECIES,REFNO
FROM fossil JOIN genus
WHERE fossil.GSID=genus.GSID AND fossil.REFNO="153";
    
    
# Functional Requirement 7:The user needs to be able to view the smaller images of fossils and associated genus and 
    # species based on a grouping of fossils from the same formation
SELECT PHOTO,GENUS,SPECIES,FORMATION
FROM fossil f JOIN genus g, locality l
WHERE f.GSID=g.GSID AND f.LOCNO=l.LOCNO AND l.FORMATION="RICHMOND";
    
    
# Functional Requirement 8:The user needs to be able to view the smaller images of fossils and associated genus and 
    # species based on a grouping of fossils in the same Phylum, Class, Order, Family, or Genus
SELECT PHOTO,GENUS,SPECIES
FROM fossil f JOIN genus g JOIN family fa JOIN orderfs o JOIN class c 
WHERE f.GSID=g.GSID AND g.FAMILY = fa.FAMILY AND fa.ORDER = o.ORDER AND o.CLASS=c.CLASS
AND o.ORDER="MESOGASTROPOD"
#AND c.PHYLUM = ""
#AND c.CLASS = ""
#AND fa.FAMILY = ""
#AND g.GENUS = ""
;

    
# Functional Requirement 9:The user needs to be able to view the smaller images of fossils and associated genus and 
    # species based on a grouping of fossils where the “Special” attribute is True to check which fossils are not currently
    # in the physical collection but rather on display elsewhere.
SELECT PHOTO,GENUS,SPECIES
FROM fossil f JOIN genus g
WHERE f.GSID=g.GSID
AND f.SPECIAL="true";
    
    
# Functional Requirement 10: The user needs to be able to view the smaller images of fossils and associated genus and 
    # species based on a grouping of fossils from the same period
SELECT PHOTO,GENUS,SPECIES
FROM fossil f JOIN genus g, locality l
WHERE f.GSID=g.GSID AND f.LOCNO=l.LOCNO
AND l.PERIOD="MISSISSIPPIAN";
