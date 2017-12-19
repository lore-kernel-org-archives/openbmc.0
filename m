Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z0zP918BLzDsS6
 for <openbmc@lists.ozlabs.org>; Tue, 19 Dec 2017 11:31:56 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 7573E975BB;
 Mon, 18 Dec 2017 19:31:50 -0500 (EST)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: OpenBMC community telecon - 11/27 Agenda
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <20171218223918.GO113334@mauery>
Date: Mon, 18 Dec 2017 19:31:50 -0500
Cc: OpenBMC <openbmc@lists.ozlabs.org>,
 Richard Marian Thomaiyar <richard.marian.thomaiyar@linux.intel.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <16113B02-7098-4523-A84A-E4CAFFB145A5@fuzziesquirrel.com>
References: <911ECDC1-D1F4-4B4B-8433-CE396C2EEE35@fuzziesquirrel.com>
 <20171205010205.GH113334@mauery>
 <1513620424.5787.47.camel@fuzziesquirrel.com>
 <20171218223918.GO113334@mauery>
To: Vernon Mauery <vernon.mauery@linux.intel.com>
X-Mailer: Apple Mail (2.3273)
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
X-List-Received-Date: Tue, 19 Dec 2017 00:31:57 -0000


> On Dec 18, 2017, at 5:39 PM, Vernon Mauery =
<vernon.mauery@linux.intel.com> wrote:
>=20
> On 18-Dec-2017 01:07 PM, Brad Bishop wrote:
>> On Mon, 2017-12-04 at 17:02 -0800, Vernon Mauery wrote:
>>=20
>> Hi Vernon
>>=20
>> Really appreciate you putting this together - thanks.  I do have a
>> couple comments/questions.
>>=20
>>>=20
>>> For the discussion on user management.
>>>=20
>>> Overview:
>>> 1. User management is done via PAM.
>>=20
>> Are there any aspects of user management that are done outside of =
PAM?
>=20
> Yes. It turns out that IPMI management with multiple LAN channels =
throws a wrench in things, so it may be that IPMI need to do some of its =
user management separately (like determining what privileges a user gets =
on a particular channel).

Could creating a group per channel on the BMC at runtime make this
simpler?

> There may be other stuff like this, so it might be helpful to define a =
'hook' or something that says if a user is a member of group X, you must =
notify group X when you want to change stuff.
>=20
>> I only ask this because your writeup feels like a good start on a
>> README somewhere.  To that end, would it make sense to frame this =
from
>> the perspective of different actors attempting to add function?  For
>> example:
>>=20
>> If you want to implement a service that authenticates a user:
>>  - do v
>>  - do w
>>=20
>> If you want to implement a service that adds users to a user =
database:
>>  - do x
>>=20
>> If you want to implement a service that adds users to a group:
>>  - do y
>>=20
>> If you want to implement a service that authorizes a user:
>>  - do z
>>=20
>> etc, and then the IPMI specifics would just be adhering to this
>> framework.
>>=20
>> I could have these bullet points all wrong.  This was just meant as a
>> straw-man for a more general document that can guide people looking =
to
>> add this type of function later.
>=20
> Yes, this sort of writeup as a README would be a good idea. Not just =
an API, but a practical usage guide.
>=20
>>> 2. If IPMI is being used, PAM loads the pam_ipmi.so password module.
>>>   a. pam_ipmi.so intercepts password changes and saves the password
>>>      for IPMI-enabled users to a file that can be read at a later
>>> time
>>>      to initiate an RMCP+ session. (encrypted or obfuscated with a
>>>      per-BMC key so no passwords are written directly in flash.)
>>>   b. pam_ipmi.so implements a method to decrypt passwords and
>>> provide
>>>      them to host-ipmi (for test password command) and net-ipmi (for
>>>      session initiation)
>>> 3. If a user is not enabled for IPMI, their password will not be
>>> saved
>>>   in the ipmi database, and thus must be reset if/when that user
>>> gains
>>>   IPMI capability.
>>> 4. If a user loses IPMI capability, their password is reset to force
>>> a
>>>   password change so their password is secure again.
>>=20
>> I'm not understanding why this is needed.  Couldn't we simply remove
>> the password entry from the IPMI backend when the group membership
>> changes?  Is this an artifact of how PAM works or do we think we need
>> it for a more fundamental reason?
>=20
> If the password is ever saved in the IPMI password database, it is =
best to assume it is no longer a secret. If you really want your =
password secure, it should be changed.

ok.

>=20
>>> 5. Capabilities is done via unix groups
>>>   a. Groups like ipmi, webserver, redfish, ssh, sol can provide
>>> login
>>>      or 'channel' access.
>>=20
>> I wonder if a per-channel (or service in PAM speak?) pam_listfile
>> account entry can get us here.
>=20
> Sure, that could be a pattern we follow. I would have to dig deeper to =
see if it buys us anything that plain-old unix groups would not provide.
>=20
>>>   b. Groups like user-manager, media, power, sensor, etc., can
>>> provide
>>>      fine-grained access for various capabilities. Providers of
>>>      capabilities should check to see that accessors (users) have
>>> the
>>>      required permission.
>>=20
>> pam_listfile might work here too, only this would global across all =
PAM
>> services?
>=20
> Once again, I am not entirely sure what this would buy over just using =
unix groups. We need to walk through some more usage scenarios like you =
have above.
>=20

I wasn=E2=80=99t intending to propose something extra - this was just =
the
result of my brief research on how to authorize users based on group
membership with PAM.

I=E2=80=99ve never written any programs that use PAM so I could be way =
off
in the weeds here.  I guess my question would be what other way can
we do it?


>>> 6. Admin-defined 'super-groups'
>>>   a. Provide a set of pre-defined groups of capabilities that can be
>>>      assigned to users: Admin, User, Operator or similar that each
>>> have
>>>      groups associated with them.
>>=20
>> Do we intend to also allow the contained subgroups to be
>> changed/configured for the on the BMC dynamically?  For example could
>> you remove the 'sensor' group from the Operator group (assuming that =
by
>> default sensor group is included in the Operator group).
>=20
> Ideally, yes, a system admin could change what capabilities each group =
allowed (like removing sensor capabilities from the Operator group), but =
to start with, just having a way to define the defaults at built time =
would be a good target.
>=20
>>>   b. Changes to groups via APIs can make sure that if a user is
>>>      assigned to a 'super-group' will stay assigned to the sub-
>>> groups
>>>   c. Changes made to users via manual commands may override API
>>> groups
>>=20
>> This all seemed pretty straightforward until I got to #6.  It seems
>> like it is definitely required but I'm wondering if it could be =
staged
>> in later somehow?
>=20
> Yes. Let's just start with defining a way to define defaults. This =
should be done using a yocto mechanism that allows developers of openbmc =
to override at build time (maybe on a platform basis?). This makes the =
original defaults less important (so not all of the contributors need to =
fully agree on what constitutes reasonable defaults).

Sounds good.  Lets say you have an operator group on platform X with
sensors and an operator group on platform Y without sensors.  How would
you authorize the user?

>=20
>>>=20
>>>=20
>>> Methods:
>>=20
>> Do we need similar APIs for groups?
>=20
> Likely. But to start with, maybe we can skip that part. To start with, =
the list of groups (and their associated capabilities) will be fixed at =
build time.

Sounds good.

>=20
>>>    1. CREATE_USER
>>>        Privilege-required: USER-MANAGER
>>>        Args:
>>>            UserName - STRING (16 bytes only - else role change to
>>> IPMI can't be done)
>>>            Password - Byte Array (Max of 20 bytes if IPMID is
>>> chosen. For
>>>                       others can send more bytes, but change role to
>>> IPMI will
>>>                       request password again under 20 bytes)
>>>            Roles - STRING with comma separated
>>>        Return:
>>>            SUCCESS ERR_USERNAME_EXIST ERR_PASSWORD_FAILS
>>> ERR_ROLE_FAILS
>>>            ERR_PASSWORD_ROLE_FAIL ERR_NO_RESOURCE ERR_UNKNOWN
>>>            ERR_AUTHORIZATION_FAIL
>>>=20
>>>    2. DELETE_USER
>>>        Privilege-required: USER-MANAGER
>>>        Args:
>>>            UserName - STRING
>>>        Return:
>>>            SUCCESS ERR_USERNAME_NOT_EXIST ERR_UNKNOWN
>>> ERR_AUTHORIZATION_FAIL
>>=20
>> Can we use the xyz.openbmc_project.Object.Delete interface for this?
>> The thinking was that a common Delete interface might make DBus<->UI
>> implementations easier.  This is the same motivation behind asking =
for
>> the org.freedesktop interfaces below.
>=20
> I am fine with using generic interfaces as long as they fit the bill. =
Deleting a user seems like it should be straight-forward enough that =
this would work well.
>=20
>>>=20
>>>    3. CHANGE ROLE / CHANGE_PASSWORD (OTHERS)
>>>        Privilege-required: USER-MANAGER
>>>        Args:
>>>            UserName - STRING
>>>            New Password (if changed) - Byte Array
>>>            New Role (if changed) - Array of STRING
>>>        Return:
>>>            SUCCESS ERR_USERNAME_NOT_EXIST ERR_UNKNOWN
>>> ERR_AUTHORIZATION_FAIL
>>>            ERR_PASSWORD_FAILS ERR_PASSWORD_ROLE_FAIL ERR_NO_RESOURCE
>>>=20
>>=20
>> I thought the intent was to strictly use PAM for this.  In what
>> scenario do we need a DBus API for this?
>=20
> For managing groups, this will have to be done outside of PAM. PAM =
doesn't know how to change /etc/group. So we will have to provide some =
central mechanism (probably in the phosphor-user-manager) to host the =
group management API.
>=20
>>>    4. CHANGE_PASSWORD (SELF)
>>>        Privilege-required: Any Valid user
>>>        Args:
>>>            New Password - Byte Array
>>>        Return:
>>>            SUCCESS ERR_PASSWORD_FAILS ERR_PASSWORD_ROLE_FAIL
>>> ERR_UNKNOWN
>>=20
>> Same question as #3.
>=20
> You are right. Passwords should not go over DBus. Things that change =
passwords should use PAM directly.
>=20
>>>=20
>>>    5. LIST_USER_DETAILS
>>>        Privilege-required: USER-MANAGER
>>>        Args:
>>>            NULL
>>>        Return:
>>>            Array of:
>>>                USER_NAME (String)
>>>                ROLES (String)
>>=20
>> Could we use org.freedesktop.DBus.ObjectManager.GetManagedObjects for
>> this?
>=20
> Yes.
>=20
>>>=20
>>> Signals:
>>>    1. UPDATED_USER_SIGNAL
>>>        Args:
>>>            UserName of updated user
>>>            UpdateType:
>>>                Role changed / User Deleted / User created / Password
>>=20
>> Could we use org.freedesktop.DBus.Properties.PropertiesChanged here?
>=20
> Yes.
>=20
> --Vernon
