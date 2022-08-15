/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Professional/Desktop/XilinxVerilogAsicSha256/Asic/source/func_t1.v";



static void Cont_42_0(char *t0)
{
    char t5[8];
    char t7[8];
    char t9[8];
    char t11[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t6;
    char *t8;
    char *t10;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;

LAB0:    t1 = (t0 + 3488U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(42, ng0);
    t2 = (t0 + 1528U);
    t3 = *((char **)t2);
    t2 = (t0 + 2168U);
    t4 = *((char **)t2);
    memset(t5, 0, 8);
    xsi_vlog_unsigned_add(t5, 32, t3, 32, t4, 32);
    t2 = (t0 + 2328U);
    t6 = *((char **)t2);
    memset(t7, 0, 8);
    xsi_vlog_unsigned_add(t7, 32, t5, 32, t6, 32);
    t2 = (t0 + 1688U);
    t8 = *((char **)t2);
    memset(t9, 0, 8);
    xsi_vlog_unsigned_add(t9, 32, t7, 32, t8, 32);
    t2 = (t0 + 1848U);
    t10 = *((char **)t2);
    memset(t11, 0, 8);
    xsi_vlog_unsigned_add(t11, 32, t9, 32, t10, 32);
    t2 = (t0 + 3888);
    t12 = (t2 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t11, 8);
    xsi_driver_vfirst_trans(t2, 0, 31);
    t16 = (t0 + 3808);
    *((int *)t16) = 1;

LAB1:    return;
}


extern void work_m_00000000000497937954_0080912295_init()
{
	static char *pe[] = {(void *)Cont_42_0};
	xsi_register_didat("work_m_00000000000497937954_0080912295", "isim/asic_core_tb_isim_beh.exe.sim/work/m_00000000000497937954_0080912295.didat");
	xsi_register_executes(pe);
}
