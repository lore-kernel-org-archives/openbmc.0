Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from mail.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rTXNn354NzDqdy
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jun 2016 00:39:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.b=JVyAUfVV; dkim-atps=neutral
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.fuzziesquirrel.com CB82E23623
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fuzziesquirrel.com;
 s=mail; t=1465915189;
 bh=uZ4ZCSICMP7r+ddLOK4Ec4MCQoSvL8v0PLL9mL3AkD8=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
 b=JVyAUfVVZpdWOOoYJv/OaBuzkSaEK+HHs1NoIfi/jPp4xg+yhMpeHmrvszcZWj9kK
 etkZ5LYtTVrQ/QII2H4lLQ/Wjl//yUEn6PYmlliNq41atd8jztchoj/1oFM6npQ+xF
 v7m9GPQprmjuKtVJB+qszQLY/SHmIWikyoYipaOQ=
Received: from [192.168.253.29] (unknown [192.168.253.29])
 by mail.fuzziesquirrel.com (Postfix) with ESMTPSA id 09CE9235E0;
 Tue, 14 Jun 2016 10:39:49 -0400 (EDT)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: Authentication for OpenBMC port 3000
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <20160614110341.GY19968@asimov.austin.ibm.com>
Date: Tue, 14 Jun 2016 10:39:48 -0400
Cc: Adriana Kobylak <anoo@us.ibm.com>,
 openbmc@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <630F062D-1D42-4DA5-B9DA-D422901F7F2D@fuzziesquirrel.com>
References: <OF97E67B46.5B644A38-ON86257FD2.000986B3-86257FD2.000A1137@notes.na.collabserv.com>
 <20160614110341.GY19968@asimov.austin.ibm.com>
To: Patrick Williams <patrick@stwcx.xyz>
X-Mailer: Apple Mail (2.3124)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Jun 2016 14:39:54 -0000

+1

> On Jun 14, 2016, at 7:03 AM, Patrick Williams <patrick@stwcx.xyz> =
wrote:
>=20
> On Mon, Jun 13, 2016 at 08:49:58PM -0500, Adriana Kobylak wrote:
>> Adi brought up the concern that accessing port 3000 doesn't require=20=

>> authentication. Since the OpenBMC UI, which would replace the port =
3000,=20
>> is not close to being delivered yet, and the Barreleye GA build=20
>> approaches, any thoughts on how to proceed: add authentication to the =
port=20
>> 3000, remove it from the build, other?
>>=20
>=20
> In my view, the port 3000 code was only there for debug / development
> purposes.  I would suggest we disable it in production builds.
>=20
> --=20
> Patrick Williams
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
