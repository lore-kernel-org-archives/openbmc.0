Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wJnKt0KMCzDqBJ
 for <openbmc@lists.ozlabs.org>; Fri,  5 May 2017 06:53:05 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v44KhWWd138221
 for <openbmc@lists.ozlabs.org>; Thu, 4 May 2017 16:53:02 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2a89spd84s-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 04 May 2017 16:53:02 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 4 May 2017 16:53:02 -0400
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 4 May 2017 16:53:01 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v44Kr0pc10879368; Thu, 4 May 2017 20:53:00 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F2BB611204B;
 Thu,  4 May 2017 16:53:01 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 8F7B3112047;
 Thu,  4 May 2017 16:53:01 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10 0/6] drivers: i2c: FSI-attached I2C master
 algorithm
To: openbmc@lists.ozlabs.org
References: <1493928505-30816-1-git-send-email-eajames@linux.vnet.ibm.com>
Cc: "Edward A. James" <eajames@us.ibm.com>, cbostic@linux.vnet.ibm.com
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Thu, 4 May 2017 15:52:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1493928505-30816-1-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17050420-0024-0000-0000-00000263ACAD
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007022; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000209; SDB=6.00856259; UDB=6.00423883; IPR=6.00635456; 
 BA=6.00005326; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015308; XFM=3.00000014;
 UTC=2017-05-04 20:53:01
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17050420-0025-0000-0000-000043DE7DD0
Message-Id: <61633f2b-0992-f018-63aa-961167fe270e@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-05-04_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1705040299
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 04 May 2017 20:53:06 -0000

On 05/04/2017 03:08 PM, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> This patch series adds an I2C bus algorithm to drive the I2C master located on
> POWER CPUs. The master is accessed over FSI bus from the service processor.
>
> The driver creates one chardev entry for each port off an I2C master by
> registering one I2C adapter for port. This implementation requires locking of
> the master in the driver to prevent transfers running into each other. The
> master registers are shared between ports.
>
> This patchset also adds the latest in FSI dt bindings from Jeremy Kerr. This
> describes the entire FSI tree structure (master -> slaves -> engines ->
> engine data (such as i2c master ports)). These bindings are required for the
> I2C driver in order to enumerate the ports off each I2C master.
>
> Edward A. James (6):
>    drivers: i2c: Add FSI-attached I2C master algorithm
>    drivers: i2c: Add port structure to FSI algorithm
>    drivers: i2c: Add transfer implementation for FSI algorithm
>    drivers: i2c: Add I2C master locking to FSI algorithm
>    drivers: i2c: Add bus recovery for FSI algorithm
>    dts: aspeed: witherspoon: Add I2C master under FSI masters
>
>   arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 156 ++++++
>   drivers/Makefile                                 |   2 +-
>   drivers/i2c/busses/Kconfig                       |  11 +
>   drivers/i2c/busses/Makefile                      |   1 +
>   drivers/i2c/busses/i2c-fsi.c                     | 681 +++++++++++++++++++++++
>   5 files changed, 850 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/i2c/busses/i2c-fsi.c
>

I also have a new debug tool for this driver. The old iicmaster doesn't 
work, and i2cset/i2cget don't work either, mainly because they don't 
support 10 bit addresses.

https://github.com/eddiejames/iicmaster

Eddie
