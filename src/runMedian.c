void runMedian(double *m, int *d, int *N) {
  int i, j, k, a, R=(*N+1)/2, r[*N];
  double old, new, *x;

  for (j=1; j <= d[1]; j++) {	                        /* Loop over columns */
    x = m + j*d[0] - 1 - *N;                         /* x[*N] = m[nrow(m),j] */

    for (i=0; i < *N; i++) {	              /* Calculate initial ranks "r" */
      r[i] = 1;	                              /* r higher if larger or later */
      for (k=0;   k < i;  k++) if (x[i] >= x[k]) r[i]++;
      for (k=i+1; k < *N; k++) if (x[i] >  x[k]) r[i]++;
      if (r[i]==R) x[*N] = x[i];            /* If rank=R, this is the median */
    }

    for (i=d[0]-1; i > *N; i--) {                      /* Now x[*N] = m[i,j] */
      x--;  old=x[*N];  new=x[0];  a=*N;              /* a = rank of new guy */
      for (k=*N-1; k > 0; k--) {	  /* Recalculate each element's rank */
	r[k] = r[k-1];		         /* Shift previous iteration's ranks */
	if (x[k] >= new) {r[k]++; a--;}	    /* Are we adding a lower number? */
	if (x[k] >  old) {r[k]--;}       /* Are we dropping a higher number? */
	if (r[k]==R) x[*N] = x[k];          /* If rank=R, this is the median */
      }
      r[0] = a;
      if (a==R) x[*N] = new;	               /* Is the new guy the median? */
    }
  }
}


void runMean(double *m, int *d, int *N) {
  int i, j, k;
  double new, *x;

  for (j=1; j <= d[1]; j++) {	                        /* Loop over columns */
    x = m + j*d[0] - 1 - *N;
    for (i=d[0]; i > *N; i--) {                            /* x[*N] = m[i,j] */
      for (k=0, new=0; k < *N; k++) new += x[k];
      x[*N] = new / *N;  x--;
    }
  }
}
