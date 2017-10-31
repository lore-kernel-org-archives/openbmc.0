Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yQxt64Y2lzDqwb
 for <openbmc@lists.ozlabs.org>; Tue, 31 Oct 2017 14:39:26 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id D5A2D161EAE
 for <openbmc@lists.ozlabs.org>; Mon, 30 Oct 2017 23:39:21 -0400 (EDT)
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: OpenBMC community telecon - 10/30 Minutes
Message-Id: <FCDEA979-63B9-4E30-BB0C-362945F4E0EE@fuzziesquirrel.com>
References: <C953C6CA-3D8B-4D9C-B6EB-8CC51DFD582E@fuzziesquirrel.com>
To: OpenBMC <openbmc@lists.ozlabs.org>
Date: Mon, 30 Oct 2017 23:39:21 -0400
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
X-List-Received-Date: Tue, 31 Oct 2017 03:39:26 -0000


> Begin forwarded message:
>=20
> From: Brad Bishop <bradleyb@fuzziesquirrel.com>
> Subject: OpenBMC community telecon - 10/30 Agenda
> Date: October 30, 2017 at 9:45:45 PM EDT
> To: OpenBMC <openbmc@lists.ozlabs.org>
>=20
> - telemetry as MQTT (Sivas)

Some consensus that on the surface MQTT seems like a reasonable =
transport.

> - empty root password (Sivas)

Discussion quickly evolved into a general default security policy for =
the
disto.  Default security policy will be re-visited once a new policy is
proposed and implemented.

> - bmc dump performance (Sivas)

Planned performance improvements in the pipe =
(org.freedesktop.DBus.ObjectManager usage).

Had a brief discussion on the DBus max message size and scaling.  Will =
likely
be a future pain point - ideas/suggestions welcome.

Discussion on metrics -

Relevant RFCs:
https://lists.ozlabs.org/pipermail/openbmc/2017-September/009113.html
https://lists.ozlabs.org/pipermail/openbmc/2017-September/009065.html

Code under review:
=
https://gerrit.openbmc-project.xyz/#/q/status:open+project:openbmc/phospho=
r-dbus-monitor+branch:master+topic:2254

Already merged code:
=
https://gerrit.openbmc-project.xyz/#/q/status:merged+project:openbmc/phosp=
hor-rest-server+branch:master+topic:events

> - v2.0 tag (Brad)

Resume monthly tagging - reset on v2.0 tag to occur Wednesday.

=E2=80=94--other business=E2=80=94
New participant introductions

>=20
>=20
>> Begin forwarded message:
>>=20
>> From: Brad Bishop <bradleyb@fuzziesquirrel.com>
>> Subject: OpenBMC community telecon - call for 10/30 topics
>> Date: October 26, 2017 at 9:30:47 AM EDT
>> To: OpenBMC <openbmc@lists.ozlabs.org>
>>=20
>> Please note the new time of 10:00PM EDT. =20
>>=20
>> Please reply with any topics and I will add them to the agenda.
>>=20
>> thanks - brad
>=20
