Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53269606A325
	for <openbmc@archiver.kernel.org>; Thu, 19 Nov 2026 23:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=drvIPldN
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jVv9C2XY8z2y0B;
	Fri, 20 Nov 2026 10:01:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::92e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795114930;
	cv=none; b=NyMJx+lxMWFK/9jxxw9Ey1gnXnZ/WzOScvZCj+tHwrpEoIwWJs6LOt3g/WC8/qVEeFwM4MLO16qrymPbx6UUhBOLsBroH+dXpmJoQ9vefYEqD8fQXqUr8wa8kRBdFWv2OsrXW/SmUvbwqvbFj9W5FmmVk4JiOqmOJ+lD5hcp+Wr8x5fqhj1LYl5KFRg1Qoeb4YWYysdUJ0sZJQvoT7Shy95WwtcbhQA+tUI2bQ5Kj8EFeCGchsw7UkYmbysMqMYNBPfuk/gwG2Pj7kF+OLRuzTU1/KA6varpk1ID0x27ViAnZk63cX9ghbpe3iRMM4/CzkDJ+WgLXpU3hvV6W0R0eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795114930; c=relaxed/relaxed;
	bh=hKkPpNGKPc9dB0PHZyw3/Ep3fUq1c/BlK7UqcWPEb1A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KS5PP1Gd6hEkY0sW5i2LTC3vzWzWHtowByO70g0bIOd0kQPt7JrfO32Pp+poq+DjpWI5PvdoykqJgVJNUUDljZZ0Qbh8ijE6UZPMxLkocsyI382aqJUshguwbLc2oMfEEGkRLMvAx0tDQSz9WTt3+7RFBalkagmuT+/maOvltishWkzsim+8RmY3ha/FJPhfDnZ4FisDYN7d72/ExLK0A9ATT2/1cD+PmMRSbh0tXfn8nn9QkO14N0DKMq0ozuoIGEs5CZ7IVxEYMd0+pGsoofNLqIYyzi6CMEeRop5/i/GoiDkqp40KtDZy0TvUMts7A7PSNk1iUbU6qiahZV/yQA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; dkim=pass (2048-bit key; unprotected) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=drvIPldN; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::92e; helo=mail-ua1-x92e.google.com; envelope-from=nicolas@ndufresne.ca; receiver=lists.ozlabs.org) smtp.mailfrom=ndufresne.ca
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=drvIPldN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ndufresne.ca (client-ip=2607:f8b0:4864:20::92e; helo=mail-ua1-x92e.google.com; envelope-from=nicolas@ndufresne.ca; receiver=lists.ozlabs.org)
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jVnrw5k18z2xH7
	for <openbmc@lists.ozlabs.org>; Fri, 20 Nov 2026 06:02:08 +1100 (AEDT)
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-990703f817fso61423241.1
        for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2026 11:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795114926; x=1795719726; darn=lists.ozlabs.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hKkPpNGKPc9dB0PHZyw3/Ep3fUq1c/BlK7UqcWPEb1A=;
        b=drvIPldNm79FmljTZzyVOvkREU9u0btA6vmAY9JGeXCLXUpK6JhPqYmQsDu2XXcHDg
         qNLjSKI2pclGEy3qXEja0C9cCDues7MLgw5fli2x/Tv9cMgrzZT0yR4Zqt5hl9quVosi
         4lRPjNXngOkWZMHMyjdLKY1VfQAXKI2CU8wZGxle3Bmr2HLprU8W60NLGY7LElMOoDJ5
         SyRM9gXnDxy0mhBcDq/lWXAR4pGWbblcnnzRRFtRHY4LX60aF4UGdBqBiFEvfb56L6zP
         DEF7AIbXO3fwx2B/1Ubdfgr6TlKuZDPTs4IPK0tzB4s22N3UrWLR1zoo6Y53t5mGXaAa
         xF0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114926; x=1795719726;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hKkPpNGKPc9dB0PHZyw3/Ep3fUq1c/BlK7UqcWPEb1A=;
        b=WQEyOVFP3892AdAKjn2Xru1pLhUQdsTwv95TxM12rXAn/xv02MiwSP9CCQR5UisSDa
         1U2yXEkq+YUAGkKDlWUlcCWs2s2AZgQM69O82zMa0EM9n5NTOKyAHHcuWg+4PsVfVKmt
         nQpF7iudct348fynwqcn9WbgVMNdY62bKe6lcPrCBsj2wd1rbWdc2hGaE9T6oI3nhv9h
         Ax8PzwGDFkuL+dwVlH3ik7CdSTg72mSnGW6gzUpF6puIZCa3HbL1xzTaKjhwNmCRMC9b
         ldOJlIO1pSSRO+5A/8cTPKIMQQXqZxre/QGNl/H3ulE/nzt1JyTzkA7+yiBkQ2wJo+WK
         Vgjg==
X-Forwarded-Encrypted: i=1; AL+hErFZs8PL/pLxuOJ2FOLrmRP6/TrCztzPA0G5y6aJqSp9aBGpe81wPp20HcskevwKJcyffOkGpC4w@lists.ozlabs.org
X-Gm-Message-State: APuU4Z+XGOHrygxqbSJmxfXFAoasMmlyJ0dRH7k423zrnShlvRSUHHnk
	E2S+NHTK8p9KBziGQgO7N0BOqHKTwoRBkdlK1onNb1UUHHOQlDS5+fXw1bqGgfQy+14=
X-Gm-Gg: AZFdTZdqwmBu0mVxi4Jsvcfj/2d3Mx8P44uaDnGpYcdYtLVOuotwkej+alaQiyW6TrY
	VRn+YDwGiU+C9Coxtv5oN+g32vt0Ci5gbs8Q/f5v0vtDf360vtFDwRDjp3NlfvkNTATEUT51Tpl
	hX1gcjvszzKDv0BmgrUICVPTBdn526ERXWJk+8WG8X5Sf9eTGv2s4RtZkVKVWvvZl05ng6nqRuu
	EiASr4ytrZeofV782AlWdy5lBcfYkNobH/ab79R3+9jjOMYu48XLs0V/YV1ZNolJ2h7lcJMj4ax
	UQVkWfsWvhek+nKoxpHOWAK/Jq2r0SxDwH3akeh0upSb+144x3YV3b978oTObkhkgl78bAurGZS
	JAT9Nmq8svG7UqOa+xk1FiscV2GFydefgAELjyl/BWWLcbAVMSJyQYvwmnYGwRBCvdBO8QLynlY
	OGV3vabn6rQrC40uNnppZL57NtFGhK9BVxMToHGYIoixXhbNfIXGI+T0KUEdxQcs/+qOfrFyMuJ
	mzj3ho/1b4YWG1wc2Zgjw+q3ddHETX5fEEI4kBuY1JEqjx/jw4vBpyfAGWog0iEdEMwPBLhRK9Q
	kAY1yWgLh10AyC4/shKxmDpPJw8C6rpKm2m2Gp6naS1lVP977Tl76iA=
X-Received: by 2002:a05:6122:c88:b0:5ca:f811:25ac with SMTP id 71dfb90a1353d-5ee8aefbb61mr486259e0c.14.1795114925522;
        Thu, 19 Nov 2026 11:02:05 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6df8a28dsm809462241.4.2026.11.19.11.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:02:04 -0800 (PST)
Message-ID: <84fd9703862c225d63d973cf170b06ab7a962312.camel@ndufresne.ca>
Subject: Re: [PATCH v2 6/6] staging: media: cedrus: Use
 devm_of_reserved_mem_device_init()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Daniel Scally	
 <dan.scally@ideasonboard.com>, Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>,  Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Eddie James <eajames@linux.ibm.com>, Joel Stanley	
 <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Minghsiu
 Tsai	 <minghsiu.tsai@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>,
  Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Yunfei Dong	 <yunfei.dong@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Joseph Liu <kwliu@nuvoton.com>,
 Marvin Lin <kflin@nuvoton.com>,  Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, Maxime Ripard <mripard@kernel.org>, Paul
 Kocialkowski	 <paulk@sys-base.io>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Chen-Yu Tsai <wens@kernel.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland	 <samuel@sholland.org>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai
 <billy_tsai@aspeedtech.com>, 	linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, 	linux-aspeed@lists.ozlabs.org,
 linux-mediatek@lists.infradead.org, 	kernel@collabora.com,
 linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev
Date: Thu, 19 Nov 2026 14:02:01 -0500
In-Reply-To: <20260902200703.2016410-7-mukesh.ojha@oss.qualcomm.com>
References: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
	 <20260902200703.2016410-7-mukesh.ojha@oss.qualcomm.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Zy5+UcnjO9CPStg5/eKL"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
Precedence: list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--=-Zy5+UcnjO9CPStg5/eKL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 03 septembre 2026 =C3=A0 01:37 +0530, Mukesh Ojha a =C3=A9crit=C2=
=A0:
> Use the devres-managed devm_of_reserved_mem_device_init() instead of
> the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
> pair, letting the device resource manager handle cleanup automatically.
>=20
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

--=-Zy5+UcnjO9CPStg5/eKL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCav9HqQAKCRDZQZRRKWBy
9KPMAP43HkphsVrqQTwGITR+0glsiS4Fp5Wyse7t/ZPwvyRH2gEA4/6BFP8fPbe6
9p9JGy6Ck2BZu8qjXZw4UU8oUtkiJgI=
=GZdK
-----END PGP SIGNATURE-----

--=-Zy5+UcnjO9CPStg5/eKL--

