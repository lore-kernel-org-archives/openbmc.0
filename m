Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vq7Hp0hyXzDq7d
 for <openbmc@lists.ozlabs.org>; Fri, 24 Mar 2017 13:52:21 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v2O2mTqQ089152
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 22:52:19 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0a-001b2d01.pphosted.com with ESMTP id 29cp84twmf-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 22:52:19 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Thu, 23 Mar 2017 22:52:18 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 23 Mar 2017 22:52:16 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v2O2qFqe61800486; Fri, 24 Mar 2017 02:52:15 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 00BC4112056;
 Thu, 23 Mar 2017 22:52:14 -0400 (EDT)
Received: from Christophers-MacBook-Pro.local (unknown [9.83.3.195])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id E2828112047;
 Thu, 23 Mar 2017 22:52:11 -0400 (EDT)
Subject: Re: Upstream work for OpenFSI patches
To: Jeremy Kerr <jk@ozlabs.org>, openbmc@lists.ozlabs.org,
 Christopher Bostic <christopher.lee.bostic@gmail.com>
References: <05efd2cd-b928-96eb-433e-49ff451eaaf3@ozlabs.org>
 <00baa1b7-d784-b73a-d396-e132bea3057b@linux.vnet.ibm.com>
 <7b2e265a-dba1-5dc3-47f8-d17383bbeca3@ozlabs.org>
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Thu, 23 Mar 2017 21:52:10 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <7b2e265a-dba1-5dc3-47f8-d17383bbeca3@ozlabs.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17032402-0052-0000-0000-000001B6B101
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006838; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000206; SDB=6.00838065; UDB=6.00412070; IPR=6.00615828; 
 BA=6.00005234; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014786; XFM=3.00000013;
 UTC=2017-03-24 02:52:17
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17032402-0053-0000-0000-00004F63E76D
Message-Id: <f248f96b-6c63-7651-34ba-33f90f9a5ae0@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-03-24_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1703240024
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
X-List-Received-Date: Fri, 24 Mar 2017 02:52:22 -0000



On 3/23/17 9:39 PM, Jeremy Kerr wrote:
> Hi Chris,
>
> One other thing:
>
>>> I've kept the original authorship attribution on each patch, but do let
>>> me know if anything seems amiss.
> You have commits using both of your email addresses. Would you like me
> to change those to just one? If so, which would you prefer? And what
> address should I use for the MAINTAINERS entry?
Hi Jeremy,

I'll be using my linux.vnet.ibm.com for everything going forward so if 
you could update to that for maintainers and authorship it would be 
appreciated.

Thanks,
Chris

>
> Cheers,
>
>
> Jeremy
>
