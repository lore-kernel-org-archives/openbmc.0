Return-Path: <tomjose@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=tomjose@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yydjy0vPjzDrcm
 for <openbmc@lists.ozlabs.org>; Fri, 15 Dec 2017 16:08:21 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 vBF54xhp116361
 for <openbmc@lists.ozlabs.org>; Fri, 15 Dec 2017 00:08:18 -0500
Received: from e06smtp15.uk.ibm.com (e06smtp15.uk.ibm.com [195.75.94.111])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ev315960w-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 15 Dec 2017 00:08:18 -0500
Received: from localhost
 by e06smtp15.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <tomjose@linux.vnet.ibm.com>;
 Fri, 15 Dec 2017 05:08:16 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp15.uk.ibm.com (192.168.101.145) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 15 Dec 2017 05:08:12 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 vBF58CLU62193722; Fri, 15 Dec 2017 05:08:12 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B5DCD52047;
 Fri, 15 Dec 2017 04:01:15 +0000 (GMT)
Received: from [9.79.181.15] (unknown [9.79.181.15])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 8D6BE52041;
 Fri, 15 Dec 2017 04:01:14 +0000 (GMT)
Subject: Re: IPMI LAN command story design - try 3rd send
To: Jeremy Kerr <jk@ozlabs.org>
Cc: Vernon Mauery <vernon.mauery@linux.intel.com>,
 Patrick Williams <patrick@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <TY1PR06MB08635DA92530A90D5D2C039DF6A30@TY1PR06MB0863.apcprd06.prod.outlook.com>
 <581C8C7D.8080702@linux.vnet.ibm.com> <20161104141455.GE17105@heinlein.lan>
 <581CCA61.4010202@linux.vnet.ibm.com> <20161107035006.GB15757@heinlein.lan>
 <80bcfede-6212-157b-e391-6e4bc526b339@ozlabs.org>
 <432e5d6e-ac7a-6844-2bc9-4a046af0abda@linux.vnet.ibm.com>
 <86bef8c4-2f54-6c33-93eb-5ed6aa212aff@ozlabs.org>
 <84218d7b-714c-761e-cd93-97118ceee49f@linux.vnet.ibm.com>
 <f0577dd5-1df9-d077-fb95-24eaec58489d@ozlabs.org>
 <20171214162608.GK113334@mauery>
 <c10d1ea4-f4c4-f51a-acb2-a6b252be4ba9@ozlabs.org>
From: Tom Joseph <tomjose@linux.vnet.ibm.com>
Date: Fri, 15 Dec 2017 10:38:08 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <c10d1ea4-f4c4-f51a-acb2-a6b252be4ba9@ozlabs.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17121505-0020-0000-0000-000003E02464
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17121505-0021-0000-0000-000042712D37
Message-Id: <e5ae4cd0-f76d-cb53-d96b-bd55cd3e99e9@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-12-15_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1712150070
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Dec 2017 05:08:22 -0000



On Friday 15 December 2017 03:25 AM, Jeremy Kerr wrote:
> Hi Vernon,
>
>> I would agree. ipmitool is broken. It should have a
>> network-start-configure mechanism that would set the set-complete bit.
>> The you could send any number of its network configuration parameters.
>> Then it should have a network-finish-configure command that would clear
>> the set-complete bit.
> Or, even simpler: allow multiple parameter changes on one invocation:
>
>   ipmitool [...] lan set 1 ipsrc static ipaddr 192.168.0.2 netmask 255.255.255.0
>
> [which changes all parameters under one transition of the set-complete
> flag]
>
> Then, there's no need to modify existing users' behaviour, and no
> concern about forgetting to apply.

Jeremy,

I was carried away by the ipmitool implementation when i was trying to 
understand how this works.

But this looks like a neat way to get the network settings applied.

>
> Regards,
>
>
> Jeremy
>
