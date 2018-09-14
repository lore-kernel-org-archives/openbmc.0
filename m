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
 by lists.ozlabs.org (Postfix) with ESMTPS id 42BbGk4nc9zF3WJ
 for <openbmc@lists.ozlabs.org>; Fri, 14 Sep 2018 23:00:29 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id B71C56DE61;
 Fri, 14 Sep 2018 09:00:24 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: New Repository Request
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAO=noty_TQ2jvQw-Yxb-RYe+0xOXa4F39ozF11r9PN1w2Qt_Dw@mail.gmail.com>
Date: Fri, 14 Sep 2018 09:00:24 -0400
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 Emily Shaffer <emilyshaffer@google.com>, Tom Joseph <tomjoseph@in.ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C385EBD1-871A-4E5B-8FDE-80146795CC6D@fuzziesquirrel.com>
References: <CAO=noty_TQ2jvQw-Yxb-RYe+0xOXa4F39ozF11r9PN1w2Qt_Dw@mail.gmail.com>
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
X-List-Received-Date: Fri, 14 Sep 2018 13:00:31 -0000


> On Sep 13, 2018, at 1:55 PM, Patrick Venture <venture@google.com> =
wrote:
>=20
> Brad,
>=20
> I'd like to set up a new repository in openbmc to store a google oem
> ipmi library I'd like to share with everybody.  It allows grabbing
> ethernet device statistics over IPMI.
>=20
> I have no problem registering it under the OpenBMC OEN (and the google
> one) since OEM registration supports that -- then it could be
> phosphor-ipmi-ethstats.
>=20
> I really would like to share the code -- but I would be ok with it
> being in a google-specific repository, such as google-ipmi-ethstats --
> If so, I'll put the recipe in meta-google.
>=20
> I know we've talked about this before, and it really feels like six in
> one hand on this =E2=80=94

As far as where the code is hosted I=E2=80=99m good one way or the =
other.
Will wait a couple days for objections and create =
openbmc/phosphor-ipmi-ethstats.

It might be good to have a conversation around how we handle the OpenBMC =
OEN
though.  Putting things there would seem to have lasting impact for =
everyone
using OpenBMC and we don=E2=80=99t have any process in place for that.

>=20
> Thanks,
> Patrick
