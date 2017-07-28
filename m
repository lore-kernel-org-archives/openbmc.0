Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xJsQQ3kyhzDrTr
 for <openbmc@lists.ozlabs.org>; Sat, 29 Jul 2017 00:57:34 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6SEs7Oj022366
 for <openbmc@lists.ozlabs.org>; Fri, 28 Jul 2017 10:57:31 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c01dywb84-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 28 Jul 2017 10:57:31 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 28 Jul 2017 10:57:31 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 28 Jul 2017 10:57:30 -0400
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6SEvTgr26214580; Fri, 28 Jul 2017 14:57:29 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7DBFB2803A;
 Fri, 28 Jul 2017 10:57:23 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP id 212332803F;
 Fri, 28 Jul 2017 10:57:23 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10] drivers/fsi: Remove scan from master
 registration
To: Jeremy Kerr <jk@ozlabs.org>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>, cbostic@linux.vnet.ibm.com
References: <1501180508-4009-1-git-send-email-eajames@linux.vnet.ibm.com>
 <0a2cb633-ae2a-7dd2-fe7d-cf565be4d8c2@ozlabs.org>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Fri, 28 Jul 2017 09:57:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <0a2cb633-ae2a-7dd2-fe7d-cf565be4d8c2@ozlabs.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17072814-0024-0000-0000-000002B717E4
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007441; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00894156; UDB=6.00447089; IPR=6.00674317; 
 BA=6.00005495; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016424; XFM=3.00000015;
 UTC=2017-07-28 14:57:31
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17072814-0025-0000-0000-000044E87409
Message-Id: <9d456a46-bf10-a977-1f38-a84995b08764@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-28_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1707280236
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
X-List-Received-Date: Fri, 28 Jul 2017 14:57:35 -0000



On 07/27/2017 09:07 PM, Jeremy Kerr wrote:
> Hi Chris,
>
>> Scanning during master registration is problematic because the gpio fsi
>> master will be registered during boot if it is present in device-tree
>> (it's a platform device). That means that the whole fsi scan occurs
>> during boot, which can cause problems.
> What kind of problems?

Two main problems.

1) The SBEFIFO and it's client driver probes can hang if the SBE is not 
initialized. Basically, we wait forever for a response from the SBE and 
never get it. Not a problem with manual scan because a) it can be 
interrupted and b) in scanning manually, the SBEFIFO client driver 
probes are designed to fail during the scan. For some reason, the device 
registration doesn't immediately probe the driver if the scan happens at 
boot, so this workaround doesn't work. So the boot can hang.

2) FSI operations while the host is booting can cause FSI failures. 
Since we don't know the state of the host while booting the BMC, it's 
generally not safe to do FSI ops as we may disrupt the host.

Thanks,
Eddie

>
> This sounds a bit awkward to me - it's fairly reasonable to expect the
> master to probe immediately. Requiring manual scan adds some unusual
> dependencies to the bus initialisation process.
>
> Cheers,
>
>
> Jeremy
>
