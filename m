Return-Path: <richard.marian.thomaiyar@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 420Cgt1KH7zDrVP
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 01:42:49 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Aug 2018 08:42:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,299,1531810800"; d="scan'208";a="258747044"
Received: from rthomaiy-mobl2.gar.corp.intel.com (HELO [10.252.91.225])
 ([10.252.91.225])
 by fmsmga006.fm.intel.com with ESMTP; 28 Aug 2018 08:42:43 -0700
Subject: Re: Mapping LDAP group to user roles
To: Tom Joseph <tomjose@linux.vnet.ibm.com>, "Tanous, Ed"
 <ed.tanous@intel.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <1b935f90-dba3-ba95-f6b1-d8d2ff186ee7@linux.vnet.ibm.com>
 <7E9441B1E5EFFD4681F54958E821699345832E4D@ORSMSX114.amr.corp.intel.com>
 <2d7b2647-cc0a-bcaf-c1fa-d6da05769502@linux.vnet.ibm.com>
 <7E9441B1E5EFFD4681F54958E821699345834D5D@ORSMSX114.amr.corp.intel.com>
 <1ab96997-92ac-87fb-7d45-795d5747e4aa@linux.vnet.ibm.com>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <7b6b2198-4725-e487-12ad-bf18cb4297b5@linux.intel.com>
Date: Tue, 28 Aug 2018 21:12:41 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1ab96997-92ac-87fb-7d45-795d5747e4aa@linux.vnet.ibm.com>
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
X-List-Received-Date: Tue, 28 Aug 2018 15:42:50 -0000

Ed / Brad / Tom / Ratan,

1. REDFISH can't manage LDAP user accounts. i.e. It will be beyond the 
scope of REDFISH and won't list any LDAP user accounts (REDFISH can 
implement LDAP privilege mapping configuration though)  --> Agree?

2. Authentication must happen only using pam_authenticate (For security 
purpose), and for authorization can use

                 a). getgrnam_r to get the group & privilege

                 b). use D-Bus API get property to get the group & 
privilege role of the user

                 c). Maintain 1:1 mapping with application through 
signal handler to do user sync, which can be used directly (IPMI Code 
under review does this logic).

     Problem with option #a is it requires individual way to map group & 
privilege, hence it was not recommended, and suggestion was to use #b or 
#c. But with ldap user accounts #b & #c can't be used as there is no 
local user object and hence thinking about introducing a generic D-Bus 
API (under Manager) to return user Info say GetUserInfo --> which 
accepts user name as argument, and returns back groups & privilege of 
the user (irrespective of whether the user is local / ldap), in this way 
applications doesn't need to use different flow to query ldap / local 
user account information and can use one single flow?

Note: This method must be implemented, so that it can internally use the 
LDAP privilege mapper config to determine the privilege that has to be 
applied to user, and can pass supported groups as ssh, redfish & web (or 
can implement ldapGroupMapper too if needed).

Any thoughts about this flow?

Regards,

Richard


On 8/28/2018 8:25 PM, Tom Joseph wrote:
>
> On Thursday 23 August 2018 09:59 PM, Tanous, Ed wrote:
>>>> It would be great if you could document your proposal as a patch to 
>>>> the
>>> existing user management document here:
>>>> https://github.com/openbmc/docs/blob/master/user_management.md
>>> https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/12091/
>> This is a great start, but a lot of detail seems to be missing. You 
>> don't mention anything of the two user roles you mentioned in your 
>> original email.  Has that changed?  I don't see any mention of the 
>> dbus interface, has that changed?  I don't see that you've modified 
>> any of the login flows in the document, but the LDAP section talks 
>> about authorizing users via DBus, which certainly should include 
>> changes to the flow diagrams.
> Thanks Ed for the feedback. The D-Bus interface is updated to support 
> all the privilege roles supported by OpenBMC. The document ha sonly 
> the user creation flows. Richard mentioned he has the login flows 
> updated in the downstream and he will upstream it. So I will update 
> the authorization flow on top of  that.
>
> Documentation:
> https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/12091/
>
> D-Bus Interface:
> https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-dbus-interfaces/+/12027/ 
>
>> It would be great if you could take another pass at this, and see if 
>> you could add a little more detail to your proposal.
>>
>> Thanks,
>>
>> -Ed
>
