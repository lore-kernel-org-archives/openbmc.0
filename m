Return-Path: <richard.marian.thomaiyar@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 420sdm0Fl8zF324
 for <openbmc@lists.ozlabs.org>; Thu, 30 Aug 2018 03:13:15 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Aug 2018 10:13:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,303,1531810800"; d="scan'208";a="70077732"
Received: from rthomaiy-mobl2.gar.corp.intel.com (HELO [10.252.76.226])
 ([10.252.76.226])
 by orsmga006.jf.intel.com with ESMTP; 29 Aug 2018 10:13:11 -0700
Subject: Re: Mapping LDAP group to user roles
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>,
 Tom Joseph <tomjose@linux.vnet.ibm.com>, "Tanous, Ed" <ed.tanous@intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <1b935f90-dba3-ba95-f6b1-d8d2ff186ee7@linux.vnet.ibm.com>
 <7E9441B1E5EFFD4681F54958E821699345832E4D@ORSMSX114.amr.corp.intel.com>
 <2d7b2647-cc0a-bcaf-c1fa-d6da05769502@linux.vnet.ibm.com>
 <7E9441B1E5EFFD4681F54958E821699345834D5D@ORSMSX114.amr.corp.intel.com>
 <1ab96997-92ac-87fb-7d45-795d5747e4aa@linux.vnet.ibm.com>
 <7b6b2198-4725-e487-12ad-bf18cb4297b5@linux.intel.com>
 <bc4cac08-01d8-4dda-1c24-b624f241a4fc@linux.vnet.ibm.com>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <93961b3b-9ec5-396b-7c25-02dfaae8c3e8@linux.intel.com>
Date: Wed, 29 Aug 2018 22:43:10 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <bc4cac08-01d8-4dda-1c24-b624f241a4fc@linux.vnet.ibm.com>
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
X-List-Received-Date: Wed, 29 Aug 2018 17:13:16 -0000



On 8/29/2018 5:21 PM, Ratan Gupta wrote:
> Hi Richard,
>
> On Tuesday 28 August 2018 09:12 PM, Thomaiyar, Richard Marian wrote:
>> Ed / Brad / Tom / Ratan,
>>
>> 1. REDFISH can't manage LDAP user accounts. i.e. It will be beyond 
>> the scope of REDFISH and won't list any LDAP user accounts (REDFISH 
>> can implement LDAP privilege mapping configuration though)  --> Agree?
> I agree on it.
Had a discussion with Ed, and Ed agrees about the problem of listing all 
the LDAP user accounts. At the same time, he is thinking about listing 
out the Logged in LDAP user accounts?
Another interesting question which he raised was, how we are going to 
track this user in the security login logs, so that we will be able to 
trace back on which user performed what action?
(I have not yet investigated how to do this, but thought to share, so 
that you can also think about this).
>>
>> 2. Authentication must happen only using pam_authenticate (For 
>> security purpose), and for authorization can use
>>
>>                 a). getgrnam_r to get the group & privilege
>>
>>                 b). use D-Bus API get property to get the group & 
>> privilege role of the user
>>
>>                 c). Maintain 1:1 mapping with application through 
>> signal handler to do user sync, which can be used directly (IPMI Code 
>> under review does this logic).
>>
>>     Problem with option #a is it requires individual way to map group 
>> & privilege, hence it was not recommended, and suggestion was to use 
>> #b or #c. But with ldap user accounts #b & #c can't be used as there 
>> is no local user object and hence thinking about introducing a 
>> generic D-Bus API (under Manager) to return user Info say GetUserInfo 
>> --> which accepts user name as argument, and returns back groups & 
>> privilege of the user (irrespective of whether the user is local / 
>> ldap), in this way applications doesn't need to use different flow to 
>> query ldap / local user account information and can use one single flow?
> If I am getting it correctly that you proposed that implementation 
> logic of getting the roles of user in the user manager interface by 
> introducing the D-bus Method getUserInfo().
>
> The flow for the getUserInfo() would be as follows
>
> 1) Check that the user is local and if local then get the role from 
> the local user D-bus object.
>
> 2) if user is not local user(ldap user) then get the role through the 
> group -- Role mapping.
>        a) getgrnam_r will get the ldap user group name as the libc 
> would be using the libnss_ldap
>        b) once we have the group name then we can get the priviledge 
> role for that ldap user via the D-bus API.
>
> I agree with this proposal to put this logic inside the app which 
> implements the manager interface.
>
> I am wondering what the getUserInfo API would return as part of user 
> info, Would it be
>
> 1) Group Name
> 2) Privilege
>
> Should we include the UserEnabled and the UserAccountLockedState as 
> part of user info? would it be useful?
> I am asking as if user password has been expired or account locked or 
> new password required would have been handled through pam account
> management which is part of authentication.
>
I am not sure, whether we will be able to get the userEnabled and 
UserAccountLockedState from LDAP server, but if we are able to then i 
think we can list down those too. (along with one more param, as ldap / 
local user).
Also, Do you thought about how to determine whether the user is ldap / 
local ?  1. Are we going to check the <domain>/<username> as ldap ? 2. 
Any account which succeeds in pam_authenticate, and not in local user 
database is ldap user?
> What is your view on this?
>
>
> Are you planning to implement the above D-bus api(GetUserInfo) or can 
> we help here?
I am fine with either way, but my first priority is to merge existing 
code (clear out the backlog).

Regards,
Richard
>>
>> Note: This method must be implemented, so that it can internally use 
>> the LDAP privilege mapper config to determine the privilege that has 
>> to be applied to user, and can pass supported groups as ssh, redfish 
>> & web (or can implement ldapGroupMapper too if needed).
>>
>> Any thoughts about this flow?
>>
>> Regards,
>>
>> Richard
>>
>>
>> On 8/28/2018 8:25 PM, Tom Joseph wrote:
>>>
>>> On Thursday 23 August 2018 09:59 PM, Tanous, Ed wrote:
>>>>>> It would be great if you could document your proposal as a patch 
>>>>>> to the
>>>>> existing user management document here:
>>>>>> https://github.com/openbmc/docs/blob/master/user_management.md
>>>>> https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/12091/
>>>> This is a great start, but a lot of detail seems to be missing. You 
>>>> don't mention anything of the two user roles you mentioned in your 
>>>> original email.  Has that changed?  I don't see any mention of the 
>>>> dbus interface, has that changed?  I don't see that you've modified 
>>>> any of the login flows in the document, but the LDAP section talks 
>>>> about authorizing users via DBus, which certainly should include 
>>>> changes to the flow diagrams.
>>> Thanks Ed for the feedback. The D-Bus interface is updated to 
>>> support all the privilege roles supported by OpenBMC. The document 
>>> ha sonly the user creation flows. Richard mentioned he has the login 
>>> flows updated in the downstream and he will upstream it. So I will 
>>> update the authorization flow on top of that.
>>>
>>> Documentation:
>>> https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/12091/
>>>
>>> D-Bus Interface:
>>> https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-dbus-interfaces/+/12027/ 
>>>
>>>> It would be great if you could take another pass at this, and see 
>>>> if you could add a little more detail to your proposal.
>>>>
>>>> Thanks,
>>>>
>>>> -Ed
>>>
>>
>
