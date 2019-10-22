/*
* Step 2
*   the argument member of the argp_option struct will be 
*   described, and the arg parameter to the callback function 
*   will be demonstrated.
* @author: Aakash Hemadri
* @email: aakashhemadri123@gmail.com
*/

#include <stdio.h>
#include <stdlib.h>
#include <argp.h>

static int
parse_opt(int key, char *arg,
          struct argp_state *state)
{
  switch (key)
  {
  case 'd':;
    unsigned int i;
    for (i = 0; i < atoi(arg); i++)
      printf(".");
    printf("\n");
    break;
  }
  return 0;
}

int main(int argc, char **argv)
{
  struct argp_option options[] =
      {
          {0, 'd', "NUM", 0, "Show a dot on the screen"},
          {0},
      };
  struct argp argp = {options, parse_opt};
  return argp_parse(&argp, argc, argv, 0, 0, 0);
}