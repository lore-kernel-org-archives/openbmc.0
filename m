Return-Path: <tomjose@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=tomjose@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yyB5Z5SdWzDrcP
 for <openbmc@lists.ozlabs.org>; Thu, 14 Dec 2017 22:23:46 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 vBEBMhfh109850
 for <openbmc@lists.ozlabs.org>; Thu, 14 Dec 2017 06:23:44 -0500
Received: from e06smtp10.uk.ibm.com (e06smtp10.uk.ibm.com [195.75.94.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2eun0ygpcq-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 14 Dec 2017 06:23:43 -0500
Received: from localhost
 by e06smtp10.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <tomjose@linux.vnet.ibm.com>;
 Thu, 14 Dec 2017 11:23:41 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp10.uk.ibm.com (192.168.101.140) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 14 Dec 2017 11:23:39 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 vBEBNciV37093562; Thu, 14 Dec 2017 11:23:38 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 094F9A405D;
 Thu, 14 Dec 2017 11:17:57 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DFB35A404D;
 Thu, 14 Dec 2017 11:17:55 +0000 (GMT)
Received: from [9.124.218.75] (unknown [9.124.218.75])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 14 Dec 2017 11:17:55 +0000 (GMT)
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
From: Tom Joseph <tomjose@linux.vnet.ibm.com>
Date: Thu, 14 Dec 2017 16:53:35 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <80bcfede-6212-157b-e391-6e4bc526b339@ozlabs.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17121411-0040-0000-0000-000003FA0E19
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17121411-0041-0000-0000-000025FD215B
Message-Id: <432e5d6e-ac7a-6844-2bc9-4a046af0abda@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-12-14_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1712140158
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
X-List-Received-Date: Thu, 14 Dec 2017 11:23:47 -0000



On Wednesday 13 December 2017 08:38 AM, Jeremy Kerr wrote:
> Hi all,
>
> Digging up an old thread here, but I think this is important:
>
>> Thanks for the explanation.  With this website you pointed to and some
>> other investigation I've done, I am comfortable with us using the 'Set
>> Channel Access' as the time to apply the settings.  The documentation of
>> two competition products both seem to require an 'ipmitool mc reset
>> warm' for IP address changes to take effect, so we are at least better
>> than that.
> The two BMC implementations that I'm aware of do not require a mc reset
> for lan parameters to be applied. Both will apply settings without
> further commands. One will wait 10 seconds before applying settings, to
> allow multiple changes to be grouped into a single reconfiguration.
>
> Requiring non-standard command to be issued causes a disconnect between
> user expectations and our implementation. We'd have to document this
> difference in behaviour for every potential sysadmin interacting with
> OpenBMC.
  The command to apply BMC network settings on OpenBMC IPMI reference
  implementation is set channel access, which is a standard command
  mentioned in the IPMI specification.

  It is not clear to me from the IPMI specification, on which 
command/condition
  the BMC network settings are applied. The BMC implementation that 
applies the
  settings after `10` sec does it after which parameter? It sounds like 
an OEM/custom
way of doing and not based on IPMI specification.

If you can provide more details on how it is done on the BMC 
implementation, we
can consider it as a way to implement this command.

>
>> Can you internally track down a contact on the xCAT team and verify that
>> this will be ok with them?
> Not just xCAT, but every other provisioning software that will support
> OpenBMC. Including ones that are custom-developed. That's not feasible.
>
> For cases like this, we should really reconsider before coming up with
> our own special interface requirements.
>
> Regards,
>
>
> Jeremy
>
