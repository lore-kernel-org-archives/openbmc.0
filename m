Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wNLF41KTKzDqL9
 for <openbmc@lists.ozlabs.org>; Thu, 11 May 2017 01:46:15 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v4AFcqnu189444
 for <openbmc@lists.ozlabs.org>; Wed, 10 May 2017 11:46:13 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2abp5t6q3c-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 10 May 2017 11:46:12 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Wed, 10 May 2017 11:46:12 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 10 May 2017 11:46:09 -0400
Received: from b01ledav03.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v4AFk9N040828966; Wed, 10 May 2017 15:46:09 GMT
Received: from b01ledav03.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2FC4AB204D;
 Wed, 10 May 2017 11:46:04 -0400 (EDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.175.240])
 by b01ledav03.gho.pok.ibm.com (Postfix) with ESMTP id D2F95B2046;
 Wed, 10 May 2017 11:46:03 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10 0/7] OpenFSI Updates for dev-4.10 kernel
To: Jeremy Kerr <jk@ozlabs.org>, joel@jms.id.au
References: <20170509213902.37939-1-cbostic@linux.vnet.ibm.com>
 <2739f657-9419-1bd2-2a22-6c208c62828f@ozlabs.org>
Cc: openbmc@lists.ozlabs.org
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Wed, 10 May 2017 10:46:08 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <2739f657-9419-1bd2-2a22-6c208c62828f@ozlabs.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17051015-0040-0000-0000-000003386004
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007043; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000210; SDB=6.00858719; UDB=6.00425518; IPR=6.00638193; 
 BA=6.00005342; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015397; XFM=3.00000015;
 UTC=2017-05-10 15:46:10
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17051015-0041-0000-0000-0000072C8802
Message-Id: <81afded7-b04a-fbd3-005b-617325c7c21f@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-05-10_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1705100106
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
X-List-Received-Date: Wed, 10 May 2017 15:46:16 -0000



On 5/9/17 9:25 PM, Jeremy Kerr wrote:
> Hi Chris,
>
> If (and only if) you're planning to send another revision of the fsi
> patches upstream, I'd suggest squashing these into their original
> commits:
>
>>    drivers/fsi: Unscan on master unregister
>>    drivers/fsi: Fix one and two byte bus reads/writes
> But if not, I'm happy for these to stay separate.

Hi Jeremy,

Yep, I have that squashed into the v7 set.

Thanks,
Chris

> Other than that, this series should be fine for the openbmc tree.
>
> Cheers,
>
>
> Jeremy
>
