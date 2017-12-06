Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ys0PW12wdzF066
 for <openbmc@lists.ozlabs.org>; Wed,  6 Dec 2017 11:49:34 +1100 (AEDT)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Dec 2017 16:49:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,366,1508828400"; d="scan'208";a="13457169"
Received: from mauery.jf.intel.com (HELO mauery) ([10.7.150.164])
 by orsmga001.jf.intel.com with ESMTP; 05 Dec 2017 16:49:31 -0800
Date: Tue, 5 Dec 2017 16:49:31 -0800
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC community telecon - 11/27 Agenda
Message-ID: <20171206004931.GI113334@mauery>
References: <911ECDC1-D1F4-4B4B-8433-CE396C2EEE35@fuzziesquirrel.com>
 <20171205010205.GH113334@mauery>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20171205010205.GH113334@mauery>
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
X-List-Received-Date: Wed, 06 Dec 2017 00:49:35 -0000

On 04-Dec-2017 05:02 PM, Vernon Mauery wrote:
>On 04-Dec-2017 05:06 PM, Brad Bishop wrote:
>>multi configuration images / runtime configurability
>>user management
>>secure coding guidelines
>>
>>=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=
=E2=80=94
>>Monday, 10:00pm EDT
>>888-426-6840
>>password: 85891389
>
>For the discussion on user management.
>
>Overview:
>1. User management is done via PAM.
>2. If IPMI is being used, PAM loads the pam_ipmi.so password module.
>  a. pam_ipmi.so intercepts password changes and saves the password
>     for IPMI-enabled users to a file that can be read at a later time
>     to initiate an RMCP+ session. (encrypted or obfuscated with a     =20
>per-BMC key so no passwords are written directly in flash.)
>  b. pam_ipmi.so implements a method to decrypt passwords and provide
>     them to host-ipmi (for test password command) and net-ipmi (for
>     session initiation)
>3. If a user is not enabled for IPMI, their password will not be saved
>  in the ipmi database, and thus must be reset if/when that user gains
>  IPMI capability.
>4. If a user loses IPMI capability, their password is reset to force a
>  password change so their password is secure again.
>5. Capabilities is done via unix groups
>  a. Groups like ipmi, webserver, redfish, ssh, sol can provide login     =
=20
>or 'channel' access.
>  b. Groups like user-manager, media, power, sensor, etc., can provide
>     fine-grained access for various capabilities. Providers of     =20
>capabilities should check to see that accessors (users) have the     =20
>required permission.
>6. Admin-defined 'super-groups'
>  a. Provide a set of pre-defined groups of capabilities that can be
>     assigned to users: Admin, User, Operator or similar that each have
>     groups associated with them.
>  b. Changes to groups via APIs can make sure that if a user is     =20
>assigned to a 'super-group' will stay assigned to the sub-groups
>  c. Changes made to users via manual commands may override API groups

Items yet to be decided:
1. How providers of services export the service/permission pairs so the=20
user manager can manage the permission groups.
2. How to manage the permissions groups (is there a PAM group mechanism?)
3. How to create users (call adduser?)
4. Do we force users to have different passwords for RMCP+ and other=20
logins because RMCP+ passwords are insecurely stored? Or is this a=20
policy thing that we allow system administrators to choose?


--Vernon

>
>Methods:
>   1. CREATE_USER
>       Privilege-required: USER-MANAGER
>       Args:
>           UserName - STRING (16 bytes only - else role change to IPMI can=
't be done)
>           Password - Byte Array (Max of 20 bytes if IPMID is chosen. For
>                      others can send more bytes, but change role to IPMI =
will
>                      request password again under 20 bytes)
>           Roles - STRING with comma separated
>       Return:
>           SUCCESS ERR_USERNAME_EXIST ERR_PASSWORD_FAILS ERR_ROLE_FAILS
>           ERR_PASSWORD_ROLE_FAIL ERR_NO_RESOURCE ERR_UNKNOWN
>           ERR_AUTHORIZATION_FAIL
>
>   2. DELETE_USER
>       Privilege-required: USER-MANAGER
>       Args:
>           UserName - STRING
>       Return:
>           SUCCESS ERR_USERNAME_NOT_EXIST ERR_UNKNOWN ERR_AUTHORIZATION_FA=
IL
>
>   3. CHANGE ROLE / CHANGE_PASSWORD (OTHERS)
>       Privilege-required: USER-MANAGER
>       Args:
>           UserName - STRING
>           New Password (if changed) - Byte Array
>           New Role (if changed) - Array of STRING
>       Return:
>           SUCCESS ERR_USERNAME_NOT_EXIST ERR_UNKNOWN ERR_AUTHORIZATION_FA=
IL
>           ERR_PASSWORD_FAILS ERR_PASSWORD_ROLE_FAIL ERR_NO_RESOURCE
>
>   4. CHANGE_PASSWORD (SELF)
>       Privilege-required: Any Valid user
>       Args:
>           New Password - Byte Array
>       Return:
>           SUCCESS ERR_PASSWORD_FAILS ERR_PASSWORD_ROLE_FAIL ERR_UNKNOWN
>
>   5. LIST_USER_DETAILS
>       Privilege-required: USER-MANAGER
>       Args:
>           NULL
>       Return:
>           Array of:
>               USER_NAME (String)
>               ROLES (String)
>
>Signals:
>   1. UPDATED_USER_SIGNAL
>       Args:
>           UserName of updated user
>           UpdateType:
>               Role changed / User Deleted / User created / Password=20
>Changed etc.
>
