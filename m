Return-Path: <tomjose@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=tomjose@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yyDKD0VrtzDrZq
 for <openbmc@lists.ozlabs.org>; Fri, 15 Dec 2017 00:03:59 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 vBECrmrw115649
 for <openbmc@lists.ozlabs.org>; Thu, 14 Dec 2017 08:03:56 -0500
Received: from e06smtp10.uk.ibm.com (e06smtp10.uk.ibm.com [195.75.94.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2euqv4nc79-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 14 Dec 2017 08:03:55 -0500
Received: from localhost
 by e06smtp10.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <tomjose@linux.vnet.ibm.com>;
 Thu, 14 Dec 2017 13:03:42 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp10.uk.ibm.com (192.168.101.140) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 14 Dec 2017 13:03:39 -0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 vBED3c7732505934; Thu, 14 Dec 2017 13:03:39 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AD1DE42042;
 Thu, 14 Dec 2017 12:57:52 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2D7F942047;
 Thu, 14 Dec 2017 12:57:51 +0000 (GMT)
Received: from [9.124.218.75] (unknown [9.124.218.75])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 14 Dec 2017 12:57:50 +0000 (GMT)
Subject: Re: IPMI LAN command story design - try 3rd send
To: Jeremy Kerr <jk@ozlabs.org>
Cc: Patrick Williams <patrick@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, vernon.mauery@linux.intel.com
References: <TY1PR06MB0863871D99A02C72E98F2462F6C20@TY1PR06MB0863.apcprd06.prod.outlook.com>
 <57F37746.6040304@linux.vnet.ibm.com>
 <20161004145104.d5co7h25dakpcxyz@asimov>
 <TY1PR06MB0863CF900A7338954B8ED956F6D00@TY1PR06MB0863.apcprd06.prod.outlook.com>
 <TY1PR06MB08635DA92530A90D5D2C039DF6A30@TY1PR06MB0863.apcprd06.prod.outlook.com>
 <581C8C7D.8080702@linux.vnet.ibm.com> <20161104141455.GE17105@heinlein.lan>
 <581CCA61.4010202@linux.vnet.ibm.com> <20161107035006.GB15757@heinlein.lan>
 <80bcfede-6212-157b-e391-6e4bc526b339@ozlabs.org>
 <432e5d6e-ac7a-6844-2bc9-4a046af0abda@linux.vnet.ibm.com>
 <86bef8c4-2f54-6c33-93eb-5ed6aa212aff@ozlabs.org>
From: Tom Joseph <tomjose@linux.vnet.ibm.com>
Date: Thu, 14 Dec 2017 18:33:32 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <86bef8c4-2f54-6c33-93eb-5ed6aa212aff@ozlabs.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17121413-0040-0000-0000-000003FA17DB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17121413-0041-0000-0000-000025FD2B79
Message-Id: <84218d7b-714c-761e-cd93-97118ceee49f@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-12-14_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1712140178
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
X-List-Received-Date: Thu, 14 Dec 2017 13:04:00 -0000



On Thursday 14 December 2017 06:00 PM, Jeremy Kerr wrote:
> Hi Tom,
>
>>> Requiring non-standard command to be issued causes a disconnect between
>>> user expectations and our implementation. We'd have to document this
>>> difference in behaviour for every potential sysadmin interacting with
>>> OpenBMC.
>>   The command to apply BMC network settings on OpenBMC IPMI reference
>>   implementation is set channel access, which is a standard command
>>   mentioned in the IPMI specification.
> It may be a standard command, but using it in this context certainly
> isn't standard, nor even a common convention.
>
> The issue is that we're introducing an "unusual" step for this
> configuration process, and expecting all users to know about it.
>
>>   It is not clear to me from the IPMI specification, on which
>> command/condition
>>   the BMC network settings are applied.
> Ideally, the settings should be applied as soon as the 'Set in progress'
> flag indicates that the change is complete.
>
> Adding the 10-second delay allows users to "batch" multiple changes,
> meaning that network connectivity isn't lost between those changes. This
> is purely to allow ipmitool (which doesn't have a facility to make
> multiple changes before indicating that the change is complete) to be
> used over the network to change the lan configuration (which is a bit
> risky regardless...).

Yeah all this lack of clarity, arises from a lack of mechanism in IPMI to
apply multiple changes (IP address, netmask gateway) together. In the
ipmitool implementation the set-in-progress is cleared after each network
parameter setting.


>
> For doing this over the in-band interface, there is no harm in applying
> the settings immediately.
>
> To implement something complying to a "principle of least surprise", I'd
> suggest that we should:
>
>   - batch changes, and have them applied after 10 seconds from clearing
>     the set-in-progress flag
>
>   - submit patches to ipmitool to allow multiple changes to be applied
>     at once (ie, one clearing of the set-in-progress flag).

I prefer the second option of allowing ipmitool to explicitly clear the 
set-in-progress flag.
thus allowing multiple changes to take effect.

The first option is really  "unusual way" to get this done, to overcome 
a specification shortcoming.
>
> Regards,
>
>
> Jeremy
>
>
>
>
>
>
>
>
>
>
>
