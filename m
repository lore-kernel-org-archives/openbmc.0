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
 by lists.ozlabs.org (Postfix) with ESMTPS id 416C4p3hHvzF0Pd
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jun 2018 04:36:25 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 93068E55BB;
 Thu, 14 Jun 2018 14:36:20 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: Feature request in phosphor-pid-control
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <7E9441B1E5EFFD4681F54958E8216993457F637B@ORSMSX113.amr.corp.intel.com>
Date: Thu, 14 Jun 2018 14:36:20 -0400
Cc: Lei YU <mine260309@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Patrick Venture <venture@google.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <417F1A7A-09A0-4EF4-AF57-0D90D3135DEB@fuzziesquirrel.com>
References: <CAARXrt=XaO=t=UuSDjcgZ=Nkh9J7vTQJPEAMG5=_Ca7ukRVekA@mail.gmail.com>
 <7E9441B1E5EFFD4681F54958E8216993457F637B@ORSMSX113.amr.corp.intel.com>
To: "Tanous, Ed" <ed.tanous@intel.com>
X-Mailer: Apple Mail (2.3273)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Jun 2018 18:36:27 -0000

>=20
> On Jun 14, 2018, at 1:21 PM, Tanous, Ed <ed.tanous@intel.com> wrote:
>=20
> So far as I know, no one has proposed one of these yet, but I would =
happily help review a patch.

I=E2=80=99m pretty sure Matt Barth added support for =
xyz.openbmc_project.State.Decorator.OperationalStatus
to phosphor-hwmon already.  It certainly doesn=E2=80=99t cover something =
like mapper timeouts though (nor
should it, IMO).

>=20
> Also, (not Patrick) I would support a parameter in =
phosphor-pid-control that makes sensors optional.  The only part that =
worries me here is that there is a big difference at a system level =
between "unavailable" and "faulted", but I think that could be easily =
fixed in a future patchset if we get the full DBus support for status =
interfaces.
>=20
> -Ed
