Return-Path: <richard.marian.thomaiyar@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41qg8025DkzF1R0
 for <openbmc@lists.ozlabs.org>; Wed, 15 Aug 2018 03:49:03 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Aug 2018 10:48:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,239,1531810800"; d="scan'208";a="224616610"
Received: from rthomaiy-mobl2.gar.corp.intel.com (HELO [10.252.91.155])
 ([10.252.91.155])
 by orsmga004.jf.intel.com with ESMTP; 14 Aug 2018 10:48:50 -0700
Subject: Re: Disable Local Users Proposal
To: Matt Spinler <mspinler@linux.vnet.ibm.com>,
 Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org
References: <47cb0391a568d16cbdc0345893eeb282@linux.vnet.ibm.com>
 <3f6ddc8e-17a9-41cb-9478-e3d4fc66b9af@linux.vnet.ibm.com>
 <1b46768ae45e718f5000801222996318@linux.vnet.ibm.com>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <dc6ce171-7750-5a44-c805-a64626e3c207@linux.intel.com>
Date: Tue, 14 Aug 2018 23:18:46 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1b46768ae45e718f5000801222996318@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Aug 2018 17:49:05 -0000

Hi Matt,

I am not sure, whether you want to permanently disable local accounts or 
only make it in a configurable way ?

In order to disable the root user login, have you tried password expiry 
logic (D-bus interface API provides option to disable the user, which 
relies on this), which can be set in the /etc/shadow file during 
compilation itself. Won't this fix your problem instead of removing the 
pam modules ? In case if your requirement is to disable it permanently 
to avoid user creation etc, then user D-Bus interfaces should not be 
implemented(i.e it should never be exposed). (Also what about serial 
port login ? by default it will land up  in shell or will be disabled 
for local accounts here too ?).

Related to the D-Bus interfaces to disable the local accounts (under 
review), i am not sure, how it is going to be different than disabling 
each user ? Because even this property can be set to TRUE and then users 
can be created / configured right ?

Regards,
Richard

On 8/14/2018 8:56 PM, Matt Spinler wrote:
> On 2018-08-13 03:21, Ratan Gupta wrote:
>> Hi Matt,
>>
>> Please find my comments inline
>>
>> Ratan
>>
>>
>>
>> On Saturday 11 August 2018 02:57 AM, Matt Spinler wrote:
>>> Hi,
>>>
>>> We have a requirement to disable all local accounts on the BMC,
>>> including root, so the only logins allowed would be via LDAP 
>>> authenticated
>>> accounts.
>>>
>>> It was recommended that I do this by removing the pam_unix module from
>>> /etc/pam.d/common-auth and/or common-account(I think?), and also remove
>>> ~/.ssh/authorized_keys if present.
>> By removing the authorized_keys means if somebody have uploaded their
>> keys to enable the password
>> less login.
>> so by doing so we are removing that possibility.Is it correct or is
>> there some other intent?
>
> It would disable them when the property is set, but then I guess other
> users could add them again.  Not sure what else I could do here.
>
>>>
>>> I see that the upcoming user manager code in
>>> https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-user-manager/+/10112/ 
>>> doesn't deal with system accounts, which we also need to disable, so 
>>> my proposal
>>> is to add an 'AllLocalAccountsDisabled' property to 
>>> xyz.openbmc_projects.Users.Manager
>>> to do the disable/reenable by modifying the PAM files.
>>>
>>> I'm thinking this would be independent of the UserEnabled property 
>>> in the
>>> Users.Attributes interface, though I could also do the 
>>> UserEnabled(false)
>>> on all existing users and disallow anyone from setting to true.
>> I agree with you on introducing other property
>> "AllLocalAccountsDisabled" but we should
>> be consistent that each individual user status should also show its
>> status as disabled.
>> it should not be that if admin does enumerate on the users namespace
>> then manager
>> interface shows that AllLocalAccountsDisabled is true but each
>> individual user property show the
>> userEnabled as true.
>
>
> Yea, good point.  Will make them agree.
>
> I put up the D-Bus interface at
> https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-dbus-interfaces/+/11934/ 
>
>
>
>>>
>>> There seems to be a bug in the REST server right now that still 
>>> allows REST
>>> access with a root login with root disabled, so that would need to 
>>> be fixed,
>>> but eventually one could still use LDAP authenticated users to make 
>>> REST calls.
>>>
>>> This would not affect IPMI.
>>>
>>> Comments/ideas welcome
>>>
>>> Matt
>>>
>
