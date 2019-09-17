#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

int pid;
int pipe1[2];
int pipe2[2];

void exec_ps();
void exec_grep_root();
void exec_grep_sbin();

int main()
{
  if (pipe(pipe1) == -1)
  {
    perror("Bad pipe1");
    exit(1);
  }
  switch (fork())
  {
  case -1:
    perror("Bad fork (ps)");
    exit(1);
    break;
  case 0:
    // stdin --> ps --> pipe1
    exec_ps();
  default:
    if (pipe(pipe2) == -1)
    {
      perror("bad pipe2");
      exit(1);
    }
    switch (fork())
    {
    case -1:
      perror("Bad fork2 (grep root)");
      exit(1);
    case 0:
      exec_grep_root();
    default:
      // close unused fds
      close(pipe1[0]);
      close(pipe1[1]);
      switch (fork())
      {
      case -1:
        perror("bad fork (grep sbin)");
        exit(1);
      case 0:
        exec_grep_sbin();
      default:
        printf("Parent exiting!");
      }
    }
  }
  return 0;
}

void exec_ps()
{
  //Read from stdin already done.
  //Write to pipe1
  dup2(pipe1[1], 1);
  close(pipe1[0]);
  close(pipe1[1]);
  execlp("ps", "ps", "aux", NULL);
  perror("bad exec ps aux");
  _exit(1);
}

void exec_grep_root()
{
  // input from pipe1
  dup2(pipe1[0], 0);
  // output to pipe2
  dup2(pipe2[1], 1);
  // close fds
  close(pipe1[0]);
  close(pipe1[1]);
  close(pipe2[0]);
  close(pipe2[1]);
  // exec
  execlp("grep", "grep", "root", NULL);
  // exec didn't work, exit
  perror("bad exec grep root");
  _exit(1);
}

void exec_grep_sbin()
{
  // input from pipe2
  dup2(pipe2[0], 0);
  // output to stdout (already done)
  // close fds
  close(pipe2[0]);
  close(pipe2[1]);
  // exec
  execlp("grep", "grep", "sbin", NULL);
  // exec didn't work, exit
  perror("bad exec grep sbin");
  _exit(1);
}