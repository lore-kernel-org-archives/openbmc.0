Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vl7m72gcmzDqZD
 for <openbmc@lists.ozlabs.org>; Sat, 18 Mar 2017 01:59:35 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v2HEwfU3104486
 for <openbmc@lists.ozlabs.org>; Fri, 17 Mar 2017 10:59:23 -0400
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
 by mx0a-001b2d01.pphosted.com with ESMTP id 297xkuxt1q-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 17 Mar 2017 10:59:23 -0400
Received: from localhost
 by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 17 Mar 2017 08:59:22 -0600
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e37.co.us.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 17 Mar 2017 08:59:20 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v2HExKx017039660; Fri, 17 Mar 2017 07:59:20 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E798213603A;
 Fri, 17 Mar 2017 08:59:19 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id 8FB6913603C;
 Fri, 17 Mar 2017 08:59:19 -0600 (MDT)
Subject: Re: [RFC linux dev-4.7 0/4] drivers: i2c: FSI-attached I2C master
 algorithm
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, Joel Stanley <joel@jms.id.au>
References: <1489182506-20505-1-git-send-email-eajames@linux.vnet.ibm.com>
 <57A4FEEE-E09F-443A-B7AB-226457C39D25@fuzziesquirrel.com>
 <c3ddbdde-02ba-425d-a75a-bec7dce2b714@linux.vnet.ibm.com>
 <718E3927-8949-417C-8055-2B192958D49C@fuzziesquirrel.com>
Cc: "Edward A. James" <eajames@us.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Fri, 17 Mar 2017 09:59:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <718E3927-8949-417C-8055-2B192958D49C@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 17031714-0024-0000-0000-00001613CBD9
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006799; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000206; SDB=6.00835164; UDB=6.00410221; IPR=6.00612819; 
 BA=6.00005216; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014693; XFM=3.00000013;
 UTC=2017-03-17 14:59:21
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17031714-0025-0000-0000-000049884EE9
Message-Id: <1df1e468-4718-03d6-cb13-41c72ad3c0b8@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-03-17_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1703170125
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
X-List-Received-Date: Fri, 17 Mar 2017 14:59:35 -0000



On 03/16/2017 07:44 PM, Brad Bishop wrote:
> [snip]
>
>>>> The driver will currently set up one chardev for each master (each proc).
>>>> The port is then specified by hacking the addr field of i2c_msg. It works,
>>>> but not a clean solution.
>>> I’d say we just go with one chardev per port, unless others have experience
>>> that recommends otherwise.
>> Thought of a potential issue with this approach. This will require some custom bus locking solution, as we need to prevent multiple transfers from setting the master regs at the same time.
> Does each port have its own reg(s) or do bits n-m in reg x correlate to ports n-m?

All the regs are shared between the ports for that master. On the P9, we 
have 15 ports per master. You have to set the port number in the mode 
register. All the registers just control the master, which does the 
necessary operations on the specified port.

So there will be access of the same registers for different port chardevs.

>
>> Obviously the kernel i2c driver handles locking on each chardev to prevent simultaneous access, but since we will have multiple chardevs that have to lock each other out, we need to do it ourselves.
>>
>> I think having our own locking is pretty do-able, I just wonder if the kernel guys will not be happy with it?
>>
>> Eddie
>>>> FSI clocking details are not defined in the device tree, so FSI clock is
>>>> hardcoded for now.
>>>>
>>>> Edward A. James (4):
>>>>   drivers: fsi: Add function to get FSI clock rate
>>>>   drivers: i2c: Add FSI-attached I2C master algorithm
>>>>   drivers: i2c: Add transfer implementation for FSI algorithm
>>>>   drivers: i2c: Add bus recovery for FSI algorithm
>>>>
>>>> drivers/Makefile             |   2 +-
>>>> drivers/fsi/fsi-core.c       |   7 +
>>>> drivers/i2c/busses/Kconfig   |  11 +
>>>> drivers/i2c/busses/Makefile  |   1 +
>>>> drivers/i2c/busses/i2c-fsi.c | 608 +++++++++++++++++++++++++++++++++++++++++++
>>>> include/linux/fsi.h          |   1 +
>>>> 6 files changed, 629 insertions(+), 1 deletion(-)
>>>> create mode 100644 drivers/i2c/busses/i2c-fsi.c
>>>>
>>>> -- 
>>>> 1.8.3.1
