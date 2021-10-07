/*
**
** Copyright 2020 OpenHW Group
**
** Licensed under the Solderpad Hardware Licence, Version 2.0 (the "License");
** you may not use this file except in compliance with the License.
** You may obtain a copy of the License at
**
**     https://solderpad.org/licenses/
**
** Unless required by applicable law or agreed to in writing, software
** distributed under the License is distributed on an "AS IS" BASIS,
** WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
** See the License for the specific language governing permissions and
** limitations under the License.
**
*******************************************************************************
*/

#ifndef CHIPSUPPORT_H
#define CHIPSUPPORT_H

#define CPU_MHZ 1

#define TICKS_ADDR (*((volatile uint32_t*) (CV_VP_CYCLE_COUNTER_BASE + 0)))

#endif
