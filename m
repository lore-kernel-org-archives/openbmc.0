Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vT1St6zjCzDq60
 for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2017 02:27:26 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1MFOOYQ123954
 for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2017 10:27:24 -0500
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0b-001b2d01.pphosted.com with ESMTP id 28s7gxrrj7-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2017 10:27:24 -0500
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Wed, 22 Feb 2017 10:27:23 -0500
Received: from d01dlp03.pok.ibm.com (9.56.250.168)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 22 Feb 2017 10:27:21 -0500
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23])
 by d01dlp03.pok.ibm.com (Postfix) with ESMTP id 7CDC8C90045;
 Wed, 22 Feb 2017 10:27:01 -0500 (EST)
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1MFRK5Y43188242; Wed, 22 Feb 2017 15:27:20 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1EEB0AC04A;
 Wed, 22 Feb 2017 10:27:18 -0500 (EST)
Received: from Christophers-MacBook-Pro.local (unknown [9.83.4.51])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id 57135AC057;
 Wed, 22 Feb 2017 10:27:15 -0500 (EST)
Subject: Re: [PATCH linux dev-4.7 v2 0/7] drivers/fsi: Add hub master
To: Jeremy Kerr <jk@ozlabs.org>, joel@jms.id.au
References: <20170221215032.79282-1-cbostic@linux.vnet.ibm.com>
 <aa5f0e25-26fd-b8cf-b387-741caea00604@ozlabs.org>
Cc: openbmc@lists.ozlabs.org
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Wed, 22 Feb 2017 09:27:16 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <aa5f0e25-26fd-b8cf-b387-741caea00604@ozlabs.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17022215-0040-0000-0000-000002B015D7
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006663; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000204; SDB=6.00825543; UDB=6.00404227; IPR=6.00602998; 
 BA=6.00005166; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014394; XFM=3.00000011;
 UTC=2017-02-22 15:27:22
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17022215-0041-0000-0000-000006A33C57
Message-Id: <bd5e0f6d-1f94-32fc-e196-e47e81c8820c@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-22_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702220145
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
X-List-Received-Date: Wed, 22 Feb 2017 15:27:27 -0000



On 2/21/17 7:08 PM, Jeremy Kerr wrote:
> Hi Chris,
>
>> Adds the FSI hub master functionality to the OpenFSI device driver.
>> Hub master is a FSI client device driver that registers with the
>> core and is notified when devices it wants, hub master engine and
>> links, are discovered.
>>
>> v2: Restructured to move hub into the core instead of a separate
>>      slave device driver.
>>
>> Christopher Bostic (7):
>>    drivers/fsi: Add hub master scan detect
>>    drivers/fsi: Initialize hub master
>>    drivers/fsi: Define hub master callbacks
>>    drivers/fsi: Move common read write ops into single function
>>    drivers/fsi: Add retry on bus error detect
>>    drivers/fsi: Cleanup bus errors
>>    tools/testing/selftests: Add fsi command line tool
> This changeset seems to add both the hub master, and the generic error
> handing. Could this be split into two series?
Hi Jeremy,

Sure, will split those up.

Thanks


> Cheers,
>
>
> Jeremy
>
