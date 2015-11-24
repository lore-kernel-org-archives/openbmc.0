Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3917F1A004B
 for <openbmc@lists.ozlabs.org>; Wed, 25 Nov 2015 03:40:23 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448383221130971.9286523083676;
 Tue, 24 Nov 2015 08:40:21 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] add occ hwmon driver as kernel patch
Date: Tue, 24 Nov 2015 11:40:19 -0500
Message-Id: <1448383220-17822-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Nov 2015 16:40:25 -0000

Add the occ-i2c hwmon driver as kernel patch. By default this driver will be built into kernel. To use on Barreleye:

# echo occ-i2c 0x50 > /sys/class/i2c-adaptor/i2c-3/new_device
# echo occ-i2c 0x51 > /sys/class/i2c-adaptor/i2c-3/new_device

HWMON interface will be created in /sys/class/hwmon/

root@barreleye:~# ls /sys/class/hwmon/hwmon3/
device        freq5_label   temp10_label  temp16_label  temp21_label  temp6_label
freq10_input  freq6_input   temp11_input  temp17_input  temp22_input  temp7_input
freq10_label  freq6_label   temp11_label  temp17_label  temp22_label  temp7_label
freq1_input   freq7_input   temp12_input  temp18_input  temp2_input   temp8_input
freq1_label   freq7_label   temp12_label  temp18_label  temp2_label   temp8_label
freq2_input   freq8_input   temp13_input  temp19_input  temp3_input   temp9_input
freq2_label   freq8_label   temp13_label  temp19_label  temp3_label   temp9_label
freq3_input   freq9_input   temp14_input  temp1_input   temp4_input   uevent
freq3_label   freq9_label   temp14_label  temp1_label   temp4_label
freq4_input   power         temp15_input  temp20_input  temp5_input
freq4_label   subsystem     temp15_label  temp20_label  temp5_label
freq5_input   temp10_input  temp16_input  temp21_input  temp6_input

root@barreleye:~# ls /sys/class/hwmon/hwmon4/
caps_curr_powercap      power1_input            temp16_label
caps_curr_powerreading  power1_label            temp17_input
caps_max_powercap       power2_input            temp17_label
caps_min_powercap       power2_label            temp18_input
caps_norm_powercap      power3_input            temp18_label
caps_user_powerlimit    power3_label            temp19_input
device                  power4_input            temp19_label
freq10_input            power4_label            temp1_input
freq10_label            power5_input            temp1_label
freq1_input             power5_label            temp20_input
freq1_label             power6_input            temp20_label
freq2_input             power6_label            temp21_input
freq2_label             power7_input            temp21_label
freq3_input             power7_label            temp22_input
freq3_label             power8_input            temp22_label
freq4_input             power8_label            temp2_input
freq4_label             power9_input            temp2_label
freq5_input             power9_label            temp3_input
freq5_label             subsystem               temp3_label
freq6_input             temp10_input            temp4_input
freq6_label             temp10_label            temp4_label
freq7_input             temp11_input            temp5_input
freq7_label             temp11_label            temp5_label
freq8_input             temp12_input            temp6_input
freq8_label             temp12_label            temp6_label
freq9_input             temp13_input            temp7_input
freq9_label             temp13_label            temp7_label
power                   temp14_input            temp8_input
power10_input           temp14_label            temp8_label
power10_label           temp15_input            temp9_input
power11_input           temp15_label            temp9_label
power11_label           temp16_input            uevent
root@barreleye:~#



https://github.com/openbmc/openbmc/pull/100

adamliyi (1):
  add occ hwmon driver as kernel patch

 .../recipes-kernel/linux/linux-obmc/barreleye.cfg  |    1 +
 .../linux/linux-obmc/occ_hwmon.patch               | 1565 ++++++++++++++++++++
 .../recipes-kernel/linux/linux-obmc_%.bbappend     |    2 +
 3 files changed, 1568 insertions(+)
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/barreleye.cfg
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/occ_hwmon.patch

-- 
2.6.3
