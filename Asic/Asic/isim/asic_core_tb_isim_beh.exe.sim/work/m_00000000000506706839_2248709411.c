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
static const char *ng0 = "C:/Users/Professional/Desktop/XilinxVerilogAsicSha256/Asic/source/right_cyclic_shift.v";
static int ng1[] = {0, 0};
static int ng2[] = {1, 0};



static void Always_31_0(char *t0)
{
    char t7[8];
    char t13[8];
    char t14[8];
    char t29[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;
    char *t27;
    char *t28;
    char *t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;

LAB0:    t1 = (t0 + 2664U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(31, ng0);
    t2 = (t0 + 2984);
    *((int *)t2) = 1;
    t3 = (t0 + 2696);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(31, ng0);

LAB5:    xsi_set_current_line(32, ng0);
    t4 = (t0 + 1184U);
    t5 = *((char **)t4);
    t4 = (t0 + 1584);
    xsi_vlogvar_assign_value(t4, t5, 0, 0, 32);
    xsi_set_current_line(33, ng0);
    xsi_set_current_line(33, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1744);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);

LAB6:    t2 = (t0 + 1744);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 472);
    t6 = *((char **)t5);
    memset(t7, 0, 8);
    xsi_vlog_signed_less(t7, 32, t4, 32, t6, 32);
    t5 = (t7 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (~(t8));
    t10 = *((unsigned int *)t7);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB7;

LAB8:    goto LAB2;

LAB7:    xsi_set_current_line(33, ng0);

LAB9:    xsi_set_current_line(34, ng0);
    t15 = (t0 + 1584);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memset(t14, 0, 8);
    t18 = (t14 + 4);
    t19 = (t17 + 4);
    t20 = *((unsigned int *)t17);
    t21 = (t20 >> 1);
    *((unsigned int *)t14) = t21;
    t22 = *((unsigned int *)t19);
    t23 = (t22 >> 1);
    *((unsigned int *)t18) = t23;
    t24 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t24 & 2147483647U);
    t25 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t25 & 2147483647U);
    t26 = (t0 + 1584);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    memset(t29, 0, 8);
    t30 = (t29 + 4);
    t31 = (t28 + 4);
    t32 = *((unsigned int *)t28);
    t33 = (t32 >> 0);
    t34 = (t33 & 1);
    *((unsigned int *)t29) = t34;
    t35 = *((unsigned int *)t31);
    t36 = (t35 >> 0);
    t37 = (t36 & 1);
    *((unsigned int *)t30) = t37;
    xsi_vlogtype_concat(t13, 32, 32, 2U, t29, 1, t14, 31);
    t38 = (t0 + 1584);
    xsi_vlogvar_assign_value(t38, t13, 0, 0, 32);
    xsi_set_current_line(33, ng0);
    t2 = (t0 + 1744);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t7, 0, 8);
    xsi_vlog_signed_add(t7, 32, t4, 32, t5, 32);
    t6 = (t0 + 1744);
    xsi_vlogvar_assign_value(t6, t7, 0, 0, 32);
    goto LAB6;

}


extern void work_m_00000000000506706839_2248709411_init()
{
	static char *pe[] = {(void *)Always_31_0};
	xsi_register_didat("work_m_00000000000506706839_2248709411", "isim/asic_core_tb_isim_beh.exe.sim/work/m_00000000000506706839_2248709411.didat");
	xsi_register_executes(pe);
}
