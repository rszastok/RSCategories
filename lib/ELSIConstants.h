//
//  ELStandardConstants.pch
//  NaviParking
//
//  Created by Rafał Szastok on 03/02/14.
//  Copyright (c) 2014 Ekinno Lab Sp. z o. o. All rights reserved.
//

//Unsigned long long (64 bit) max: +18 446 744 073 709 551 615. Zeros:  19.
#define SI_GIGA ((unsigned long long)pow(10,9))
#define SI_MEGA ((unsigned long long)pow(10,6))
#define SI_KILO ((unsigned int)pow(10,3))
#define SI_HECTO 100ull
#define SI_DECA 10ull
#define SI_DECI_PER_ONE SI_DECA
#define SI_CENTI_PER_ONE SI_HECTO
#define SI_MILLI_PER_ONE SI_KILO
#define SI_MICRO_PER_ONE SI_MEGA
#define SI_NANO_PER_ONE SI_GIGA
#define SI_DECI 0.1f
#define SI_CENTI 0.01f
#define SI_MILLI pow(0.1,3)
#define SI_MICRO pow(0.1,6)
#define SI_NANO pow(0.1,9)

#define SEC_PER_MIN 60
#define MIN_PER_HOUR 60
#define SEC_PER_HOUR (SEC_PER_MIN*SEC_PER_HOUR)
