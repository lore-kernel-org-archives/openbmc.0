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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4287083r6yzF0Q6
 for <openbmc@lists.ozlabs.org>; Mon, 10 Sep 2018 22:39:19 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 959EDEA0E0;
 Mon, 10 Sep 2018 08:39:11 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: tiny package --
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAO=notxW6Yq+uct7quRtNjFfp0DeyrsqXuYJh1uuBx-cDEa_MQ@mail.gmail.com>
Date: Mon, 10 Sep 2018 08:39:11 -0400
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Nancy Yuen <yuenn@google.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <5D7FB144-D237-41CF-B911-CB2A9818A91A@fuzziesquirrel.com>
References: <CAO=notxW6Yq+uct7quRtNjFfp0DeyrsqXuYJh1uuBx-cDEa_MQ@mail.gmail.com>
To: Patrick Venture <venture@google.com>
X-Mailer: Apple Mail (2.3445.9.1)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Sep 2018 12:39:21 -0000

> On Sep 8, 2018, at 12:01 PM, Patrick Venture <venture@google.com> =
wrote:
>=20
> Brad;
>=20
> I was looking at publishing a single-header file from a package
> containing only that header file.  In this case, "oemgoogle.hpp" into
> the same place that phosphor-host-ipmid installs its headers so that
> any google-ipmi-* packages could store their OEM numbers in one file
> (upstream).
>=20
> Downstream we store that file in our phosphor-host-ipmid mirror.
>=20
> The advice I seek is -- it doesn't seem worth creating a separate
> repository for one file, but I know it's a frowned upon practice to
> store code in the bitbake repository -- but in this case, I feel like
> it may be appropriate.  Does that make sense?

Obviously it will work just fine but I probably wouldn=E2=80=99t allow =
it in
the IBM or phosphor layers, out of fear of it being used as a counter
example or justification for a future change that isn=E2=80=99t quite so =
harmless.
But it is truly _your_ layer, so you can do whatever you want.

>=20
> I'm thinking:
> meta-google/recipes-google/ipmi/google-ipmi-header.bb
> meta-google/recipes-google/ipmi/google-ipmi-header/configure.ac
> meta-google/recipes-google/ipmi/google-ipmi-header/Makefile.am
> meta-google/recipes-google/ipmi/google-ipmi-header/oemgoogle.hpp
>=20
> Patrick

Why is the number hardcoded at all?  Could it be a configure option or
command line option?

If those don=E2=80=99t work, as a fall-back can we just put the header =
in the
upstream phosphor-host-ipmid repository as you=E2=80=99ve done =
downstream?

My two cents is that one of these three options would be simpler.

-brad=
