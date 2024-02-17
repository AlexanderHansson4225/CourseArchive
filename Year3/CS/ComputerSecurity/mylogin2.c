
  
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
#include <unistd.h>
#include "pwdblib.h"   /* include header declarations for pwdblib.c */

/* Define some constants. */
#define USERNAME_SIZE (32)
#define NOUSER (-1)


int print_info(const char *username)
{
  struct pwdb_passwd *p = pwdb_getpwnam(username);
  if (p != NULL) {
    printf("Name: %s\n", p->pw_name);
    printf("Passwd: %s\n", p->pw_passwd);
    printf("Uid: %u\n", p->pw_uid);
    printf("Gid: %u\n", p->pw_gid);
    printf("Real name: %s\n", p->pw_gecos);
    printf("Home dir: %s\n",p->pw_dir);
    printf("Shell: %s\n", p->pw_shell);
	return 0;
  } else {
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

bool check_passwd(char *username, char *password)
{
  struct pwdb_passwd *p = pwdb_getpwnam(username);

  return strcmp(p->pw_passwd, crypt(password, p->pw_passwd)) == 0;

}
int main(int argc, char **argv)
{
  char username[USERNAME_SIZE];
  //char password[PASSWORD_SIZE];
  
  /* 
   * Write "login: " and read user input. Copies the username to the
   * username variable.
   */
  bool success = false;
  while(!success){
    read_username(username);

    /* Show user info from our local pwfile. 
    if (print_info(username) == NOUSER) {
      if there are no user with that usename... 
      printf("\nFound no user with name: %s\n", username);   
    }*/
    
    if(pwdb_getpwnam(username) == NULL){
      getpass("password: ");
      printf("Wrong password or username\n");
      
      continue;
    }
    struct pwdb_passwd *p = pwdb_getpwnam(username);
    success = check_passwd(username, getpass("password: "));
    if(success && p->pw_failed < 5){
      printf("Authentication successful!\n");
      p->pw_failed = 0;
      p->pw_age++;
      if(p->pw_age > 1)
      {
        printf("Pls change password since it has been used 1 times");
      }
    }
    else{
      
      p->pw_failed++;
      printf("Wrong password or username\n");
    }
    pwdb_update_user(p); //Update file with user
  }
  
}
  

  

  