/*
* Step 0
* @author: Aakash Hemadri
* @email: aakashhemadri123@gmail.com
*/

#include <stdio.h>
#include <argp.h>

int main(int argc, char **argv)
{
  return argp_parse(0, argc, argv, 0, 0, 0);
}