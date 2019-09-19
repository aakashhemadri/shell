#include<unistd.h>
#include<stdio.h>
#include<stdlib.h>

int main() {
  int filedes[2];
  const int BSIZE = 100;
  char buf[BSIZE];
  ssize_t nbytes;
  int status = pipe(filedes);
  if( status == -1 ){
    printf("An error has occured!");
    return -1;
  }
  switch(fork()){
    case -1: /* Handle fork error */
      printf("Couldn't spawn a new process");
    break;
    case 0: /* Child process - reads from pipe */
      printf("Child process\n");
      close(filedes[1]); /* Write end of pipe is unused :( */
      nbytes = read(filedes[0], buf, BSIZE); /* Get data from pipe */
      if(nbytes < 0){
        printf("Error encountered reading pipe in child");
      }
      else {
        printf("\n%d: %s", nbytes, buf);
      }
      close(filedes[0]);
      exit(EXIT_SUCCESS);
    break;
    default: /* Parent - writes to pipe */
      printf("Parent process\n");
      close(filedes[0]); /* Close the read end of pipe */
      write(filedes[1], "Hello world\n", 12); /* Write data on pipe */
      close(filedes[1]);
      exit(EXIT_SUCCESS);
  }
  return 0;
}