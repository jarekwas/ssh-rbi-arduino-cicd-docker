# Obraz dokerowy do wsparcia procesów CI oraz CD dla projektu Smart Summer House

Dokerowy obrazem do opalania na systemach operacyjnych **armhf**, np Raspberry Pi.

W projekcie używany jest w Pipeline, odpalany przez gitlab-runner. Obraz docelowo będzie zawierać wszystkie wymagane narzędzia do pełnego wsparcia CI i CD.

```
docker pull greetingsfrompoland/ssh-rbi-arduino-cicd:latest
```

## Wbudowane nazedzia

 * arduino-cli - kompilacja oraz upload aplikacji
 * docker 
 * docker-compose - do obslugi domoticza i ew wszystkiego innego.

 

