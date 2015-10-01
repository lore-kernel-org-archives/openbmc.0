Return-Path: <brad@bwbmail.net>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D30071A010A
 for <openbmc@lists.ozlabs.org>; Thu,  1 Oct 2015 10:02:57 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Subject: Re: BSP layers
From: Brad Bishop <brad@bwbmail.net>
In-Reply-To: <CACPK8Xc9sYaZLTZnHu3V2vQRB6PvO-pYR7uEappp+Mg0210NaQ@mail.gmail.com>
Date: Wed, 30 Sep 2015 20:02:49 -0400
Cc: openbmc@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <03B3DFA9-D275-433E-96E5-372E1DA6731D@bwbmail.net>
References: <722865DA-D254-4972-9020-E6D01F95EC60@bwbmail.net>
 <CACPK8Xc9sYaZLTZnHu3V2vQRB6PvO-pYR7uEappp+Mg0210NaQ@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Oct 2015 00:02:58 -0000

Hi Joel

Thx for the review.  I=E2=80=99m trying to get to a point where we can =
boot a Palmetto with these in the next few days.  I will follow up with =
another note.

Thx - Brad


> On Sep 29, 2015, at 8:44 PM, Joel Stanley <joel@jms.id.au> wrote:
>=20
> Hey Brad,
>=20
> On Sat, Sep 26, 2015 at 4:47 AM, Brad Bishop <brad@bwbmail.net> wrote:
>> https://github.com/bradbishop/meta-aspeed
>> https://github.com/bradbishop/meta-openpower
>=20
> Cool. I had a bit of a look.
>=20
> Feel free to send me patches for the issues in the kernel tree that
> you found. We don't want to be carrying patches to things where the
> fix should be in the repository, and that's especially true for
> components we own where the patch up-streaming is much easier.
>=20
> How do we go about building these into something I can boot on a =
palmetto?
>=20
> Cheers,
>=20
> Joel
