Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z0q4R4c8mzDrdP
 for <openbmc@lists.ozlabs.org>; Tue, 19 Dec 2017 05:16:55 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
Message-ID: <1513621011.5787.55.camel@fuzziesquirrel.com>
Subject: Re: OpenBMC community telecon - 11/27 Agenda
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Vernon Mauery <vernon.mauery@linux.intel.com>
Cc: OpenBMC <openbmc@lists.ozlabs.org>
Date: Mon, 18 Dec 2017 13:16:51 -0500
In-Reply-To: <20171206004931.GI113334@mauery>
References: <911ECDC1-D1F4-4B4B-8433-CE396C2EEE35@fuzziesquirrel.com>
 <20171205010205.GH113334@mauery> <20171206004931.GI113334@mauery>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Mon, 18 Dec 2017 18:16:59 -0000
X-List-Received-Date: Mon, 18 Dec 2017 18:16:59 -0000
X-List-Received-Date: Mon, 18 Dec 2017 18:16:59 -0000

On Tue, 2017-12-05 at 16:49 -0800, Vernon Mauery wrote:
> On 04-Dec-2017 05:02 PM, Vernon Mauery wrote:
> > On 04-Dec-2017 05:06 PM, Brad Bishop wrote:
> > > multi configuration images / runtime configurability
> > > user management
> > > secure coding guidelines
> > >=20
> > > =E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=
=94=E2=80=94
> > > Monday, 10:00pm EDT
> > > 888-426-6840
> > > password: 85891389
> >=20
> > For the discussion on user management.
> >=20
> > Overview:
> > 1. User management is done via PAM.
> > 2. If IPMI is being used, PAM loads the pam_ipmi.so password
> > module.
> >  a. pam_ipmi.so intercepts password changes and saves the password
> >     for IPMI-enabled users to a file that can be read at a later
> > time
> >     to initiate an RMCP+ session. (encrypted or obfuscated with
> > a     =20
> > per-BMC key so no passwords are written directly in flash.)
> >  b. pam_ipmi.so implements a method to decrypt passwords and
> > provide
> >     them to host-ipmi (for test password command) and net-ipmi (for
> >     session initiation)
> > 3. If a user is not enabled for IPMI, their password will not be
> > saved
> >  in the ipmi database, and thus must be reset if/when that user
> > gains
> >  IPMI capability.
> > 4. If a user loses IPMI capability, their password is reset to
> > force a
> >  password change so their password is secure again.
> > 5. Capabilities is done via unix groups
> >  a. Groups like ipmi, webserver, redfish, ssh, sol can provide
> > login     =20
> > or 'channel' access.
> >  b. Groups like user-manager, media, power, sensor, etc., can
> > provide
> >     fine-grained access for various capabilities. Providers
> > of     =20
> > capabilities should check to see that accessors (users) have
> > the     =20
> > required permission.
> > 6. Admin-defined 'super-groups'
> >  a. Provide a set of pre-defined groups of capabilities that can be
> >     assigned to users: Admin, User, Operator or similar that each
> > have
> >     groups associated with them.
> >  b. Changes to groups via APIs can make sure that if a user
> > is     =20
> > assigned to a 'super-group' will stay assigned to the sub-groups
> >  c. Changes made to users via manual commands may override API
> > groups
>=20
> Items yet to be decided:
> 1. How providers of services export the service/permission pairs so
> the=20
> user manager can manage the permission groups.

My thought was a bitbake class (like useradd.bbclass) could probably
get us here but I haven't thought about it beyond that.

> 2. How to manage the permissions groups (is there a PAM group
> mechanism?)

Could a custom PAM module best meet this need?  There is pam_listfile
for 'normal' groups but for this group-of-groups concept I'd guess
there isn't anything like this out there already.

> 3. How to create users (call adduser?)

This seems like a reasonable starting point.  If later someone speaks
up that it doesn't meet their needs we can always revisit and refactor
then imho.

> 4. Do we force users to have different passwords for RMCP+ and other=20
> logins because RMCP+ passwords are insecurely stored? Or is this a=20
> policy thing that we allow system administrators to choose?

A third choice could be same passwords + no policy.

I would vote for a choice (so policy) but you can let your own needs
drive your work here some.  For example you could implement same
passwords + no policy if that met your cuurrent needs, as long as
someone can later come in and add the policy and implement the other
side of it with relative ease.

>=20
>=20
> --Vernon
>=20
> >=20
> > Methods:
> >   1. CREATE_USER
> >       Privilege-required: USER-MANAGER
> >       Args:
> >           UserName - STRING (16 bytes only - else role change to
> > IPMI can't be done)
> >           Password - Byte Array (Max of 20 bytes if IPMID is
> > chosen. For
> >                      others can send more bytes, but change role to
> > IPMI will
> >                      request password again under 20 bytes)
> >           Roles - STRING with comma separated
> >       Return:
> >           SUCCESS ERR_USERNAME_EXIST ERR_PASSWORD_FAILS
> > ERR_ROLE_FAILS
> >           ERR_PASSWORD_ROLE_FAIL ERR_NO_RESOURCE ERR_UNKNOWN
> >           ERR_AUTHORIZATION_FAIL
> >=20
> >   2. DELETE_USER
> >       Privilege-required: USER-MANAGER
> >       Args:
> >           UserName - STRING
> >       Return:
> >           SUCCESS ERR_USERNAME_NOT_EXIST ERR_UNKNOWN
> > ERR_AUTHORIZATION_FAIL
> >=20
> >   3. CHANGE ROLE / CHANGE_PASSWORD (OTHERS)
> >       Privilege-required: USER-MANAGER
> >       Args:
> >           UserName - STRING
> >           New Password (if changed) - Byte Array
> >           New Role (if changed) - Array of STRING
> >       Return:
> >           SUCCESS ERR_USERNAME_NOT_EXIST ERR_UNKNOWN
> > ERR_AUTHORIZATION_FAIL
> >           ERR_PASSWORD_FAILS ERR_PASSWORD_ROLE_FAIL ERR_NO_RESOURCE
> >=20
> >   4. CHANGE_PASSWORD (SELF)
> >       Privilege-required: Any Valid user
> >       Args:
> >           New Password - Byte Array
> >       Return:
> >           SUCCESS ERR_PASSWORD_FAILS ERR_PASSWORD_ROLE_FAIL
> > ERR_UNKNOWN
> >=20
> >   5. LIST_USER_DETAILS
> >       Privilege-required: USER-MANAGER
> >       Args:
> >           NULL
> >       Return:
> >           Array of:
> >               USER_NAME (String)
> >               ROLES (String)
> >=20
> > Signals:
> >   1. UPDATED_USER_SIGNAL
> >       Args:
> >           UserName of updated user
> >           UpdateType:
> >               Role changed / User Deleted / User created /
> > Password=20
> > Changed etc.
> >=20
