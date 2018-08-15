Return-Path: <richard.marian.thomaiyar@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41qyw83h5KzF1RN
 for <openbmc@lists.ozlabs.org>; Wed, 15 Aug 2018 15:39:51 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Aug 2018 22:39:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,241,1531810800"; d="scan'208";a="224751864"
Received: from rthomaiy-mobl2.gar.corp.intel.com (HELO [10.252.91.155])
 ([10.252.91.155])
 by orsmga004.jf.intel.com with ESMTP; 14 Aug 2018 22:39:45 -0700
Subject: Re: Disable Local Users Proposal
To: Matt Spinler <mspinler@linux.vnet.ibm.com>
Cc: Ratan Gupta <ratagupt@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
References: <47cb0391a568d16cbdc0345893eeb282@linux.vnet.ibm.com>
 <3f6ddc8e-17a9-41cb-9478-e3d4fc66b9af@linux.vnet.ibm.com>
 <1b46768ae45e718f5000801222996318@linux.vnet.ibm.com>
 <dc6ce171-7750-5a44-c805-a64626e3c207@linux.intel.com>
 <2340763be6ade5ae096367b6d18e8114@linux.vnet.ibm.com>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <1337fd9f-16c9-6eb4-9569-2a3832f0315e@linux.intel.com>
Date: Wed, 15 Aug 2018 11:09:44 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <2340763be6ade5ae096367b6d18e8114@linux.vnet.ibm.com>
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
X-List-Received-Date: Wed, 15 Aug 2018 05:39:53 -0000



On 8/15/2018 12:40 AM, Matt Spinler wrote:
> Hi Richard,
>
>
> On 2018-08-14 12:48, Thomaiyar, Richard Marian wrote:
>> Hi Matt,
>>
>> I am not sure, whether you want to permanently disable local accounts
>> or only make it in a configurable way ?
>
> We need to let this be done on premise, and not have it baked into an 
> image.
>
>>
>> In order to disable the root user login, have you tried password
>> expiry logic (D-bus interface API provides option to disable the user,
>> which relies on this), which can be set in the /etc/shadow file during
>> compilation itself. Won't this fix your problem instead of removing
>> the pam modules ?
>
> See below
>
>
>  In case if your requirement is to disable it
>> permanently to avoid user creation etc, then user D-Bus interfaces
>> should not be implemented(i.e it should never be exposed). (Also what
>> about serial port login ? by default it will land up  in shell or
>> will be disabled for local accounts here too ?).
>
> We want to disable serial port login too, which this method does, and 
> I assume
> expiring the account does as well.
>
>>
>> Related to the D-Bus interfaces to disable the local accounts (under
>> review), i am not sure, how it is going to be different than disabling
>> each user ?
>
> Just that you weren't creating an object for the root account, or any 
> other
> system accounts, which we also need to disable.  Can you see a design in
> which your code would also create objects for those too, and not allow
> new users to be created if we were in this disabled mode?
I will be pushing next patch, which will be listing root accounts too. 
But as i said, if it has to be disabled by default, then it can be done 
in /etc/shadow
In this scenario --> root / or any user accounts in /etc/passwd file 
will be listed, and accordingly will be marked as disabled (if it is so 
in /etc/shadow).
>
>
>> Because even this property can be set to TRUE and then
>> users can be created / configured right ?
>
> I believe this case involves LDAP users with either write or read-only
> access, and if one with write access wants to enable local users again,
> that is OK as far as we are concerned.  But otherwise, they don't want
> to have to deal with changing BMC passwords every X number of days
> which they'd have to do with local accounts and their IT policies.
>
if disabled in /etc/shadow, then no local user accounts can be used to 
login.
The only way new user can be created is, if LDAP login is allowed to 
have administrative privilege to manage the user accounts or Host to 
IPMI communication to create accounts (I believe that this is the 
configuration
which you want to support right? then i don't find a reason why we need 
a global disable property. Because that property has to be configured in 
both the cases right?).

Regards,
Richard
>
>
>>
>> Regards,
>> Richard
>>
>> On 8/14/2018 8:56 PM, Matt Spinler wrote:
>>> On 2018-08-13 03:21, Ratan Gupta wrote:
>>>> Hi Matt,
>>>>
>>>> Please find my comments inline
>>>>
>>>> Ratan
>>>>
>>>>
>>>>
>>>> On Saturday 11 August 2018 02:57 AM, Matt Spinler wrote:
>>>>> Hi,
>>>>>
>>>>> We have a requirement to disable all local accounts on the BMC,
>>>>> including root, so the only logins allowed would be via LDAP 
>>>>> authenticated
>>>>> accounts.
>>>>>
>>>>> It was recommended that I do this by removing the pam_unix module 
>>>>> from
>>>>> /etc/pam.d/common-auth and/or common-account(I think?), and also 
>>>>> remove
>>>>> ~/.ssh/authorized_keys if present.
>>>> By removing the authorized_keys means if somebody have uploaded their
>>>> keys to enable the password
>>>> less login.
>>>> so by doing so we are removing that possibility.Is it correct or is
>>>> there some other intent?
>>>
>>> It would disable them when the property is set, but then I guess other
>>> users could add them again.  Not sure what else I could do here.
>>>
>>>>>
>>>>> I see that the upcoming user manager code in
>>>>> https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-user-manager/+/10112/ 
>>>>> doesn't deal with system accounts, which we also need to disable, 
>>>>> so my proposal
>>>>> is to add an 'AllLocalAccountsDisabled' property to 
>>>>> xyz.openbmc_projects.Users.Manager
>>>>> to do the disable/reenable by modifying the PAM files.
>>>>>
>>>>> I'm thinking this would be independent of the UserEnabled property 
>>>>> in the
>>>>> Users.Attributes interface, though I could also do the 
>>>>> UserEnabled(false)
>>>>> on all existing users and disallow anyone from setting to true.
>>>> I agree with you on introducing other property
>>>> "AllLocalAccountsDisabled" but we should
>>>> be consistent that each individual user status should also show its
>>>> status as disabled.
>>>> it should not be that if admin does enumerate on the users namespace
>>>> then manager
>>>> interface shows that AllLocalAccountsDisabled is true but each
>>>> individual user property show the
>>>> userEnabled as true.
>>>
>>>
>>> Yea, good point.  Will make them agree.
>>>
>>> I put up the D-Bus interface at
>>> https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-dbus-interfaces/+/11934/ 
>>>
>>>>>
>>>>> There seems to be a bug in the REST server right now that still 
>>>>> allows REST
>>>>> access with a root login with root disabled, so that would need to 
>>>>> be fixed,
>>>>> but eventually one could still use LDAP authenticated users to 
>>>>> make REST calls.
>>>>>
>>>>> This would not affect IPMI.
>>>>>
>>>>> Comments/ideas welcome
>>>>>
>>>>> Matt
>>>>>
>>>
>
