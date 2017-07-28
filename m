Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xJrql00ffzDrFt
 for <openbmc@lists.ozlabs.org>; Sat, 29 Jul 2017 00:30:58 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6SETUDm149634
 for <openbmc@lists.ozlabs.org>; Fri, 28 Jul 2017 10:30:56 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2c01jnbqa8-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 28 Jul 2017 10:30:56 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 28 Jul 2017 08:30:55 -0600
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 28 Jul 2017 08:30:52 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6SEUqvo65536188; Fri, 28 Jul 2017 07:30:52 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4DAD0C6042;
 Fri, 28 Jul 2017 08:30:52 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id D481DC603C;
 Fri, 28 Jul 2017 08:30:51 -0600 (MDT)
Subject: Re: [PATCH linux dev-4.10] drivers/fsi/scom: Remove reset before
 every putscom
To: Jeremy Kerr <jk@ozlabs.org>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>, cbostic@linux.vnet.ibm.com
References: <1500562258-20214-1-git-send-email-eajames@linux.vnet.ibm.com>
 <ed57c99d-4ff6-300e-71c8-7afde6a61bed@ozlabs.org>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Fri, 28 Jul 2017 09:30:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <ed57c99d-4ff6-300e-71c8-7afde6a61bed@ozlabs.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17072814-0016-0000-0000-00000742DC65
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007441; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00894147; UDB=6.00447084; IPR=6.00674308; 
 BA=6.00005495; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016424; XFM=3.00000015;
 UTC=2017-07-28 14:30:53
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17072814-0017-0000-0000-00003ACB88EA
Message-Id: <b8ec235e-b4bb-2fd3-75f5-54d96d500522@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-28_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1707280229
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
X-List-Received-Date: Fri, 28 Jul 2017 14:30:59 -0000



On 07/27/2017 09:10 PM, Jeremy Kerr wrote:
> Hi Eddie,
>
>> Reset causes problems for operations requiring multiple scoms (e.g. i2c
>> over scom). Instead, reset scom engine during probe.
> Looks good to me. Out of curiosity, what kind of problems?

Mainly I2C bus arbitration errors. I guess the reset interrupted the I2C 
clock line control during an operation.

Thanks,
Eddie
>
> Acked-by: Jeremy Kerr <jk@ozlabs.org>
>
> Cheers,
>
>
> Jeremy
>
