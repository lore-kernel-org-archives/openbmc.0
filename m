Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tCqZ46pjDzDvMF
 for <openbmc@lists.ozlabs.org>; Wed,  9 Nov 2016 00:15:55 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Where did host ipmi go on qemu and EVB?
Message-Id: <F6147AA0-C0A8-4765-99F6-B5D8D96E2BAD@fuzziesquirrel.com>
Date: Tue, 8 Nov 2016 08:15:32 -0500
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
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
X-List-Received-Date: Tue, 08 Nov 2016 13:15:57 -0000

A number of people have asked where host IPMI went on the QEMU/EVB =
platforms.  If this is of interest to you, read on=E2=80=A6.

Background:

- One of the goals for OpenBMC is meet the needs of a broad range of =
applications, where applications are servers, switches, routers, raid =
appliances=E2=80=A6etc.
- Yocto provides a concept of MACHINE_FEATURES, where features somewhat =
abstract declarations of the hardware features supported by a board.

For a real board, like the OpenPOWER Witherspoon server, the concepts =
are easy to apply.  Witherspoon is a server, and it has a BT interface =
on it.  So it isn=E2=80=99t much of a leap conceptually to have this in =
Witherspoon.conf:

MACHINE_FEATURES +=3D =E2=80=9Cobmc-host-ipmi-hw=E2=80=9D

The EVBs and QEMU models are different.  Most of us (if not everyone) =
are working on servers, and initially it was easy to just put the same =
line in those board config files, so we could prototype applications =
like host-ipmi on those boards.

Thats fine, and you can still do so, but this is no longer the default =
behavior.  If you want to prototype something on one of these boards, =
enable the feature in your local.conf, and build images and SDKs with =
those features enabled.

I opted to do this because I didn=E2=80=99t want to show any favortism =
towards servers.  For something with general applicability like a =
Raspberry Pi or a QEMU model my view is:

1 - A machine feature that really does exist in a QEMU model or on an =
EVB should still be enabled by default.  For example, it makes sense =
that a =E2=80=98led=E2=80=99 machine feature could exist and be enabled =
by default on a Raspberry Pi, since a Raspberry Pi, regardless of the =
application, could have leds hooked up to it.=20

2 - Machine features, like a BT interface, that don=E2=80=99t exist in a =
QEMU model or EVB should not enabled by default.  Despite this, we =
should strive to make feature implementations work on all the EVBs and =
QEMU models, as they can be enabled manually via local.conf.

-brad bishop=
