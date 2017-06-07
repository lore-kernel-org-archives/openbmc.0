Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wjVSv1zGlzDqKm
 for <openbmc@lists.ozlabs.org>; Wed,  7 Jun 2017 23:55:57 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v57DrqXo084640
 for <openbmc@lists.ozlabs.org>; Wed, 7 Jun 2017 09:55:54 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2axj3ha4jk-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 07 Jun 2017 09:55:54 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Wed, 7 Jun 2017 07:55:53 -0600
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 7 Jun 2017 07:55:50 -0600
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v57Dtnh418547066
 for <openbmc@lists.ozlabs.org>; Wed, 7 Jun 2017 06:55:49 -0700
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E69EC6E04C
 for <openbmc@lists.ozlabs.org>; Wed,  7 Jun 2017 07:55:48 -0600 (MDT)
Received: from Christophers-MacBook-Pro.local (unknown [9.81.195.225])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP id 115716E038
 for <openbmc@lists.ozlabs.org>; Wed,  7 Jun 2017 07:55:47 -0600 (MDT)
Subject: Re: [PATCH linux dev-4.10] drivers/fsi: Break and set pin states on
 GPIO master remove
To: openbmc@lists.ozlabs.org
References: <20170606200230.77482-1-cbostic@linux.vnet.ibm.com>
 <1ac7a650-9524-4c50-f449-b5fc89e8d988@ozlabs.org>
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Wed, 7 Jun 2017 08:55:45 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1ac7a650-9524-4c50-f449-b5fc89e8d988@ozlabs.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17060713-0016-0000-0000-000006E96FD8
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007189; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00871442; UDB=6.00433429; IPR=6.00651434; 
 BA=6.00005405; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015731; XFM=3.00000015;
 UTC=2017-06-07 13:55:51
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17060713-0017-0000-0000-00003A00A486
Message-Id: <bdb441e5-5485-9a67-1749-029f684162f9@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-07_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706070258
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
X-List-Received-Date: Wed, 07 Jun 2017 13:55:59 -0000



On 6/6/17 10:22 PM, Jeremy Kerr wrote:
> Hi Chris,
>
>> Update GPIO remove behavior to match dev-4.7.
>>
>> On gpio remove: Send a break
>> 		clock, translator, mux = 0
>> 		data, enable = 1
> While this change itself seems okay (leaving GPIOs in a defined state),
> I'm concerned about *why* we need this.
>
> If there is other code that need GPIOs in a certain state, then that
> code should be doing the required init itself.
Hi Jeremy,

The pins are set here mainly for the benefit of the Cronus debug 
tools.   Its common practice in test and bringup labs to switch back and 
forth between BMC and FSP-2 with Cronus to access the host processor 
CFAMs over FSI.  Without the remove pin state changes Cronus cannot access.

Cronus is a user space layer and presently doesn't modify gpio directly 
in this situation.   It could do this work I suppose but all designers 
involved will need to come to an agreement as to which is the proper 
approach.

Thanks,
Chris

> Could you add a comment on why this is required?
>
> Cheers,
>
>
> Jeremy
>
