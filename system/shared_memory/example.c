// Writes a-z into shared memory
#include<stdio.h>
#include<sys/types.h>
#include<unistd.h>
#include<sys/ipc.h>
#include<sys/shm.h>

int main(){
    char c;
    char *str, *s;
    key_t key = ftok("shmfile", 65);
    int shmid = shmget(key,1024,0666|IPC_CREAT);
    str = (char *)shmat(shmid,NULL,0);
    for(s = str; *s != '\0' ; s++){
        putchar(*s);
    }
    *str = '*';
    shmdt(str);
    shmctl(shmid, IPC_RMID, NULL);
    return 0;
}                     