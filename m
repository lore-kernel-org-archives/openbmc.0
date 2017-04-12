Return-Path: <tomjose@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w3F0z4rZszDq5W
 for <openbmc@lists.ozlabs.org>; Thu, 13 Apr 2017 05:51:31 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v3CJnVfg037748
 for <openbmc@lists.ozlabs.org>; Wed, 12 Apr 2017 15:51:23 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0a-001b2d01.pphosted.com with ESMTP id 29sstvapes-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 12 Apr 2017 15:51:23 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <tomjose@linux.vnet.ibm.com>;
 Wed, 12 Apr 2017 15:51:21 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 12 Apr 2017 15:51:20 -0400
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v3CJpJGh43253826; Wed, 12 Apr 2017 19:51:19 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E471B2804A;
 Wed, 12 Apr 2017 15:51:14 -0400 (EDT)
Received: from [9.79.209.239] (unknown [9.79.209.239])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP id DADEB28048;
 Wed, 12 Apr 2017 15:51:13 -0400 (EDT)
From: tomjose <tomjose@linux.vnet.ibm.com>
Subject: Re: Plans for BMC i2c to host bridge via IPMI
To: Peter Hanson <peterh@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CAPozSNp_S_-N8YV=ruAzYVxWy4FgcJvyK27HFb0YL-mNYP22xA@mail.gmail.com>
Date: Thu, 13 Apr 2017 01:21:10 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <CAPozSNp_S_-N8YV=ruAzYVxWy4FgcJvyK27HFb0YL-mNYP22xA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17041219-0052-0000-0000-000001D472D3
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006924; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000208; SDB=6.00846647; UDB=6.00417634; IPR=6.00625085; 
 BA=6.00005286; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015025; XFM=3.00000013;
 UTC=2017-04-12 19:51:21
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17041219-0053-0000-0000-00004FE5F546
Message-Id: <58EE852E.8010005@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-04-12_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1704120162
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
X-List-Received-Date: Wed, 12 Apr 2017 19:51:32 -0000

Hello Peter,

As i understand you would be leveraging the BT(Block Transfer) interface 
to route commands from host to BMC.

 From the IPMI specification it looks like this can be a generic one 
implementation instead of implementing
OEM commands.

Implementing the IPMB interface (Section 7) in the IPMI specification 
would probably suit your requirement.
The following commands should help us achieve the goal: Master 
Write-Read command, Get Message command
and Send message command.

I am thinking that IPMB interface could be a dbus service which parses 
host IPMI commands and maps to an I2C read/write.

Let me know your thoughts.

Regards,
Tom


On Thursday 06 April 2017 07:10 AM, Peter Hanson wrote:
> Ave!
>
> This email captures proposed actions from an exchange earlier today on
> the #openbmc IRC channel.
>
> Basic goal is to reach devices on a BMC I2C bus from IPMI commandline at host.
>
> I2C commands and responses to be carried as OEM extension messages,
> i.e., Network Function Codes 2Eh / 2Fh in the Intel specification.
> Those message forms require a three byte IANA Enterprise Number, and
> our original plan used Google's code.
>
> We would like to carry the feature in OpenBmc, so I wanted to confirm
> if this is acceptable, and/or what modifications would be needed.
>
> Decisions:
>
> 1. Ok to use OEM extensions. Patrick noted that OpenBmc already uses
> some, albeit under the IBM IANA Enterprise Number.
>
> 2. Switch to OpenBmc IANA Enterprise Number when available.
>
> 3. Patrick proposed to create a new phosphor-ipmi-oemproviders repo to
> hold the code, message documentation, etc.
>
> 4. All uses of the OpenBmc IANA shall be enumerated in place - almost
> certainly an include file in the new repo - so we don't end up with
> conflicting uses.
>
> Actions:
>
> A1. peterh: send this email to the mailing list.
> A2. stwcx: request IANA Enterprise Number.
> A3. stwcx: create new phosphor-ipmi-oemproviders repo.
> A4. peterh+brendanhiggins: propose detailed message designs.
> A5. peterh: {net-ipmid,host-ipmi} += support for these commands.
>
> A key point of this email is to reap your collective wisdom, so please
> if you have something to contribute, please do. In particular,
> Patrick, please correct anything I misunderstood or incorrectly
> extrapolated from the chat.
>
>    -- peterh
>
