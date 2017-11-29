Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yn5ks4WXzzDrb7
 for <openbmc@lists.ozlabs.org>; Thu, 30 Nov 2017 03:36:04 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 28D46EA08E
 for <openbmc@lists.ozlabs.org>; Wed, 29 Nov 2017 11:36:01 -0500 (EST)
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: OpenBMC 11/27 community telecon - Minutes  
Message-Id: <11B5261C-98A2-410A-9C28-0DA2904BABA6@fuzziesquirrel.com>
Date: Wed, 29 Nov 2017 11:36:00 -0500
To: OpenBMC <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 29 Nov 2017 16:36:06 -0000

The minutes are not very good this week.  Apologies.

As always, If there are any errors or omissions please just reply with
a correction.

Thx - brad

OpenBMC Community Teleconference 11/27 Minutes
--------------------------------

Andrew J
Adriana K
Milton M
Jeremy K
Sai D
Andrew G
Eddie J
Joel S
James M
Nancy Y
Yong L

=E2=80=94=E2=80=94=E2=80=94
User Management

Milton - stories about user management - has anyone spelled out how =
thats going to work
Brad - no-one has done any (public) design yet
James - have something internal, based on ipmi
Brad - is dbus on the table?
James - will check into user design to possibly share.
Milton - areas that need discussion or agreement, concept of user roles =
-> map to groups, is a user in one group only?  is everyone allowed to =
ssh in?  is ssh limited?
Jeremy - approach of using PAM makes sense.  use whatever backend =
necessary.  3 roles required for IPMI.
James - intel considering PAM as well.
Nancy - is it possible to limit a user to how they login (over ipmi or =
ssh?)
Jeremy - yes
Brad - do we need dbus?
Jeremy - possibly not?
Nancy - IPMI should not go thru pam - some abstraction needed?
Jeremy - PAM is already an abstraction.
Brad - is there any shared logic between applications using PAM?
Jeremy - not really much duplicated.
Milton - are users common across interfaces?
Jeremy - yes.
Brad - when does it make sense to invent a dbus api and when doesn=E2=80=99=
t it?
Jeremy - do we need processes to communicate in a new way?  In this case =
the established PAM API dictates that.
James - asked team to finalize draft to get submitted for review.

=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94
Secure Coding Guidelines

James - banned apis, what are thoughts on that?
Jeremy - hard disallow is tough - could be warnings?  documented =
anti-patterns?
Brad - lets do a patch on the list

=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94
Multi Image Support

Nancy - what class of configurations?
James - x86, power, switch, etc.
Nancy - didn=E2=80=99t know this was possible.  very interesting.
