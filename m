Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43dcqM4DX9zDqWY
 for <openbmc@lists.ozlabs.org>; Tue, 15 Jan 2019 02:30:22 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id E08166DC7D;
 Mon, 14 Jan 2019 10:30:14 -0500 (EST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Subject: Re:
 https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-dbus-interfaces/+/16468/
 needs your review
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <000501d4a7d9$341e2680$9c5a7380$@linux.intel.com>
Date: Mon, 14 Jan 2019 10:30:14 -0500
Cc: "Tanous, Ed" <ed.tanous@intel.com>,
 openbmc@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <8ED9CE5F-244D-476C-80D0-FD61E7CB78A2@fuzziesquirrel.com>
References: <000001d4a7c9$bb643a40$322caec0$@linux.intel.com>
 <CDCE2036-F411-4B23-96ED-5C79F782E259@fuzziesquirrel.com>
 <000501d4a7d9$341e2680$9c5a7380$@linux.intel.com>
To: Yong Li <yong.b.li@linux.intel.com>
X-Mailer: Apple Mail (2.3445.102.3)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Jan 2019 15:30:24 -0000



> On Jan 9, 2019, at 12:07 AM, Yong Li <yong.b.li@linux.intel.com> =
wrote:
>=20
> Hi Brad,
>=20
> Thanks for your mail. For this change, It should be better to add it =
into 2.6.
> Based on this change, I will start to add the implementation

"add the implementation" sounds like new function.  It isn=E2=80=99t =
appropriate to be
adding new function to the release at this point.  Please let me know if =
I am
not understanding something.

We are branching for 2.6 today (or possibly tomorrow) at which point =
your change
could be merged into master (and not 2.6).  Please let us know if that =
isn=E2=80=99t sensible.

> in the IPMI watchdog command.
>=20
> Thanks,
> Yong
> -----Original Message-----
> From: Brad Bishop <bradleyb@fuzziesquirrel.com>=20
> Sent: Wednesday, January 9, 2019 11:35 AM
> To: Yong Li <yong.b.li@linux.intel.com>
> Cc: Tanous, Ed <ed.tanous@intel.com>
> Subject: Re: =
https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-dbus-interfaces/+/=
16468/ needs your review
>=20
>=20
>> On Jan 8, 2019, at 10:16 PM, Yong Li <yong.b.li@linux.intel.com> =
wrote:
>>=20
>> HI Brad,
>>=20
>> Sorry to disturbing, but the below code review is idle for serval =
days:
>> =
https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-dbus-interface
>> s/+/16468/
>>=20
>> several reviewers had =E2=80=9C+1=E2=80=9D, could you help to review =
or merge it please?
>>=20
>> Thanks,
>> Yong
>=20
> Hi Yong
>=20
> Please copy the list with this sort of thing.  In fact you should just =
always copy the list.  Thanks.
>=20
> I=E2=80=99m not merging much right now because we are in the middle of =
trying to release 2.6:
> https://lists.ozlabs.org/pipermail/openbmc/2019-January/014503.html
>=20
> If you think it should be in 2.6, we can probably do that.  Do you =
need it in 2.6?
>=20
> I expect to start merging code again after the three days are over and =
we branch.
>=20
> thx - brad=3D
