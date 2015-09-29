Return-Path: <brad@bwbmail.net>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 97BA41A077B
 for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2015 03:42:48 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Subject: Re: BSP layers
From: Brad Bishop <brad@bwbmail.net>
In-Reply-To: <20150929144451.GF14293@asimov.ibm.com>
Date: Tue, 29 Sep 2015 13:42:42 -0400
Cc: openbmc@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <B894A2FA-6B26-4E24-9751-7EEF687D33A3@bwbmail.net>
References: <722865DA-D254-4972-9020-E6D01F95EC60@bwbmail.net>
 <20150929144451.GF14293@asimov.ibm.com>
To: Patrick Williams <patrick@stwcx.xyz>
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
X-List-Received-Date: Tue, 29 Sep 2015 17:42:49 -0000

Patrick

Automatic versioning seems fine for now.  I will update that.

For the openbmc hierarchy how about:

meta-openbmc-bsp/meta-aspeed -> meta-aspeed
meta-openbmc-machines/meta-openpower -> meta-openpower

thx - Brad

> On Sep 29, 2015, at 10:44 AM, Patrick Williams <patrick@stwcx.xyz> =
wrote:
>=20
> On Fri, Sep 25, 2015 at 02:47:59PM -0400, Brad Bishop wrote:
>> I have a couple new layer repositories:
>>=20
>> https://github.com/bradbishop/meta-aspeed =
<https://github.com/bradbishop/meta-aspeed>
>> https://github.com/bradbishop/meta-openpower =
<https://github.com/bradbishop/meta-openpower>
>>=20
>> Appreciate any feedback.
>>=20
>> Thx! - brad
>>=20
>=20
> Brad,
>=20
> I noticed in the layer.conf files we are manually assigning priority.
> Do we want to allow the automatic assignment or is there some =
guidelines
> on what the priority should be?
>=20
> Seems that you have:
>    * BMC Hardware Layer - 7
>    * Host Machine Class - 8
>    * Host Machine Specific - 9
>    * OEM Machine Enhancment - 10 (not there, but imagined by me).
>=20
> Based on the conference call we had last week, I think we should go
> ahead and make github.com/openbmc repositories for these two you have.
> I can create that if you want.
>=20
> What is your proposal for where these repositories live in
> openbmc/openbmc?  meta-openbmc-bsp for meta-aspeed?  I'm unsure if
> meta-openpower belongs under a meta-openbmc-machines or
> meta-phosphor/meta-machines?
>=20
> --=20
> Patrick Williams
