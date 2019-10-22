/*
* Step 5
*   Another option flag for the 4th field of the 
*   argp_option struct: the OPTION_ALIAS flag.
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
    unsigned int dots = 0;
    if (arg == NULL)
    {
      dots = 1;
    }
    else
    {
      dots = atoi(arg);
    }
    for (i = 0; i < dots; i++)
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
          {"dot", 'd', "NUM", OPTION_ARG_OPTIONAL, "Show a dot on the screen"},
          {"period", 0, "FOO", OPTION_ALIAS, "bar"},
          {0},
      };
  struct argp argp = {options, parse_opt};
  return argp_parse(&argp, argc, argv, 0, 0, 0);
}