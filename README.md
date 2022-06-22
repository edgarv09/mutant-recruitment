<div align="center">
  <br>
  <h1>Mutant Finder ☣️</h1>
  <strong>Eres un mutante?, averigualo!!!</strong>
</div>
<br>

## Quiénes somos?
Bienvenido a Mutant Finder, plataforma que te permite analizar cadenas de ADN y
determinar si tienes ADN mutante. (cof cof magneto espera por ti)


Documentación
Visita  https://edgarv09.github.io/mutant-recruitment/


### Cómo usarlo

#### Validar si una cadena es mutante

1. Preparar tu cadena de ADN, recuerda si la cadena no conforma una matriz NxN no es posible analizarla
y obtendras como respuesta un status code `400`

2. Enviala como payload al end-point `/mutant`, puedes usar ` https://mutantdna.herokuapp.com/mutant` para testear
3. Si recibes un codigo de respuesta `:200` es ADN mutante, de otra forma recibiras un codigo `:403` para indicarte que es humano, si recibes un codigo `:400` tu payload no es valido.

ejemplo mutante

```shell
curl --location --request POST 'https://mutantdna.herokuapp.com/mutant' \
--header 'Content-Type: application/json' \
--data-raw '{ "dna": ["ATGCGA", "CAGTGC", "AAAAGT", "AGAAGG", "GAGAHA", "TCACTG"] }' -w "\n\n%{http_code}\n"

200
```

ejemplo humano
```shell
curl --location --request POST 'https://mutantdna.herokuapp.com/mutant' \
--header 'Content-Type: application/json' \
--data-raw '{ "dna": ["ATGCGA", "CAGTGC", "AGGAGT", "AGAAGG", "GAGAHA", "TCACTG"] }' -w "\n\n%{http_code}\n"

403
```

### Estadisticas

Enviar una petición GET al end-point `/stats` y obtendras una respuesta de cuantas cadenas mutantes, humanas han sido analizadas y el ratio mutante, humano.
```shell
curl --location --request GET 'https://mutantdna.herokuapp.com/stats' \
--header 'Content-Type: application/json' \
--data-raw '{ "dna": ["ATGCGA", "CAGTGC", "TTATGT", "AGAAGG", "CCCCTA", "TCACTG"] }'

# Example data
{"count_mutant_dna":2,"count_human_dna":3,"ratio":0.67}
```

