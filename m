Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCD4606A324
	for <openbmc@archiver.kernel.org>; Thu, 19 Nov 2026 18:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=l66h/6Vz
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jVnZ52f52z2xLr;
	Fri, 20 Nov 2026 05:49:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.15.14
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795114157;
	cv=none; b=lK7wNu6faTLq850NzG9+7isWaONKPsIRPItB534W02sAGWY+azGaCuKluFasc2xs1DP9Pulh9r8TBrPGTu6wrHglKmu7y/tA/B9AWyAwjCyxuamrguPqA4FaAHUAvWIq4wY3wN9ECcS3P3KRf01XF7wpdv9VxzygidU+8p9lTCFNSdGMz2aqt1EM6CjV8MJ86BzByspStziTuFTmutTxxKQbL0YwikkIPoNEm0HXgnVKwP2Cutqok67UG7osAXNiFh58FpJR5LmbKFuqX0Da+NfBiAjQri+0f2YU4UwkdTAhoWmpEovp4+efUt5plWtxTDhyaintxvmub3dT1FSPpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795114157; c=relaxed/relaxed;
	bh=fNcd/76aM5MTcrfMOzFyypyODbWTEMs3q8aCWnQldd0=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=gorueGkMcdbHR/A+ctbmAhJ/tGzIkOfo3wwjCQWH3qthQCw0ITfi4dfyXS+ZrSYslii4gSgt6UFjIWymfOkSRvzZKEon0D94kf6o3J3WxV6XGf9vmFPYeEqQatf91efOD30gdeRXrSvhzG7gjsqA9SLvW8IKX+RHXBn/0gEBIMVpLq2YJjy3fpKbhaIklWB5HeUQAUlSETlBcpWhLpV2Qka+AKwXRIU9vLrbCQ/F4WnxtUwjmn3SB3r1zLC8OGhH5Y/rm7ZSFcx4gVf1EMHqXGnNTXAUpamZacDn5RiTKAxmwVMO3ixgBWvBkPFsIZ2qvg0Gw2Z4d8CpCNn7k50Bjg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=l66h/6Vz; dkim-atps=neutral; spf=pass (client-ip=212.227.15.14; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org) smtp.mailfrom=web.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=l66h/6Vz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.15.14; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 333 seconds by postgrey-1.37 at boromir; Fri, 20 Nov 2026 05:49:13 AEDT
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jVnZ135vGz2xH7
	for <openbmc@lists.ozlabs.org>; Fri, 20 Nov 2026 05:49:12 +1100 (AEDT)
DKIM2-Signature:  i=1; m=1; t=1795114147;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz4=;
 d=web.de;
 s=s29768273:rsa-sha256:PRuPrN14NuwRaQXPO40H7OaE7ANm
   klk3UDVLg+q8x5R5/rdCqsC6QTiTXg8GFDTr7HPx5w5E6bZG4RAQRkYNiEAwtKJ5MUGrruLf6ET
   8yLcV0eT0Sy2qJxnbxKSo7pRT9H0C3Of9BLmQ1QHcLXaYvW8CavIUsxTyCnUorMWUP99N6aodSj
   QNSxOK8PajD/2Ibqy4anwBhFqMjNbe3NJq3OQ/li29OK+NxakFZZfNbIoYYqE9kS1PBiGBFkXYV
   tlyN41LNyelHg5gaQcPAR6ggfYk931jwdxe4w93d/KTclSgug68Iz/PZKK2bglTVZuEnyb5BUA5
   h1e1xEhWwERhLQ==;
Message-Instance:  m=1;
 h=sha256:
   SC2lhKKQcHGI9/X0juz9QHfxX2zpathJ2rkA2RNPGSs=:
   Bw5uRWWKdDmHlmWbfue9KfkSwgidXb2jBVTD+Jamp1M=,
  sha512:
   fIdnE8yTmuetbtoIQHz69dmuvX0/KcrlkDVxYSKwfEpJECLKFSmDdZvpMWraKVGZtw1wqIoZc/mPfF4qnJ5qZA==:
   /6iVx7R0U+cEYaDutKOvRGofwTAuj7LlQOIV/17zNwUjJEa6dB2odRnEmo0EIe7wXMctntaoEVR7XJmrqiVung==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795114147; x=1795718947; i=markus.elfring@web.de;
	bh=fNcd/76aM5MTcrfMOzFyypyODbWTEMs3q8aCWnQldd0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=l66h/6VzyDGDs67+VPfnE6GXFUwzpW2nGpCrjPz5X05gkcoQ1int0j1sr4lIEb1h
	 sZOHh0QPzchmr5MPVdjY4LPJ+8ujcOzreqfjr8u2qrVtaAB940pzULdt/Xz4c01tA
	 KHBzItcJunDIUtHDi/jEI+GCnZBWbE2wv0GpszV3HO/qZazUmZjSXQ2i5EPr2pPfU
	 rFlHNcdc6pb/NQoy5DpAGAOTpe7kS+7bxJn0qjy8wgLd/uzl7z9nYDr0An0QY3BN8
	 Y91j42/NaEXrYUBOwjGOLlOVE9dZCoQagG+N1GiYrAgfSb+TORr28w/qW/BFNEmrV
	 x29waaAPyMHN/88JxQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MzkST-1wYjA71GRF-012up5; Thu, 19
 Nov 2026 19:43:18 +0100
Message-ID: <6d2450cf-9bbc-47b6-9ea3-f91bc1b91371@web.de>
Date: Thu, 19 Nov 2026 19:43:15 +0100
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
User-Agent: Mozilla Thunderbird
To: linux-usb@vger.kernel.org, openbmc@lists.ozlabs.org,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Avi Fishman <avifishman70@gmail.com>, Benjamin Fair
 <benjaminfair@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Patrick Venture <venture@google.com>, Peter Chen <peter.chen@kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] usb: chipidea: Use devm_clk_get_optional_enabled() in two
 probe functions
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XRQQ7DbqHTHLlHEckpLK7q2Gme0P31h2PSBHvJ8rwEaqZEgHp1w
 2LmJGpHYqdZ/SZIOTWY6kXocJtOGA/PI3yofzNvjHRwMYk4XlQUfwEbO3WN3X/gGa9ocIqT
 19XxL4ewvf0yO+TlPBuB9GkVfiITiL/30PyrJFLKR2jEG/7O2WT72kEQYXvTZVPEJdEGCoH
 JcMFdpYITetA0pBeW4CCw==
UI-OutboundReport: notjunk:1;M01:P0:kNrhKvcCovM=;BwA/eHA2Puu8dg/6XhJYsjv/q/0
 6frR4nMjV2/bQZezR6Qkbix6oB7tIvlkdBagwNPmbKCe2pKd8pUhCbxS+uj8ZVcWnM6+GtsMO
 xo2OoZFJymytCVS9NMo9SVtVe0kKvM12Y91WhPZyJszdD6TZhN3KppLZ1nrDEfqZCPalDQGQq
 9mqMo+4b1EMx/rbJYpoM/UCB7+DpbNhFYgnrF9xgoka2a0b0gMEBGich+xyAOi7/7JwfpKZqk
 Cd8Ihn71DV3CumSMNvWCdkWvwVmUpLqXjc4uGvMz3S9DWD9mtZTSzzKW/MpoKte2AlwPwUGlU
 Pl5NaLxuiZlfM04Wg67b35qMQvqO3QugjsyVPnmQ8at1WlCasrRTAoN6QmVJrwKpY5Xpw1ZjV
 8vNXvjxaAFGF0zA2MOYFWqxpjPARNiXhepnET+3xQ0gir+0IflD4iE8kDPqfWTB00DDAELC5O
 amMjqnR8Poje05WmfJrbyLsE2cbO7xDIP2J6NJljZEvvzgczPx6yVYjB2XeENm/e9F7Q901KQ
 VinBxev0F7V3qP8jtu9nuFcklQYfiZskUHBIzFlumbgKE1rDC9dyZClYs19F7YhDR/yXpNnqs
 adumX+U1KQa60fbwFRzmZO7GgBocYG6VmYHltjx/ix1WNxJvsM0EKmHASre5tfO9AcyXGZULe
 bnaWsOqUfaAd5HuI+nbxei5ZnIYxZAGvj5gXH7jBu0bUOG6UT9RTWrdVGuyi1zixxKQH8irVZ
 Toc7qBdbIXv6IGe3zCt2G7SiqMyQkWABmtqFgOqeEFSRPCFwkEs7G3gl2Qb4DAMBaxLw+/LRZ
 nvJtIefeLOF3dWvKWTz/lsn+JzKGYuUrCBbZk/f/Q408JVsi7aXVfMwqoOCgcyukEgykxaTCi
 yD23HX3BUGfINU9WbPb8OZcuUHwYWVC5k0luN3oUdQ4sqTKTZTDt4l05AhSxHMhWL5dex6pTs
 I2UU+lob457m7VYF7I3FmxR6TwydX90SFNTImsHllzkOPrxFiUDpWzHkDD4Lu2NTfWgb++e8h
 9AIeGlmLnZBT69SxqbxqK3l2vByXl8NvD8mNp6xb28+wU/A3kcnpE7ZdqFTps9aGep4OYpX8F
 jUD1PM2eHilXSVexkiyXvmV6XFCyU0RiY2a+rRSWEZd2APo72lhuiMwQOxe28eSdv4emwZVjS
 2CsfDtQIdOY1+Un9apoEn8WrmljCLC0YFql21UCOXPnIR054GSqHzQuw0SujSVt780/jNRvpp
 a90mHIudIgtSZoAPsIkmCmQuDJ2rJ9IX43oj1+5eXq/voJUgZceX+wyC0PSyYIqJoAK6MG2AZ
 xmU3dsuV/x8HwhNKVPkJ5SOxieCllLbCMm47WhMbdxQ3l7b/WTlub68n6A+wme4BvHODml//S
 GFNtR/ez53Mh2ItQ4cLIshRt/5nOJu6ynExrghekQaGYBBYUjWkPuQohZE7Hu4baOaWWnkNO0
 j8OQUEbhkWlc8p9Yb3clilNWDB+vOe7KxoMUue4He8SEhz9rGTHnZWCHErNaVbM9VuOi861yi
 4FhXOmF2trHaTzfVghk9xhDIAyR6Uwv1sJepUBOOoybz2swYbauRkLabLNwd5mWtp8E39/eNn
 crpl+QPcmkAkDtEi+GYJ65fVqRAytsYZfJMQ3ka94ULH7oZHbyNH25igW5Cmo/41JFb1Fdmya
 +4H4COUs/Hao4BKif1J81BGiohkGUY5/0dpFSGZxkfFvCO3/ZXrdddpU+vvvs9kKLoERPrhDo
 RVjtsSVFRrPwMMbifGJtQ1vN+Lxa2AXc5E4H8+dY4Gk1VBXSXrrocVdLkF3V9T9LOrNHDAkmy
 nRpuZLbKLJxnEyCfICIH/PLLY/bI4YrAwo+qJPTZwgH8naa9QWhgue2irlG02GNF/rTptBMB1
 iu/XdsNR3Ztbw6fOZt/Zvu/zEyOpHaYWOmikayusfqj1H6M7ASXxa5ddezuIGzXqNPohP71vZ
 O5OEA1juQd4ih/L+m7db5ng4rIencN87y94TPM6Z6pYHymxN6UcRGg86XqQPk2VSNm/bCJxJB
 U1ANTaUBK7qnJpLV7b5x7apzUVh+9ZLhh0Kd/wIu3q5kbPh4xouOav0LjlxBS7fgZTYQaINyq
 bBPJIaFp8675TfCiyMDJoTV5Xb0iVBZ19NA95IRGhWIp3tV+e27VBwxUc1VwEHEsQLKhyKD51
 yMt/Kis2+lDEcK1XGW4gnbmlp4Uske4h/UJH2D5h8cm55+ZX/Rga++7rMSUZNEleHwT1qTl0i
 PoyMCEcE4nMJgngc2UFbllXkaFeph9LSnNQZdmqUKWANJBBETd3nCVnChWn4o0O1DXsHi42Id
 aKc164CumKfKSlFe5m8PMU5rwPunr2ZXcqpJIXEl3cLVOT8Awlwj9Quump+5IMpD7xlc9L0Kf
 DvB6wWUERD+KrPO1w1iRsTYWKUiedVZ1aQKBOEI/dvZ2fIjliV7ulKRyvFJCIrRRyMlaobakq
 cb1L+vNQ3ObrrCWxdbhFwVfM6obp89QWlcbo8RG46QvP9zJjCo9BhGHL2cb2ZwjjIAaI/wZXW
 AmWnPCKfqqV7Fn39lllPmr+RFKSJRte3nmBvliYTULIWYb2zkfUFetN6fSxSq2BLU4CFahqT9
 6AM//sZz2ZhrH0CegEorSWc9nq9czGt9ZhUtRw5U9ZhxSF2iLC+0f5Gr31qK84nAeOLoPVF6W
 zf07tyQdbd+dH0/Kt//6oTtS4n3jWOOGcJz1EKZUxxvaE7x8bSsXsDz2zlTtRA/LF9OAtzL9r
 Jkv2ZjcTBJtw9gKCZR2/woOeOTLsB8LqXWWj2pIChAtQcRaMUCI7L6KBX5xwhPJrE+vTgBPF1
 qCap4qMDvzPy0fnjZS228EHoVJPONprvNOOiy1+CYW7JzicDX7t4Gmh+jB0E3ZfQnZoo3DjSP
 yXeTNNgda1IIMGA86KEKXSxEjHaggBWSF18eq4OnLzJOzmu92ml1fFgvN0dNAKHGRFludB7OF
 1OL0prsLRWyWPSSO+zUme5P1tc81KtQp0Zec1KO5AbwlEwnL/eCWiVmsZP7tf/rjuNzN+Nn1s
 7wLBuP27mNl0UMtcCzSCHwV/1ttoh1FKjKd8oPGBievOeZRUMM1by50maGqon49UDpAJx+wNR
 WG6eeF5ruMWktRltHoGWsMEyUuBQPH9cyxnyQhPiRI31tkjufVA3FPkWTUUGXBwIVgHfY8wBa
 0jTzw7JAp2BcuOWEutIIFNpNXAqlcFXnYdNIqR1iZHKyPcn+CjP/RWyqvpt/TpAZQOFZlRuX6
 6bd9oXkg+cxYcpuvsLVQvwqzSyqWdO8FIsDCJJF6bzZr1RXxKGQ2+DZNNXUTc59EUbYJo5QGQ
 JioCoMxIrb9f8JuDV2Cu7XMllnchBzSdBE4cgqTV3+QBf8ifHeSeTBJbWBiqm7n5dd8zCFNL3
 FF1xgiY3HVXgGeZiB6vvJv0NfqjrkRBXYt20337C6P7GzRge9khKlkLSfGBqScEKiAw5hSzrd
 8SG07DNPkKnK0kHIX8JqgMMYe4Mqzv1B01gxvgTAYukY/CjPERpw3L5uGg68cNyrbAoB039mt
 TjUcq8/8vXrtXEiaq4x/Oi8J6/L0tIrCllyHBB7clTXY+V5+DAZMk08sb+Xc3y5tDTf/4ZHZ+
 db1hrFmsKqabt4WcUQryC2eQZJhUR2dxKuHXXpuHHediZT2DI6cYaeM88tylRkFtP/dPkdTFB
 N0aRSIAplOudDviveyLoTWuBxK1D8yDfSv1cDWniYB5i7EnxwShIsCTWTDkv/XM1oqfJwKZ7u
 WdyVXncxHFbEalX5wu9Y62tUkNVd4f2Qgl6oZX8BSsqNPazgdyloV8gZIvoMpJvKne5PWRvqi
 XAzYysIJuxeTOkL4Iqwz4FApjrnshwbAi7G+0owfKUBEqxFYfrbtp0tdwyxg+CN1lRewprhnd
 +qzpiU6df/uwx7Eo2bcV2njUP+xe38oWel5AI2OI6Jc0CNY6Ig5KsOdMyzap6GhXwY85ayw5k
 6nJUaplnpnmIcJt7KlqamZsscPaigUrhL1U2K71ZOpsJFqMSAlB7nFLeoR4jGOhSFm0hwfLzs
 FswxBD6ArarzRhFOZU4YJXBgoxLygvmp/mfd7LpGFGVuvQL7j2Z4EcEXStitBd25HL73HRQ5h
 EwMi0XeYnu68F3arNpFa8BBGSg4uVBrlQK6sgogFDM7EadbpVHBsG+z6jrcyvbw6LtsldWMi6
 l5GF4Bm2A6AbOhjvP+pivqTyspT6FQUQOe+x+UcTNKk3TYeUSooIL8jDfa8HJ9WoqUskluyoV
 j6yrXgmWJmq6Mwp393ywzpZYWvwUuR1ebX9T2AP+cef/Ke3tsInejCidkAfoVNahqqJSGaMwY
 elQD4mVWtss+/ywXFRm1qjR+8tBLuGPpe9EgDGS2FEt6Ai8lDEjmxYBLLl2b5ydUTkIVTJnpv
 UfbT6wS8/F6pk2e3ocibNxHB3G38D94gDf6y9BjF/yMplv7m96I7ZFcTkydiLmv3k0xndyN8W
 w3IVu8MhuiM9XEi5nPLb2GOIukMgZai/orQ287EI0YF9zPfA071Wm33Pm/UQyWAe9bNclNkZU
 oWIh/vkmnof57vZzXeabh5l7TWumzSCwY1iR4g5n6ycwNLJLhfDmk2sHUVmCunxOp79n8VaMG
 XliUp+IM1M+gHmrp4rdqJs5DoN2gKULHEfqAaNnWsdEs55djE8mLpc5J+xEaTmx+J4dER80uF
 8hd+/T49T/zDr8W5b0Wyr2UUbsSN8mi+4wdI6cm/94PIC+vHDk9/5rGRgVZ4sk/EvkxfzaERE
 jsSh4cIo7wCT9EHiW4meB/TDeZIu4aNk2kQirnZOnQqci/aSvfqoCMLpAUpngk4hG6PORbSSf
 gWGFddLwF7UFcFg+XJHPErJl1rwHfbTKI2F/8IcfDeiU1Nv5ouYokAje4Tl7JjQuC2BYlMiEN
 Hc/LcF5+9tQMaBLLwSOxr6WR1wdbu3hJDloi1Cpx4E5xNikKASfASok8MtJ8AP2iuKwwxqEs1
 GstTU1WlaltYhkCNxr68b3jfy/2CQ0CrefxJumSssMOiz9iywLSwZsg9BWQHvWRPPE1SS4mDM
 CpRXE4wffoygGVqzcNSbiOcIGvHdG3mF1W/hghO84GpZl35++a81igVzDd7oOK4e1bRPu7/PW
 KbBbrA4gFNIyuGjt57NpT8Tny8ViObjNhFm7gk8+B/8LxrlCwc0FHgPLUMB6iU1/aHJJn59Ds
 yrOd6Q0cB1dsY9wtjXiUeWcMV05GUPxnqHDQLJzwrqE0qsO47Ha63kCGpTKUyiWWMsxgl3xdT
 Rx/f+ZjIS8DveNbc2MK7tzDaKzTpq0UNllW62xmDu0+7jEqpR7m5v/+4RlsdckD3xucnHZoUh
 E30MC10uM+iyyNfU9xh0CTYg3MvzOErXDNbh0ubBx7lilUhndLMMbDa9zDHjf0aB7Nq9kNsVe
 LoNNN6AnJel2xMRhrZuvv0qzmMnpfhfIgfb4D56wSFb9dXRCx5kVa+mY+N7jTXroFNj8/aJae
 JX/T84glIiYBj/2x3J99BRc9MGYQoSEN9aMyaeze/XVRmXoMQhlDL2lxZ2uDga4p6tEPyxsZ1
 QgLPwSplu5aJ917k/mY5nzGBGIjL3SVAsjDQjLh1TIPvbC5frRSyiXkRFcHjeqAvQJuCeE+VQ
 HXD5OxsS/f7XZQG9ntcWO7f3rRK0Aew5CIRLr+I4s4BRVTQuNb0NmedYsj5U6SJyvhR+1mD0+
 B6uCNnQ9YQGBVN8VdWt6Og475i8JMTgrEBVN867pWsxKbZbVY0YM7NFpwU7oiVBvm5fV2PlkA
 o3UXtGTPZhi5+MzdWJasjxJOTh3B3elPHoZDYLwrr9w5ZPmHP1K0Gk0+cbhEW7tllYTKBgQLl
 DR/X6QVrCxZHXIeALT3SxAmHgxtJjMVywh58ErTXBxq+trsjBGwUDcQbnF5WZw1hJTuBWb9rv
 fdOqY3bfEryjHvyN1by7J+xwVKwZIsUBeWPnY1sOXwUs/p/yCBIgG2tI5qiPFRhXNlpZgkvDD
 VvLx4pmIh56Ifuc/U0zmgE/pCQdAfXgZcRkxQ4zf90uVepUTyDOyymvj622PHandnQ8DmGbWH
 +kA5ankwzEcsKMTv5yZtK//W8d3HbHfj2EKPEidUI+vYoJ6rD9wa0yZfCChVRk3O5qlFh6R4G
 1a03634ysdmRSKmR+Qf4bGlyUC2OqPQT6MpgWW/2iC7vvIlaQIq4Vq16pYviqsbzrfdp7UKMb
 sNki1Wyf2guCjxHq3qMT89k40BvKRijZVu+xfXux50qi80MMioD5AoZMsjZ/jAiMdGa0PN6Xz
 aReFTxlEReZJqM9+Rln+vmO8FMG9E8Xei0A8ipTCHXWzfcG/YLaoxFZgAw/dOj4L5NdmgMaHJ
 8qEZdTP+/yXw/OhyE+O9tLpQECYrx0bc/rVzMBxeMLTQaaYNVYsrxNnkEDMfwluqNsgB29fYo
 3BQCg+s7oSSZuiEN64tDohdCSpCsqfct1hzIgUJIzjIkdzqkZxKbI7gL7hx08Ju64M/XXcUqP
 sUHAYy5FQEnWl7j7Hgo3rYku1DjfUjyuoVsnjQALkdBIrSOyPLdEBApWsfp8AGRfRlsIJelht
 /9PFcOpn26S5qRq7sm6CnP4acy6QaIR7iPOJa444E+YB/JCTFx8sk6O78c9Gn/nwfZwE1nyY6
 +utsvMmdqMH1EOpbgf3Ky6QTf/mBWmMfLkNIo4za+q84RiytkSgIBLnhTwoOUuMXIbjwwR5up
 2V7uPDL1PbcEmewTxkxRalPo4v4rCxTLrc01gy+r2fuPzHlo6CIGuZkP6kNpjcAF8t/aitv8Y
 lt4kV82WccY64QUtv11d/r3H+Xe/Guj5Bf2duZxP5odGfyKi7njEW+6HORbaVs61f3Ov2aCLE
 m8E99VGXWLShbldHJGhQRWxNvf59YYE2NfOZNgGxRdAAeJ+bB+v2aUZECcUc6/dpLUwOMpFJ3
 frdGirdhMu5DMmcopDnqxF2Bjc8FN5DeRIh2C6L7gRqfTh60H9FlxlirL2c4tS01S07LLkIsS
 NDy3nt8ADH4O/gcAw3WwoOyEdoE6GaGSryROnhI7r+ueqBKh8a9hJCphC529BxoHKn6237tns
 EwygZkQ2sqqyCYynTomPKodBuK7j/3XlNGZmisZVImgF0hJ4S47WIc1TXkYKi2Emg3syZKO81
 3/ttbEQApe5Fw/+oiJAGp/9O8Mnd2s47GBIwMPXSDLwzABHnzwBgavjOirXb4MhV1YVtoUFmW
 EH8qNKtWyw6hBaVtwtfoVCXyVKGb7IFedJPFvAXKEQLrj/NibfxXuP2PbEi0nhEdSULKd6zUt
 QsqfwYDAJtKWH8ROb3hjshTS6UqWa21/W6vNnBovPlWBIMuViPNymtSj49fFuTN8oHlw5jOAg
 pqnAo+rYJNNwHxA2SEVFa8PXlOi61CJtbLyO3SPCGEdhyPVJTXdIVzn/g/XIJU0f1Y46I2obv
 lsRSsLZfpj3Al5wPIWSXEGUsTFkk6HG65YYU6oafOw1Sq6/zViKjm/UkxVEPHWgIgNdPKOaAG
 Tnx8x1OJ3PI+bUDqMiWwIjzzUVVJi5tCVcBI8X+e8AxtIkjJtsyTHdRNZAVOFY2fiCy2HDJOU
 hsThVzxIE31a0BDRY88Nbun9Cj8lz6f+AP5OrJKPBKKKc7CEj7UGqUYdxJOdazjzTf9/As4pT
 03LNT6sHS4qKL4N9s/Q1iVcbODaJownInAlBscT5VHUdAbdGIzlLw9e1Qei9eY8McclIw0OcX
 SS2kFnEYFQSRg+jvPOfi59ieG6FeeIARryK5SwF+o8ryi1kpG3C7LiMD+tOvZDlEIvKKwbuCh
 Mc4/RlhJZp/OY5eKLKKaKWPPWFabY0b+UNggwAmfI7daMY3tHGcjTjsmwNH74di+/FoUcZ9zu
 xTWrQz01W3ZUEncjuXB16i4q/wr2SLjcDArmR6O6ZW93Ok0Z33HMqwvNwbs=
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 19 Nov 2026 19:34:37 +0100

Reuse existing functionality from devm_clk_get_optional_enabled()
instead of keeping duplicate source code.

The source code was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/usb/chipidea/ci_hdrc_npcm.c | 6 +-----
 drivers/usb/chipidea/ci_hdrc_usb2.c | 8 +-------
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_npcm.c b/drivers/usb/chipidea/ci=
_hdrc_npcm.c
index 75a0223b578a..5052287f69c2 100644
=2D-- a/drivers/usb/chipidea/ci_hdrc_npcm.c
+++ b/drivers/usb/chipidea/ci_hdrc_npcm.c
@@ -47,14 +47,10 @@ static int npcm_udc_probe(struct platform_device *pdev=
)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, ci);
=20
-	ci->core_clk =3D devm_clk_get_optional(dev, NULL);
+	ci->core_clk =3D devm_clk_get_optional_enabled(dev, NULL);
 	if (IS_ERR(ci->core_clk))
 		return PTR_ERR(ci->core_clk);
=20
-	ret =3D clk_prepare_enable(ci->core_clk);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to enable the clock: %d\n", ret)=
;
-
 	ci->pdata.name =3D dev_name(dev);
 	ci->pdata.capoffset =3D DEF_CAPOFFSET;
 	ci->pdata.flags	=3D CI_HDRC_REQUIRES_ALIGNED_DMA |
diff --git a/drivers/usb/chipidea/ci_hdrc_usb2.c b/drivers/usb/chipidea/ci=
_hdrc_usb2.c
index b0200c5937cd..d33ab6873def 100644
=2D-- a/drivers/usb/chipidea/ci_hdrc_usb2.c
+++ b/drivers/usb/chipidea/ci_hdrc_usb2.c
@@ -70,16 +70,10 @@ static int ci_hdrc_usb2_probe(struct platform_device *=
pdev)
 	if (!priv)
 		return -ENOMEM;
=20
-	priv->clk =3D devm_clk_get_optional(dev, NULL);
+	priv->clk =3D devm_clk_get_optional_enabled(dev, NULL);
 	if (IS_ERR(priv->clk))
 		return PTR_ERR(priv->clk);
=20
-	ret =3D clk_prepare_enable(priv->clk);
-	if (ret) {
-		dev_err(dev, "failed to enable the clock: %d\n", ret);
-		return ret;
-	}
-
 	ci_pdata->name =3D dev_name(dev);
=20
 	priv->ci_pdev =3D ci_hdrc_add_device(dev, pdev->resource,
=2D-=20
2.56.1


