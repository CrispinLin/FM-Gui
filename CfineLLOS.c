#include "mex.h"
#include <math.h>
#include <stdio.h>
//CfineLLOS(map,los,xl,yl,Thh,HR,D,dR)
void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    double *map, *los, *xl, *yl, Thh, HR, D, dR;
    int mapM, mapN, losM, losN, xLen, yLen, *losout;


    map = mxGetPr(prhs[0]);
    mapM = mxGetM(prhs[0]);
    mapN = mxGetN(prhs[0]);

    los = mxGetPr(prhs[1]);
    losM = mxGetM(prhs[1]);
    losN = mxGetN(prhs[1]);

    xl = mxGetPr(prhs[2]);
    xLen = mxGetN(prhs[2]);
    yl = mxGetPr(prhs[3]);
    yLen = mxGetN(prhs[3]);
    Thh = mxGetScalar(prhs[4]);
    HR = mxGetScalar(prhs[5]);
    D = mxGetScalar(prhs[6]);
    dR = mxGetScalar(prhs[7]);
    int ct;
    double kh, alpha;
    alpha=-pow(10,10);
    for (ct = 1; ct < xLen; ct++)
    {
        kh = D * 0.5 * (1 - cos(2 * dR * ct / D));
        if (Thh + alpha * ct < map[(int)round(xl[ct])+ mapM* (int)round(yl[ct])] - kh)
            alpha = (map[(int)round(xl[ct])+ mapM* (int)round(yl[ct])] - kh - Thh) / ct;
        if (Thh + alpha * ct < map[(int)round(xl[ct])+ mapM* (int)round(yl[ct])] - kh + HR)
            los[(int)round(xl[ct])+ mapM* (int)round(yl[ct])] = 1;
        else if (los[(int)round(xl[ct])+ mapM*(int)round(yl[ct])]!=1)
            los[(int)round(xl[ct])+ mapM* (int)round(yl[ct])] = 0;
    }
    for (ct = 1; ct < xLen; ct++)
    {
        if (map[(int)round(xl[ct])+ mapM* (int)round(yl[ct])] > map[(int)round(xl[ct + 1])+ mapM* (int)round(yl[ct + 1])])
            los[(int)round(xl[ct])+ mapM* (int)round(yl[ct])] = 0;
    }
    plhs[0] = mxCreateDoubleMatrix(losM, losN, mxREAL);
    losout = mxGetPr(plhs[0]);
    for (int i = 0; i < losM; i++)
        for (int j = 0; j < losN; j++)
            losout[j * losM + i] = los[j * losM + i];

}