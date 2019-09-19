#include<pthread.h>
#include<stdio.h>
#include<semaphore.h>
#include<unistd.h>

sem_t mutex;

void *thread(char **arg){
    printf("%s",*arg);
    sem_wait(&mutex);
    printf("Entered thread\n");
    int *ret = 0;
    sleep(4);
    printf("Exiting\n");
    sem_post(&mutex);
    pthread_exit(&ret);
}

int main(){
void *ret;
sem_init(&mutex,0,1);
pthread_t t1, t2;
pthread_create(&t1, NULL,thread,"North");
sleep(2);
pthread_create(&t2,NULL,thread,"South");
pthread_join(t1,&ret);
printf("%d",&ret);
pthread_join(t2,NULL);
printf("%d",&ret);
sem_destroy(&mutex);
return 0;
}
