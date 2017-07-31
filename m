Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xLNdd6whfzDsQ4
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 12:27:33 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6V2Nu2I008616
 for <openbmc@lists.ozlabs.org>; Sun, 30 Jul 2017 22:27:31 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2c11c7ttvt-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sun, 30 Jul 2017 22:27:31 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Sun, 30 Jul 2017 20:27:30 -0600
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Sun, 30 Jul 2017 20:27:28 -0600
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6V2RSHl65208322; Sun, 30 Jul 2017 19:27:28 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F5FD6A03B;
 Sun, 30 Jul 2017 20:27:28 -0600 (MDT)
Received: from Christophers-MacBook-Pro.local (unknown [9.85.181.170])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP id 5B3AE6A03D;
 Sun, 30 Jul 2017 20:27:27 -0600 (MDT)
Subject: Re: [PATCH linux dev-4.10] drivers/fsi: Remove scan from master
 registration
To: Jeremy Kerr <jk@ozlabs.org>, Patrick Williams <patrick@stwcx.xyz>,
 Eddie James <eajames@linux.vnet.ibm.com>
References: <1501180508-4009-1-git-send-email-eajames@linux.vnet.ibm.com>
 <0a2cb633-ae2a-7dd2-fe7d-cf565be4d8c2@ozlabs.org>
 <9d456a46-bf10-a977-1f38-a84995b08764@linux.vnet.ibm.com>
 <20170728151405.GB14987@asimov>
 <abbfb937-cefd-c7e3-3acf-be4092624273@ozlabs.org>
Cc: "Edward A. James" <eajames@us.ibm.com>, openbmc@lists.ozlabs.org
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Sun, 30 Jul 2017 21:27:26 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <abbfb937-cefd-c7e3-3acf-be4092624273@ozlabs.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17073102-0012-0000-0000-000014C32876
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007456; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00895312; UDB=6.00447771; IPR=6.00675499; 
 BA=6.00005501; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016457; XFM=3.00000015;
 UTC=2017-07-31 02:27:29
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17073102-0013-0000-0000-00004ED874D5
Message-Id: <d4b089af-9b63-2c0c-32ac-1d9f664937c7@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-31_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1707310041
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
X-List-Received-Date: Mon, 31 Jul 2017 02:27:34 -0000



On 7/30/17 8:40 PM, Jeremy Kerr wrote:
> Hi Eddie & Patrick,
>
>> On Fri, Jul 28, 2017 at 09:57:23AM -0500, Eddie James wrote:
>>> 2) FSI operations while the host is booting can cause FSI failures.
>>> Since we don't know the state of the host while booting the BMC, it's
>>> generally not safe to do FSI ops as we may disrupt the host.
>>  From my perspective this is especially bad because it would only surface
>> in specific timing conditions.  The FSI bus is, by the system
>> architecture, under the control of the Host for a period during the
>> boot.
> OK, so this sounds like a good reason to add some form of arbitration,
> but this patch isn't sufficient to handle that - we still have GPIO
> initialisation on (FSI master) driver probe, and there's other
> facilities that would cause the BMC to access the bus, potentially in
> conflict with the host master.
>
> So, I'd suggest this instead:
>
>   - add a 'blocked' state to the fsi master driver, which prevents
>     *all* accesses to the GPIOs, including during init; all master
>     reads/writes would return -EBUSY.
>
>   - add a boolean device tree property to indicate that a master should
>     be initialised in blocked state (preventing GPIO changes during
>     probe)
Hi Jeremy,

Not sure I follow what the FSI GPIO master probe would do if it can't 
access the GPIO itself, assuming we're in blocked mode. Would this 
require a deferred probe of some kind once access is unblocked?

There is also a control register setting


Also, in the existing FSP-2 implementation there is a bit in the FSI 
slave SISC which indicates if OPB if fence by host.  Which I believe is 
set whenever host boot is using the FSI bus.   Possibly we could use 
that info to determine if any FSI accesses past the CFAM slave engines 
are allowed.   This might be racy though since BMC can't control when 
that bit is set and cleared.



>
>     It would make sense for this property to be associated with the
>     'fsi-master' compatible value, as it'd potentially apply to all
>     master implementations, not just GPIO-based ones.
>
>   - add a sysfs file to control blocked state, which would be updated
>     when the host acquires/releases control of the bus.
>
> We may want to rethink the 'external mode' implementation to work with
> this too.
>
> Regards,
>
>
> Jeremy
>
