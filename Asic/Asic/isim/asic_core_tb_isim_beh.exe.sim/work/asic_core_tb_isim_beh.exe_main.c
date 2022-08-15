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

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000002018599046_0879502371_init();
    work_m_00000000003306742511_1666340745_init();
    work_m_00000000000506706839_4050264800_init();
    work_m_00000000000506706839_2248709411_init();
    work_m_00000000000506706839_3760385662_init();
    work_m_00000000000986317913_1177179797_init();
    work_m_00000000003406139568_0333902433_init();
    work_m_00000000000497937954_0080912295_init();
    work_m_00000000000506706839_2500257764_init();
    work_m_00000000000506706839_3024025505_init();
    work_m_00000000000506706839_2942531769_init();
    work_m_00000000000676821683_0825058819_init();
    work_m_00000000003703246500_1631405033_init();
    work_m_00000000003400605580_2648428061_init();
    work_m_00000000000970934339_0513449869_init();
    work_m_00000000000725993588_2778776388_init();
    work_m_00000000000957854431_1446944967_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000000957854431_1446944967");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
