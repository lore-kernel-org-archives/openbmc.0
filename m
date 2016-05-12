Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from mail.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r5MkW47qXzDqCm
 for <openbmc@lists.ozlabs.org>; Fri, 13 May 2016 05:00:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.b=Zi7C4gOo; dkim-atps=neutral
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.fuzziesquirrel.com 687FC1CBAE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fuzziesquirrel.com;
 s=mail; t=1463079617;
 bh=pev//g0AiwTwyuhJtUPGPFpeHjnRwM9HJ96+ZF2cn5w=;
 h=Subject:From:In-Reply-To:Date:References:To:From;
 b=Zi7C4gOoDc2vit4AjQQRGkKbbusAxZcyWDIBTidLCwYgFULvx0IFWHetfX07G/D/P
 QKK0CMi9+PV19P5HJWptnsX+A0OJJM5Yk074+ple+ed5L1brfRK0rrXttpu+b2Iuzz
 DEzdvCDLXcYMiG8e/zE+jZGRLDVOD/Ju2NI/dTnY=
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.29])
 by mail.fuzziesquirrel.com (Postfix) with ESMTPSA id AF9101CB91
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2016 15:00:16 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH docs] Take a stab at a proper DBUS API document.
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <57344529.8020901@ozlabs.org>
Date: Thu, 12 May 2016 15:00:16 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <5A0C79D4-7D2D-4A99-8489-AC9715E7A5EB@fuzziesquirrel.com>
References: <1462996814-824-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1462996814-824-2-git-send-email-openbmc-patches@stwcx.xyz>
 <57344529.8020901@ozlabs.org>
To: OpenBMC Patches <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 12 May 2016 19:00:19 -0000

Thx Jeremy

> On May 12, 2016, at 4:56 AM, Jeremy Kerr <jk@ozlabs.org> wrote:
>=20
> Hi Brad,
>=20
> This is awesome, thanks for taking the time and writing up the proper
> content here.
>=20
> Since your change will establish a few conventions around how the
> interfaces will be properly documented, I'm being extra-nitpicky about
> this, so have a few changes listed below. If you'd prefer, I can do =
this
> reformatting myself, but we should still address this somehow, before
> merging.
>=20
>=20
>> +# OpenBMC DBUS API
>=20
> Most of the other docs use the =3D=3D=3D=3D/---- style of for level 1 =
& level 2
> headers, as it makes the text version of the markdown look more like a
> header.

done!

>=20
>> +The Phosphor distibution provides sample applications that implement =
off all the interfaces and objects listed below.  Alternative or more =
feature complete applications are possible by implementing parts of this =
DBUS API.
>=20
> Can we wrap at 80 columns, where it makes sense? Things that *need* to
> be wider are fine, but this makes things readable for folks who use
> 80-cols by default.

done!

>=20
>> +| name         | in signature | out signature | description          =
                    |
>> +| ------------ | ------------ | ------------- | =
---------------------------------------- |
>> +| sendMessage  | yyyyyay      | x             | Send an IPMI message =
to the host processor firmware. |
>=20
> Should we backtick-escape these names (and paths)? It'll also avoid =
any
> issues with inline < and > characters (which Chris picked up in his
> review).

done!

>=20
> Looks like this table format is also compatible with the pandoc =
markdown
> implementation, which is great news if/when we want to create a PDF
> document including this.
>=20
> Speaking of which, pandoc also supports a few different methods of =
doing
> tables, some of which allow us to break long lines (which may make the
> text-format of the doc easier to read):
>=20
>  http://pandoc.org/README.html#tables
>=20

Yes, tables in github are ugly.  I tried the other formats and github =
doesn=E2=80=99t render any of them.

I cleaned them up best I could.  If in the future someone wants to =
restructure it without tables it won=E2=80=99t bother me any.


> However, if we do end up using one of these, we'll need to check that =
it
> still renders correctly in github.
>=20
> Cheers,
>=20
>=20
> Jeremy
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
