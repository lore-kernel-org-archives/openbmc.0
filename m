Return-Path: <dkodihal@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xYDZT6gLpzDqgD
 for <openbmc@lists.ozlabs.org>; Fri, 18 Aug 2017 04:02:25 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7HHwlWb011767
 for <openbmc@lists.ozlabs.org>; Thu, 17 Aug 2017 14:02:22 -0400
Received: from e23smtp08.au.ibm.com (e23smtp08.au.ibm.com [202.81.31.141])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2cdd2p1rb2-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 17 Aug 2017 14:02:22 -0400
Received: from localhost
 by e23smtp08.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Fri, 18 Aug 2017 04:02:19 +1000
Received: from d23relay06.au.ibm.com (202.81.31.225)
 by e23smtp08.au.ibm.com (202.81.31.205) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 18 Aug 2017 04:02:16 +1000
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
 by d23relay06.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7HI2G5w38600784
 for <openbmc@lists.ozlabs.org>; Fri, 18 Aug 2017 04:02:16 +1000
Received: from d23av04.au.ibm.com (localhost [127.0.0.1])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v7HI2GmO013885
 for <openbmc@lists.ozlabs.org>; Fri, 18 Aug 2017 04:02:16 +1000
Received: from Deepaks-MacBook-Pro.local ([9.78.194.52])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v7HI2Dvu013826; Fri, 18 Aug 2017 04:02:14 +1000
Subject: Re: Design proposal on removing /org/openbmc/settings/boot_policy"
To: vishwa <vishwa@linux.vnet.ibm.com>, Patrick Williams <patrick@stwcx.xyz>
References: <b820c5bf-3f9c-b59d-97d1-549df44aa1e5@linux.vnet.ibm.com>
 <20170814191811.GD20526@asimov.lan>
 <85a8a445-8445-7beb-0107-5f11e78dda3b@linux.vnet.ibm.com>
 <20170817140246.GA28585@asimov>
 <b5f6893b-ac0b-8437-72c3-58bae8bbc53f@linux.vnet.ibm.com>
 <12950927-32da-00bb-9afa-db6728aedd21@linux.vnet.ibm.com>
 <43a6de62-a99b-bb50-1de3-e932dc27be0f@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Date: Thu, 17 Aug 2017 23:32:14 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:45.0)
 Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <43a6de62-a99b-bb50-1de3-e932dc27be0f@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
x-cbid: 17081718-0048-0000-0000-000002591C94
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17081718-0049-0000-0000-0000480D2432
Message-Id: <6dd5476f-c413-18c0-3d0f-3885f2329176@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-17_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1708170294
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
X-List-Received-Date: Thu, 17 Aug 2017 18:02:26 -0000

On 17/08/17 11:01 pm, vishwa wrote:

> I don't think so we are coding anything here that is tightly bound to
> anything. Host is not making anything PERMANENT based on anything. So if
> something needs to be permanent, it needs to be set by the user. It's
> just that on seeing ONETIME, the host sets the flag to DEFAULT and that
> makes perfect sense since this setting is for the Host and post
> consuming it, the consumer would need to say that its been consumed and
> hence reset to DEFAULT.

The problem with this is, the end-user has to do manage this manually, 
you didn't even need the onetime/permanent this way.

The problem now is, say user sets the boot mode to 'normal' (the 
default), later changes that to 'safe' as a permanent setting - the 
persisted setting now is 'safe'. Later user specifies say 'BIOS' as a 
onetime setting, the host will reset it back to default after 
consumption, and hence the setting would be back at 'normal', because 
the IPMI default can map to a specific d-bus property default. The user 
needs to remember to change it back to 'safe'. The user didn't want the 
default as 'normal'. I know this is how it was before, but this is 
something the BMC should be able to manage instead of asking the user to 
manage.

Your point that the host sets it back to default needn't always apply. 
There's no compulsion for the host to do that. Onetime just means host 
should not persist this setting in it's BIOS.

Regards,
Deepak
