Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vXdjN5Zg4zDqHH
 for <openbmc@lists.ozlabs.org>; Tue, 28 Feb 2017 23:50:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="IsFa4G5Q"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="oz6uwV1n"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2471F20B47;
 Tue, 28 Feb 2017 07:50:45 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Tue, 28 Feb 2017 07:50:45 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=Ie8kpdY7i3itbLIZZ2/RF8FeRQI=; b=IsFa4G
 5Ql66ikClmuiUS84ZVnZPmcqrMgY0dgeuGWuqnIOdxzlLBbEMBhWAzKIIrBABYyE
 odY4UwdxexwokbsDuQv9iAm2ucEDtQj2yBFXOdM6MGTGljbWgqng4dEHS0Tftg/d
 YhHFryJpCbUuHcZaqsmG7AxAoqZZHarbn6UbU=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=Ie8kpdY7i3itbL
 IZZ2/RF8FeRQI=; b=oz6uwV1nXZKd9FlB2VlEUfDVbNtOG/auE1clkXegIRvGuS
 59gyNGTSJMccv3v9bpUIWEhX5b/UZVwjCGlHsJhJyzifCHtuzIDSKtHAeI0z8dea
 Fy8jfSrEGJ3+jjW+Aa8+n1M0c+nKIvvLodsLymTqwpmR3K2hcXlP4PsRsey7w=
X-ME-Sender: <xms:JXK1WFmB8K9IDRE3dv_e1wC8s2_eYAyzm_TOkW5fZUpOiZ9rLW9ELw>
X-Sasl-enc: lQYMsalYV2Bm5rnwDx6Mvbfk5nsSdyWyXUxM0JMEw9L6 1488286244
Received: from [172.16.172.59] (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id F37777E12C;
 Tue, 28 Feb 2017 07:50:42 -0500 (EST)
Message-ID: <1488286229.4258.5.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.7] arm: aspped: romulus: Set PNOR SPI
 address mapping
From: Andrew Jeffery <andrew@aj.id.au>
To: Lei YU <mine260309@gmail.com>, Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Cyril Bur <cyrilbur@gmail.com>
Date: Tue, 28 Feb 2017 23:20:29 +1030
In-Reply-To: <1488285610.4258.3.camel@aj.id.au>
References: <1488266280-28755-1-git-send-email-mine260309@gmail.com>
 <CACPK8XdHH1Yrr+TaD-joq0uFgj+epg_dQu2QHhSfFv9i0LNkDQ@mail.gmail.com>
 <1488280599.2423183.895344368.6877EADC@webmail.messagingengine.com>
 <CAARXrtmw2FmhuO2WU8A4F4X=i5JD0CPTV_N6Oztm8zzs7diKuA@mail.gmail.com>
 <1488285610.4258.3.camel@aj.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-uTEavwAooMMmLoiq2Yv2"
X-Mailer: Evolution 3.22.1-0ubuntu2 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Feb 2017 12:50:49 -0000


--=-uTEavwAooMMmLoiq2Yv2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-02-28 at 23:10 +1030, Andrew Jeffery wrote:
> > This patch is for issue https://github.com/openbmc/openbmc/issues/1214
...
> Okay, can you please open an issue on github?

Sorry, I completely looked past that link the first time.

Andrew
--=-uTEavwAooMMmLoiq2Yv2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYtXIVAAoJEJ0dnzgO5LT5N1AP/RJFuwTX1kGhhDFORPhD63Nt
9mxufUoOH0l5NF+PgMufr2iXDISVRsXg/s3ElevrML0fHUSfbi3+p0EDYeKjjnl/
MF0yhMvwPJqn61lSHUw1/yelK8DQ/PXoNuGLum/QYBcDDRhYX+jlZuzr5/5TlROV
IlBLafc41VinjIntrXfKt0UYKbRblKspRtQarUUS5nrGhrihBemIoxbquQjBDzCJ
TL33Mu6PWTDUA6KHt7UrzckWoeXlHfmfCl9u8qE9HwsLvDRjuNgq258503/dBUM4
+IvnJ/Dv2seZEkxFLltETETOLnTq6CSA15Lsk/InHIbcUrDA86yv+iZLukb6MeAm
kSEuI009+ntQRQ7WmZZZr7lFlbkDgUwunnfkHnBjWIK+l3Roz/0MFXWMBMeEnDK4
C5d0SsuL6wUNEYxzN+pYsHLqLOoiy9ziAToHZiukW8GzrndfYxNozA1WwdcYzDWW
rJ3irGlF46x0n4HKXF+FfUUM4SpDru0OBeB68ilkrBIZX1m7W/H/gjcKp9oaRdW+
iBgw52QYFFTiD3+MFhHWDXBuG0+9VRiE5bWGRnsXTQdRxHxGI7sszrspQRPPMTtz
RBoQREKCzxMNB5UmfE44lFNpSonxBW5FnRMPCrXnZ/Vd89XDF/zQIFXksYXmxeA3
0tLFhwX9f4DHh53eWvql
=OkVz
-----END PGP SIGNATURE-----

--=-uTEavwAooMMmLoiq2Yv2--
