Return-Path: <vishwa@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xYCtw5TG6zDrFK
 for <openbmc@lists.ozlabs.org>; Fri, 18 Aug 2017 03:31:36 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7HHSll9165139
 for <openbmc@lists.ozlabs.org>; Thu, 17 Aug 2017 13:31:33 -0400
Received: from e23smtp08.au.ibm.com (e23smtp08.au.ibm.com [202.81.31.141])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2cdcw1s2p1-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 17 Aug 2017 13:31:33 -0400
Received: from localhost
 by e23smtp08.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Fri, 18 Aug 2017 03:31:30 +1000
Received: from d23relay06.au.ibm.com (202.81.31.225)
 by e23smtp08.au.ibm.com (202.81.31.205) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 18 Aug 2017 03:31:28 +1000
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
 by d23relay06.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7HHVSkW35520692
 for <openbmc@lists.ozlabs.org>; Fri, 18 Aug 2017 03:31:28 +1000
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v7HHVJuu012031
 for <openbmc@lists.ozlabs.org>; Fri, 18 Aug 2017 03:31:19 +1000
Received: from [9.77.198.178] ([9.77.198.178])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v7HHVHE5011996; Fri, 18 Aug 2017 03:31:18 +1000
Subject: Re: Design proposal on removing /org/openbmc/settings/boot_policy"
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>,
 Patrick Williams <patrick@stwcx.xyz>
References: <b820c5bf-3f9c-b59d-97d1-549df44aa1e5@linux.vnet.ibm.com>
 <20170814191811.GD20526@asimov.lan>
 <85a8a445-8445-7beb-0107-5f11e78dda3b@linux.vnet.ibm.com>
 <20170817140246.GA28585@asimov>
 <b5f6893b-ac0b-8437-72c3-58bae8bbc53f@linux.vnet.ibm.com>
 <12950927-32da-00bb-9afa-db6728aedd21@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: vishwa <vishwa@linux.vnet.ibm.com>
Date: Thu, 17 Aug 2017 23:01:25 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <12950927-32da-00bb-9afa-db6728aedd21@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
x-cbid: 17081717-0048-0000-0000-000002591ADC
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17081717-0049-0000-0000-0000480D2258
Message-Id: <43a6de62-a99b-bb50-1de3-e932dc27be0f@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-17_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1708170287
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
X-List-Received-Date: Thu, 17 Aug 2017 17:31:37 -0000



On 08/17/2017 10:19 PM, Deepak Kodihalli wrote:
> On 17/08/17 9:03 pm, vishwa wrote:
>
>> One of the comment from Deepak in the review was : "If something is
>> ONETIME, then should we save the corresponding Mode / Source to the
>> Flash and I said the answer was "Yes". I see what is being said here in
>> the email is different from what the comment was before.
>>
>> If a setting is ONETIME, then the host comes down and sets the property
>> to DEFAULT and does not do anything with PERMANENT.
>>
>> https://github.com/open-power/petitboot/blob/master/discover/platform-powerpc.c#L874 
>>
>>
>>
>> I don't think so we are introducing any new behavior here. All that was
>> done before is being moved to this new D-Bus object.
>> If something needs to be treated PERMANENT, then it needs to be set by
>> the user as it was before.
>
> Vishwa, I suppose the concern is that we're relying on a specific host 
> behavior, and we're also assuming the host will perform certain 
> actions as per the IPMI specification. So all this is fine as long as 
> these assumptions hold, but they may not always.
>
> In other words, the BMC must not assume it's safe to overwrite a 
> persisted permanent setting with a onetime setting in the assumption 
> that a host will overwrite that value again with a default/permanently 
> desired setting.

I don't think so we are coding anything here that is tightly bound to 
anything. Host is not making anything PERMANENT based on anything. So if 
something needs to be permanent, it needs to be set by the user. It's 
just that on seeing ONETIME, the host sets the flag to DEFAULT and that 
makes perfect sense since this setting is for the Host and post 
consuming it, the consumer would need to say that its been consumed and 
hence reset to DEFAULT.

>
> Regards,
> Deepak
>
