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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43lBMM3GqszDqKJ
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jan 2019 03:58:54 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Wed, 23 Jan 2019 11:59:19 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Ed Tanous <ed.tanous@intel.com>
Cc: Tom Joseph <tomjose@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org,
 jason.m.bills@intel.com, Vernon Mauery <vernon.mauery@linux.intel.com>,
 Emily Shaffer <emilyshaffer@google.com>,
 Bradley W Bishop <bradleyb@us.ibm.com>
Subject: Re: Intel-ipmi-oem repo
Message-ID: <20190123165919.g4sifus4q3fxwphg@thinkpad>
References: <B67393AC-1915-4999-93D9-944EA6D61D2A@fb.com>
 <1cf09b78-e1bc-b999-f934-e60bea6a1e1c@intel.com>
 <275b2db5-798f-b5c2-697a-bac50d6cd223@linux.vnet.ibm.com>
 <12723f71-dc40-1306-b7fc-e238222aa230@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <12723f71-dc40-1306-b7fc-e238222aa230@intel.com>
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Wed, 23 Jan 2019 16:58:56 -0000

On Wed, Jan 23, 2019 at 08:34:51AM -0800, Ed Tanous wrote:
>=20
> On 1/22/19 10:13 PM, Tom Joseph wrote:
> > On Wednesday 23 January 2019 03:35 AM, Ed Tanous wrote:
> >> On 1/22/19 10:16 AM, Vijay Khemka wrote:
> >>> In the case of SEL we did make progress and reached a consensus. Th=
e
> >>> proposed solution was to support mapping sensor number to sensor
> >>> D-Bus object paths in a flexible way(support both arbitrary mapping
> >>> and hardcoded sensor number), so that IBM systems can coexist with
> >>> the proposed SEL architecture. Jason was pursuing that and we
> >>> haven't heard from him for quite some time, this was brought in the
> >>> community call multiple times. =3D
>=20
> I was unaware Jason was still pursuing that, my understanding was that
> there wasn't a clear path forward for that change series to be
> compatible with IBM systems.=A0=20

This should read:

a clear path forward for that change series to be compatible with every
user of the project since it started. =20

It is a common misconception that IBM was the only user of/contributor
to this project prior to IBM donating it to The Linux Foundation last yea=
r.
In fact there were several contributors and users prior TLF.

> Was there any details on what the proposed
> solution was, and what the next steps are?

Just to level set - Do you expect Tom/IBM to provide the solution?  May I
ask why?  I felt the note from Tom spelled it out pretty clearly - an
abstraction is needed for sensor numbers.

>=A0It sounds like Vijay is
> hitting a bit of a wall with having that stuff checked into meta-intel;=
=A0
> I'd much rather roll those changes out into net-ipmid than create a new
> repo.

Me too!

>=20
> As Brad said earlier in the thread, the proliferation of repos is
> getting a bit nutty, and I'd like to avoid it if at all possible.
>=20
