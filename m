Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
X-Greylist: delayed 649 seconds by postgrey-1.36 at bilbo;
 Fri, 15 Dec 2017 04:02:18 AEDT
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yyKcB34JGzDrYp
 for <openbmc@lists.ozlabs.org>; Fri, 15 Dec 2017 04:02:18 +1100 (AEDT)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Dec 2017 08:51:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,400,1508828400"; d="scan'208";a="184198752"
Received: from mauery.jf.intel.com (HELO mauery) ([10.7.150.164])
 by orsmga005.jf.intel.com with ESMTP; 14 Dec 2017 08:51:21 -0800
Date: Thu, 14 Dec 2017 08:51:21 -0800
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Tom Joseph <tomjose@linux.vnet.ibm.com>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 OpenBMC <openbmc@lists.ozlabs.org>, richard.marian.thomaiyar@intel.com
Subject: Re: OpenBMC community telecon - 11/27 Agenda
Message-ID: <20171214165121.GL113334@mauery>
References: <911ECDC1-D1F4-4B4B-8433-CE396C2EEE35@fuzziesquirrel.com>
 <20171205010205.GH113334@mauery> <20171206004931.GI113334@mauery>
 <efd52422-0327-c86d-7810-b98917fba651@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <efd52422-0327-c86d-7810-b98917fba651@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Thu, 14 Dec 2017 17:02:19 -0000

On 14-Dec-2017 07:21 PM, Tom Joseph wrote:
>Hey Vernon,
>
>There are a few points about IPMI User accounts where more details are=20
>needed.
>
>a) IPMI User configuration(password/privilege) is done for a per=20
>channel basis. How do you plan to implement where the same user would=20
>have different passwords/privileges?

Funny you should ask. We just had this conversation internally yesterday=20
morning. I would propose that in this case, phosphor-user-manager would=20
pass this information on to the network ipmi daemon that would handle=20
storing the NV settings for "extra" user settings (because the notion of=20
ipmi users is only used by the network daemon).

>b) IPMI user accounts are mapped to User ID, and all user account=20
>related commands refer to user id to identify an account. I hope we=20
>need to consider that when we design.

Again, the mapping would be done by the network ipmi daemon, which would=20
also limit the number of ipmi users to 15.

>c) User ID 1 account has no user name. Would we support this account?

I would say that IF somebody want to be so careless as to have an=20
anonymous user, they could only use user ID 1 to hold it. But I think=20
that allowing users to set user ID 1 to something else (and thus=20
not following the spec EXACTLY) would be allowed. Really, in 2017,=20
nobody should be using anonymous users anymore. But if they must have=20
one, it would have to be a special case for the unix user -- something=20
like ipmi-anonymous or something.

>d) Can you add API's to map enable/disable IPMI accounts, so that IPMI=20
>user accounts can be enabled/disabled by retaining all other=20
>properties?

Just removing them from the ipmi group should trigger this sort of=20
thing. However, removing a user from the ipmi group should also mark the=20
password as expired to force the user to change it.

--Vernon

>Regards,
>
>Tom
>
>
>On Wednesday 06 December 2017 06:19 AM, Vernon Mauery wrote:
>>On 04-Dec-2017 05:02 PM, Vernon Mauery wrote:
>>>On 04-Dec-2017 05:06 PM, Brad Bishop wrote:
>>>>multi configuration images / runtime configurability
>>>>user management
>>>>secure coding guidelines
>>>>
>>>>=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=
=94=E2=80=94
>>>>Monday, 10:00pm EDT
>>>>888-426-6840
>>>>password: 85891389
>>>
>>>For the discussion on user management.
>>>
>>>Overview:
>>>1. User management is done via PAM.
>>>2. If IPMI is being used, PAM loads the pam_ipmi.so password module.
>>>=C2=A0a. pam_ipmi.so intercepts password changes and saves the password
>>>=C2=A0=C2=A0=C2=A0 for IPMI-enabled users to a file that can be read at =
a later time
>>>=C2=A0=C2=A0=C2=A0 to initiate an RMCP+ session. (encrypted or obfuscate=
d with=20
>>>a=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 per-BMC key so no passwords are written =
directly in flash.)
>>>=C2=A0b. pam_ipmi.so implements a method to decrypt passwords and provide
>>>=C2=A0=C2=A0=C2=A0 them to host-ipmi (for test password command) and net=
-ipmi (for
>>>=C2=A0=C2=A0=C2=A0 session initiation)
>>>3. If a user is not enabled for IPMI, their password will not be saved
>>>=C2=A0in the ipmi database, and thus must be reset if/when that user gai=
ns
>>>=C2=A0IPMI capability.
>>>4. If a user loses IPMI capability, their password is reset to force a
>>>=C2=A0password change so their password is secure again.
>>>5. Capabilities is done via unix groups
>>>=C2=A0a. Groups like ipmi, webserver, redfish, ssh, sol can provide=20
>>>login=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 or 'channel' access.
>>>=C2=A0b. Groups like user-manager, media, power, sensor, etc., can provi=
de
>>>=C2=A0=C2=A0=C2=A0 fine-grained access for various capabilities. Provide=
rs=20
>>>of=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 capabilities should check to see that a=
ccessors (users)=20
>>>have the=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 required permission.
>>>6. Admin-defined 'super-groups'
>>>=C2=A0a. Provide a set of pre-defined groups of capabilities that can be
>>>=C2=A0=C2=A0=C2=A0 assigned to users: Admin, User, Operator or similar t=
hat each have
>>>=C2=A0=C2=A0=C2=A0 groups associated with them.
>>>=C2=A0b. Changes to groups via APIs can make sure that if a user=20
>>>is=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 assigned to a 'super-group' will stay a=
ssigned to the=20
>>>sub-groups
>>>=C2=A0c. Changes made to users via manual commands may override API grou=
ps
>>
>>Items yet to be decided:
>>1. How providers of services export the service/permission pairs so=20
>>the user manager can manage the permission groups.
>>2. How to manage the permissions groups (is there a PAM group mechanism?)
>>3. How to create users (call adduser?)
>>4. Do we force users to have different passwords for RMCP+ and other=20
>>logins because RMCP+ passwords are insecurely stored? Or is this a=20
>>policy thing that we allow system administrators to choose?
>>
>>
>>--Vernon
>>
>>>
>>>Methods:
>>>=C2=A0 1. CREATE_USER
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Privilege-required: USER-MANAGER
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Args:
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UserName - STRING=
 (16 bytes only - else role change to=20
>>>IPMI can't be done)
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Password - Byte A=
rray (Max of 20 bytes if IPMID is chosen. For
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 others can send more bytes=
, but change role=20
>>>to IPMI will
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 request password again und=
er 20 bytes)
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Roles - STRING wi=
th comma separated
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Return:
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SUCCESS ERR_USERN=
AME_EXIST ERR_PASSWORD_FAILS ERR_ROLE_FAILS
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ERR_PASSWORD_ROLE=
_FAIL ERR_NO_RESOURCE ERR_UNKNOWN
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ERR_AUTHORIZATION=
_FAIL
>>>
>>>=C2=A0 2. DELETE_USER
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Privilege-required: USER-MANAGER
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Args:
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UserName - STRING
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Return:
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SUCCESS ERR_USERN=
AME_NOT_EXIST ERR_UNKNOWN=20
>>>ERR_AUTHORIZATION_FAIL
>>>
>>>=C2=A0 3. CHANGE ROLE / CHANGE_PASSWORD (OTHERS)
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Privilege-required: USER-MANAGER
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Args:
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UserName - STRING
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 New Password (if =
changed) - Byte Array
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 New Role (if chan=
ged) - Array of STRING
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Return:
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SUCCESS ERR_USERN=
AME_NOT_EXIST ERR_UNKNOWN=20
>>>ERR_AUTHORIZATION_FAIL
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ERR_PASSWORD_FAIL=
S ERR_PASSWORD_ROLE_FAIL ERR_NO_RESOURCE
>>>
>>>=C2=A0 4. CHANGE_PASSWORD (SELF)
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Privilege-required: Any Valid user
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Args:
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 New Password - By=
te Array
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Return:
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SUCCESS ERR_PASSW=
ORD_FAILS ERR_PASSWORD_ROLE_FAIL ERR_UNKNOWN
>>>
>>>=C2=A0 5. LIST_USER_DETAILS
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Privilege-required: USER-MANAGER
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Args:
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Return:
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Array of:
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 USER_NAME (String)
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ROLES (String)
>>>
>>>Signals:
>>>=C2=A0 1. UPDATED_USER_SIGNAL
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Args:
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UserName of updat=
ed user
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UpdateType:
>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Role changed / User Deleted / User created /=20
>>>Password Changed etc.
>>>
>>
>
