/*
* Step 6
*   We're going to call the callback function from within the callback
*   function so that we can implement a brand new option.
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
  case 777:
    return parse_opt('d', "3", state);
  }
  return 0;
}

int main(int argc, char **argv)
{
  struct argp_option options[] =
      {
          {"dot", 'd', "NUM", OPTION_ARG_OPTIONAL, "Show a dot on the screen"},
          {"ellipsis", 777, 0, 0, "Show an ellipsis on the screen"},
          {0},
      };
  struct argp argp = {options, parse_opt};
  return argp_parse(&argp, argc, argv, 0, 0, 0);
}