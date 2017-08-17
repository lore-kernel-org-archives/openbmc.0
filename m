Return-Path: <dkodihal@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xY1MK4LTQzDqMc
 for <openbmc@lists.ozlabs.org>; Thu, 17 Aug 2017 19:37:01 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7H9arJT082247
 for <openbmc@lists.ozlabs.org>; Thu, 17 Aug 2017 05:36:59 -0400
Received: from e23smtp04.au.ibm.com (e23smtp04.au.ibm.com [202.81.31.146])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ccykcydpn-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 17 Aug 2017 05:36:59 -0400
Received: from localhost
 by e23smtp04.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Thu, 17 Aug 2017 19:36:56 +1000
Received: from d23relay08.au.ibm.com (202.81.31.227)
 by e23smtp04.au.ibm.com (202.81.31.210) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 17 Aug 2017 19:36:52 +1000
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
 by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7H9aqR642729682
 for <openbmc@lists.ozlabs.org>; Thu, 17 Aug 2017 19:36:52 +1000
Received: from d23av04.au.ibm.com (localhost [127.0.0.1])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v7H9aphB016290
 for <openbmc@lists.ozlabs.org>; Thu, 17 Aug 2017 19:36:51 +1000
Received: from Deepaks-MacBook-Pro.local ([9.79.243.179])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v7H9amdR016072; Thu, 17 Aug 2017 19:36:49 +1000
Subject: Re: Design proposal on removing /org/openbmc/settings/boot_policy"
To: Patrick Williams <patrick@stwcx.xyz>, vishwa <vishwa@linux.vnet.ibm.com>
References: <b820c5bf-3f9c-b59d-97d1-549df44aa1e5@linux.vnet.ibm.com>
 <20170814191811.GD20526@asimov.lan>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Date: Thu, 17 Aug 2017 15:06:47 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:45.0)
 Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170814191811.GD20526@asimov.lan>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
x-cbid: 17081709-0012-0000-0000-00000259A3CB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17081709-0013-0000-0000-000007753D55
Message-Id: <85a8a445-8445-7beb-0107-5f11e78dda3b@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-17_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1708170159
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
X-List-Received-Date: Thu, 17 Aug 2017 09:37:02 -0000

On 15/08/17 12:48 am, Patrick Williams wrote:
> On Thu, Aug 03, 2017 at 04:55:21PM +0530, vishwa wrote:
>> Now, the proposal is to remove
>> '"/org/openbmc/settings/host0:boot_policy"' and then put this as a
>> boolean into 'persist' property into:
>>
>> /xyz/openbmc_project/Control/Boot/Mode and
>> /xyz/openbmc_project/Control/Boot/Source.
>
> I understand we have two different interfaces for these two different
> properties but do we want them on a single object path?  It seems like
> having multiple properties on /xyz/.../control/hostN/boot would be
> better, but this will preclude using the same property name in both
> interfaces.

The settings app creates distinct objects 
(https://github.com/openbmc/openbmc/blob/master/meta-phosphor/common/recipes-phosphor/settings/phosphor-settings-defaults/defaults.yaml). 
One of the reasons for doing this was that it is possible to enable or 
disable settings not applicable to a system. If the thought is that 
these settings (mode and source) will always co-exist, we can have one 
object, although the settings app today has a limitation that it assumes 
each settings object implements a single settings interface, so that 
would need to change.

>> IPMID would then look at this new boolean to see if its ONETIME (
>> boolean : 0 ) or PERMANENT ( boolean : 1 ) and respond to Get-Boot-Options.
>
> Why are we not instead creating two objects?  This proposal creates a
> bit of undefined behavior in my mind:
>
> 1. Since only one dbus property ca be updated at a time, which order is
> the user suppose to update?

Why would the order matter to the user?

> 2. What happens when the property is ONETIME (false), the value of Mode
> itself is changed, and then the property is changed to PERMANENT (true)?
> Does this restore the old value persisted or does it now persist the
> previous ONETIME value?

The changed value of the Mode property is persisted.

> 3. As a user, how can I identify what the PERMANENT value is if someone
> has temporarily done a ONETIME?  I have to wait until the ONETIME is
> consumed?

Yes, and the settings app doesn't do anything today to restore the 
permanent value.

> It seems like having an optional, perhaps dynamically create, second
> object to separate PERMANENT and ONETIME would take care of this,
> wouldn't it?  Is there a reason you did not want to have two settings
> objects to represent this?

What I've understood from Vishwa is that what's happening with 
host-ipmid is, the host consumes the ONETIME setting and then restores a 
value to be used as PERMANENT and also sets the policy as PERMANENT. The 
settings application at the moment has no logic to specially handle 
ONETIME vs PERMANENT. It's based on the assumption that a user will 
consume the ONETIME setting, and then that (or possibly another) user 
will restore the PERMANENT setting.

Regards,
Deepak
