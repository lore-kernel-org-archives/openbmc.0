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
 by lists.ozlabs.org (Postfix) with ESMTPS id 42FHt74pJNzF3Jp
 for <openbmc@lists.ozlabs.org>; Wed, 19 Sep 2018 08:37:03 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 64A7CE55D7;
 Tue, 18 Sep 2018 18:37:00 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: New Repository Request
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAO=notx9KnTNNC1UnL=DQkfpgqaUmKsbMeAG1H8CkodXGDVQ4Q@mail.gmail.com>
Date: Tue, 18 Sep 2018 18:37:00 -0400
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 Emily Shaffer <emilyshaffer@google.com>, Tom Joseph <tomjoseph@in.ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <DAB66DC6-18D1-4784-9875-BAD64C2AD861@fuzziesquirrel.com>
References: <CAO=noty_TQ2jvQw-Yxb-RYe+0xOXa4F39ozF11r9PN1w2Qt_Dw@mail.gmail.com>
 <C385EBD1-871A-4E5B-8FDE-80146795CC6D@fuzziesquirrel.com>
 <CAO=notx9KnTNNC1UnL=DQkfpgqaUmKsbMeAG1H8CkodXGDVQ4Q@mail.gmail.com>
To: Patrick Venture <venture@google.com>
X-Mailer: Apple Mail (2.3445.9.1)
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
X-List-Received-Date: Tue, 18 Sep 2018 22:37:04 -0000

> On Sep 18, 2018, at 11:47 AM, Patrick Venture <venture@google.com> =
wrote:
>=20
>> On Fri, Sep 14, 2018 at 6:00 AM Brad Bishop =
<bradleyb@fuzziesquirrel.com> wrote:
>>=20
>> It might be good to have a conversation around how we handle the =
OpenBMC OEN
>> though.  Putting things there would seem to have lasting impact for =
everyone
>> using OpenBMC and we don=E2=80=99t have any process in place for =
that.
>=20
> That's correct.  So, right now, the extra handlers aren't enabled to
> be included in the image by default. =20

I=E2=80=99m more concerned with the number the end user types in when =
they run ipmitool.

> Someone would need to select them, which I like.  As that's an opt-in =
behavior.

I=E2=80=99m not understanding the relationship between opt-in and the =
OEN number.  In my
mind there isn=E2=80=99t one.  Isn=E2=80=99t the question instead: for a =
given OEM extension, is
the OEN number OpenBMCs or foo-corps (irrespective of whether or not a =
system
integrator opts-in or opts-out of including a specific extension in =
their image).

> And if there=E2=80=99s interplay between the things, they can =
explicitly indicate that in
> bitbake and in a README.
>=20
> Consider, that each company may want to share their handlers - which I
> think is great.  It enables vendors, if nothing else, and encourages
> them to switch to OpenBMC to sell hardware to IBM, Google, etc.  I
> also prefer the opt-in model for features, which this fits (repeated
> point).
>=20
> If we share them openly and register the numbers in
> phosphor-host-ipmid, we can better enable a vendor or someone to say,
> I want to support _all_ the environments, and just flip all the
> switches.  To this end, I'm considering re-submitting the oemgoog
> header to phosphor-host-ipmid, but by flagging its inclusion via a
> build-time flag.  So, one could say, build a clean phosphor-host-ipmid
> by building the default, but if they --enable-google or --enable-intel

I feel like there has to be a way to do the same thing without the need =
for
=E2=80=94-enable-xyzcorp switches.  I wouldn=E2=80=99t want to maintain =
that.=
