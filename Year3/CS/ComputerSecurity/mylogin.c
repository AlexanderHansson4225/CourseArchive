/*
 * Shows user info from local pwfile.
 *
 * Usage: userinfo username
 */

#define _XOPEN_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <crypt.h>
#include "pwdblib.h" /* include header declarations for pwdblib.c */

/* Define some constants. */
#define USERNAME_SIZE (32)
#define PASSWORD_SIZE (32)
#define NOUSER (-1)

int print_info(const char *username)
{
  struct pwdb_passwd *p = pwdb_getpwnam(username);
  if (p != NULL)
  {
    printf("Name: %s\n", p->pw_name);
    // printf("Passwd: %s\n", p->pw_passwd);
    printf("Uid: %u\n", p->pw_uid);
    printf("Gid: %u\n", p->pw_gid);
    printf("Real name: %s\n", p->pw_gecos);
    printf("Home dir: %s\n", p->pw_dir);
    printf("Shell: %s\n", p->pw_shell);
    return 0;
  }
  else
  {
    return NOUSER;
  }
}

void read_username(char *username)
{
  printf("login: ");
  fgets(username, USERNAME_SIZE, stdin);

  /* remove the newline included by getline() */
  username[strlen(username) - 1] = '\0';
}

bool check_password(char *username, char *password)
{
  struct pwdb_passwd *p = pwdb_getpwnam(username);

  // printf("Passwd: %s\n", p->pw_passwd);
  // printf("Passwd: %s\n", crypt(password, p->pw_passwd));

  // 0 är mandatory för den returnar int och inte bool
  return strcmp(p->pw_passwd, crypt(password, p->pw_passwd)) == 0;
}

int main(int argc, char **argv)
{
  char username[USERNAME_SIZE];
  char password[PASSWORD_SIZE];

  /*
   * Write "login: " and read user input. Copies the username to the
   * username variable.
   */
  bool in = false;
  while (!in)
  {
    read_username(username);
    char* pass = getpass("Password: ");


    if(pwdb_getpwnam(username) == NULL){
      printf("Unknown user or incorrect password.\n");
      continue;
      
    }else{
      in = check_password(username, pass);
      if(!in){
        printf("Unknown user or incorrect password.\n");
        continue;
      }
    }
    printf("In: %u\n", in);
  }
}
