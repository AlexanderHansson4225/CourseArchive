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
#include <signal.h>
#include "pwdblib.h" /* include header declarations for pwdblib.c */

/* Define some constants. */
#define USERNAME_SIZE (32)
#define PASSWORD_SIZE (32)
#define NOUSER (-1)

volatile sig_atomic_t sigint_received = 0;

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

void sigint_handler(int signum)
{
  printf("\nCaught SIGINT (Ctrl+C). Program will continue.\n");
  // sigint_received = 1;
}

void sigterm_handler(int signum)
{
  printf("\nCaught SIGTERM. Program will exit.\n");
  _exit(1);
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
    signal(SIGINT, sigint_handler);
    signal(SIGTERM, sigterm_handler);

    struct pwdb_passwd *p = pwdb_getpwnam(username);

    read_username(username);
    char *pass = getpass("Password: ");

    if (p == NULL)
    {
      printf("Unknown user or incorrect password.\n");
      continue;
    }
    else
    {

      in = check_password(username, pass);

      if (p == NULL) 
      {
        printf("Unknown user or incorrect password.\n");
        continue;
      }

      if (!in && p->pw_failed < 5)
      { //
        p->pw_failed++;
        printf("Unknown user or incorrect password.\n");
        // printf("Wrong password attempts: %d\n", pw_failed);

        continue;
      }
    }
    p->pw_failed = 0;
    p->pw_age++;

    if (p->pw_age >= 5)
    {
      printf("CHANGE YOUR PASSWORD\n");
    }

    if (sigint_received)
    {
      // Reset sigint_received and continue the loop
      sigint_received = 0;
    }

    printf("In: %u\n", in);
  }
}
