Return-Path: <a.amelkin@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="H+9qU4MC"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44k2Q42pQvzDqDf
 for <openbmc@lists.ozlabs.org>; Tue, 16 Apr 2019 20:57:32 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 78BE041980;
 Tue, 16 Apr 2019 10:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:organization:references:subject:subject
 :from:from:received:received:received; s=mta-01; t=1555412248;
 x=1557226649; bh=6nY2s/f/28N91jFQluy86ZzxRJNgwvwQupVfQw7ZqsI=; b=
 H+9qU4MCtqjMQ0zw9AaH6KMX7+VlueuudAtXofXP2TJ8hopdThMwUVk7dA52Qb9B
 j+lA0R+EJWO6o3o4uWGF7EFvQaGXW8O7GPUOky09reYw4mxXYlpwxVsgmMdHnlu6
 GCGlXMmVAZddnvOap45BYESFZ5L94LmeswB+dt2Do2w=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Q4xVwWnpcUR; Tue, 16 Apr 2019 13:57:28 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 7C64B41943;
 Tue, 16 Apr 2019 13:57:28 +0300 (MSK)
Received: from [172.17.14.197] (172.17.14.197) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 16
 Apr 2019 13:57:28 +0300
From: Alexander Amelkin <a.amelkin@yadro.com>
Subject: [PATCHv2-modified dev-4.19 1/7] clk: Aspeed: Modify clk-aspeed.c
 driver probe sequence
To: Joel Stanley <joel@jms.id.au>
CC: OpenBMC Mailing List <openbmc@lists.ozlabs.org>, Ryan Chen
 <ryan_chen@aspeedtech.com>
References: <cover.1555409110.git.a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 mQINBFj0jdkBEADhQF4vZuu9vFfzxchRQtU/ys62Z13HTaYK/VCQKzPnm2mf593Il61FP9WV
 0Srt4t4yumiXK7NhHeqktN/YZjYDYVr9l+vZpNydOHpDjk7xjPgb0KkoFCo7bcQ2/e4AtLTQ
 XGoWIKv983vWlphPCG1Jof5jH3RA7mccCNXtGlzVYF0RYR0/qKGgsoBymkldNKPwgPf/3SXb
 QY5V3sJ5SHwDjmhg3MYnblV29OULdi72DKI9MkhTTHQFlA++CfYstx/cZ1BZwWmoMgi0umpj
 Pf+5mAkmTtlPW7U54EUgFpvTMfxRRS7yH+iTlvngduYW6jryt0zm6r7M2LGR+uWGSTmWBB7Y
 t06D0Xrm0Zwl4alQ5WDrlUTkzZcXDb0QqY7UkQSkghLmUjItEj4Z+ay7ynIsfjQe0OYdTofh
 dY0IUxMxNm9jeckOkRpSdgsQrTcKIOAt/8jI62jlzN1EXA6blhASv5xtt7I1WXCpDU+mpfKf
 ccUVJfmd0Q2nlG64L4Bv8o+iBI0Xu5+EX2NzDKQF5vSQIK8mwniAPT16hi80mZG9EQf0fJ1C
 p7xJGvwA6IiwXWsAqhNRhYbmNDfiR2MMxw5DFdQSeqoK3ONeeIwrJAPNdme+Z1DoT2+ZuZP0
 nfUa8e2QaMHkXwCz9e0cI2NUmAwFJ9Qg4L0eyhdZP4rQ1KCg/QARAQABtC9BbGV4YW5kZXIg
 QW1lbGtpbiAoWUFEUk8pIDxhLmFtZWxraW5AeWFkcm8uY29tPokCPQQTAQgAJwIbAwULCQgH
 AgYVCAkKCwIEFgIDAQIeAQIXgAUCWmWolQUJcjFDNwAKCRDok1h7W3QXjTbXD/kBcitVfbx2
 7U00CSBwO3XmlNhgcVN7a83NQZ5W16oUQ0VPsFrL8qxRrpiqnIr+D+AUhtkI5aJRKX9ln69q
 TTSdodYnFbKCS+2mTHvtYnBUOl4Fm+deUm98fAyIyHkqPu+UPyOE8/M2zWwLuwZ6xMt6mTNb
 cQbauY2dbBUERuTnYh4SP42ZiMgwsf7sPEm2W+yLmxf+s9aZStwLXS/1e8oBIoS5Io403OQS
 U0W2RUPp/h0b6M9H5RFvaXuzAnmA274aC6qdWlrAB//m65Lo06puZqc8//SuQlDyEx4/bn/P
 NYDAYzQV/KoTrzBluGZUSMEOU5oSkLamQ4xcZY9ngALvo7Q8gTjrdKczO7nulS+rfXiPBP79
 5+O/LioJdbybbZ0yDUJzIzqapjBsfLink1TqAKY8VPc0QflWnaqRHb8uo6ykfelswCLpy1IB
 mSRb+Y4ERxIUbkg+mPyjr4tt0ja5vGqECAGsBwWlJ+ONt7gUIYJdLy54eWwYu/ul9XtwJypZ
 auOMjvqn09RF4HBcghL92VdBW9VV6GMy/ma+TZgcy5CSd/UN9rQx11iT1gwAhLnkni45bOIr
 0lpmnz8uNeIHL4OdK+dMcypLvPF95bKazw+iiAAHSv9MZmu3S4ECgHoU3u1moicVqyBmujXy
 GFLL1P+3HjeZ494/DpGNOnF1mbkCDQRY9I3ZARAAygmVNgjvxkqud75kP5fwhmwMVu13sLh8
 QnZxjMsA9Zelt1Hu+BVmjET7YL4xBhdJDZ4y3UI/MV8ZzOfJHUWSNr6POwKIrsQfGzdlgB0e
 w2k6Rm651Jp+aAsygB4GR7BopptJd9d/q5oCnZxpPgDpZOBCpl4DQ3fJIGSc8iQVmA84lHLS
 +mqIJ94PZ7uza4F0ly6Au+Hbkhowh/1q+BUd6Rn553WAmPAG7g0lAG/Obq1m77ovlR86yY5i
 C503QKlPJELSNYtzczuLQZetjDtaFkugke4QMlhzHyc7DjSsjyccdhepPtXWEm84jPCx1/KU
 3m9jAWtPdARQ73su/fiitmXAifQXJBB2R9fmKuM2F3ClHcJxv/l0W1ruekD9vojOO75yvBEG
 7fGlLc9hUgIIGgBJvI+Yb1/KhqWC9r53TS6kcuCi+z9kf+4MTBge2sU97DtivZGzul6yhrcr
 3Ic5paWoaka2ClGqKBQo3A9o4F60q3rRq5FAcMdKQq7qJutCzcjkcCpVVik1im0u0+UGrK0s
 YQuAgTu45mJPOfINqz1xz+qwxSjYI/wjxJaYTZLO68CIdBiDj+zxIeo9o/mUJvS+DhnPzKhW
 KXToZl2D7VdjOlu8zZ0tIFYrULJYhuw2f/KwD1lwoehlKikEE0H0xkPygufjtiYo6jTb+BKa
 sG8AEQEAAYkCJQQYAQgADwIbDAUCWmWo6AUJcjFDNwAKCRDok1h7W3QXjc9vEADXse2POSaT
 M0uqR3KGTeF8XVKdyRqK9afWbMaxFzOWGp9pNtcmIvfmyE0M6LPLgUb33jek/Ngup/RN7CjZ
 NCjOc2HTID99uBkYyLEcOYb+bycAReswjrv3a49ZBmmGKJZ+aAm0t6Zo6ekTdUtvlIrVYvRs
 UWWj4HdCaD+BMvSqcDZgyQESLI9nfEGuWtVqdi2QlZZeQT7W+RH4lihHKTdzOsVC93o4h6og
 ZvgOJ/0g1SP3la88RWONejHxVbGzBOyNjkH71CFujnAfuVuuhkJaN8PY/CS56sKMREKJOy0L
 vouE7eSU4bp13GK1xsnbWcDQpyzTsCsP9taqQmeld8Hw1yuPamc6fdpKNyPHyN20vzh20f0C
 QUMAjh3Vym12aKhyRan08VNEaLOKiyya6+i9c3Z3LiWUEqTSzELCkesb68UQVtE6/CXPM2P/
 vs3EQuLFXBC/rD9lurT0kG99xElAbKjHLer5NSw2WA2vQXaFadGNDyHI32Yt2cAqWzZtVqmN
 ESE0npJ5eeAcVWPHjhCwL8phZCDtfxJMy2cqYS8QLIBGfQTIHMQAgqBbpq9FLXCn008tvaTr
 KijxDkPtWeXDLbMgH1kA46gTPJWxsm0c45w7c3aXhXl4hOgXp+iWDTOT83tJU0zoD9hYlpZf
 dTYsE5wSxM06T2l/MILupCNZ7A==
Organization: YADRO
Message-ID: <7e73f7fb-c9de-5ac4-0d5a-3d24cbed4b5c@yadro.com>
Date: Tue, 16 Apr 2019 13:57:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <cover.1555409110.git.a.amelkin@yadro.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="KPgFVlUPNAvXnZZhXVWsoMytdnhEMNai5"
X-Originating-IP: [172.17.14.197]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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
X-List-Received-Date: Tue, 16 Apr 2019 10:57:33 -0000

--KPgFVlUPNAvXnZZhXVWsoMytdnhEMNai5
Content-Type: multipart/mixed; boundary="YpHbiRykUzBVCstrnAyBCKnQbvk1A9Qon";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Mailing List <openbmc@lists.ozlabs.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>
Message-ID: <7e73f7fb-c9de-5ac4-0d5a-3d24cbed4b5c@yadro.com>
Subject: [PATCHv2-modified dev-4.19 1/7] clk: Aspeed: Modify clk-aspeed.c
 driver probe sequence
References: <cover.1555409110.git.a.amelkin@yadro.com>
In-Reply-To: <cover.1555409110.git.a.amelkin@yadro.com>

--YpHbiRykUzBVCstrnAyBCKnQbvk1A9Qon
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

From: Ryan Chen <ryanchen.aspeed@gmail.com>

In Aspeed's SoC, all IP clk gating and pll parameter is in scu
controller, before IP driver probe, scu driver need prepare for it.
So buildin_platform_driver to core_initcall.

Signed-off-by: Ryan Chen <ryanchen.aspeed@gmail.com>
---
 drivers/clk/clk-aspeed.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
index 5961367..9cddd40 100644
--- a/drivers/clk/clk-aspeed.c
+++ b/drivers/clk/clk-aspeed.c
@@ -573,7 +573,12 @@ static struct platform_driver aspeed_clk_driver =3D =
{
 		.suppress_bind_attrs =3D true,
 	},
 };
-builtin_platform_driver(aspeed_clk_driver);
+
+static int __init aspeed_clk_init(void)
+{
+	return platform_driver_register(&aspeed_clk_driver);
+}
+core_initcall(aspeed_clk_init);
=20
 static void __init aspeed_ast2400_cc(struct regmap *map)
 {
--=20
2.7.4



--YpHbiRykUzBVCstrnAyBCKnQbvk1A9Qon--

--KPgFVlUPNAvXnZZhXVWsoMytdnhEMNai5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJctbUXAAoJEOiTWHtbdBeNxbAQALtCo8IpZyXvfbDIxrAsuQxo
Igp/omy8k7taRg+dL9oO7SSHrzTL/2D6krb7MA5NucfvRpMXzsQvTRVhJ+L1XIDc
ZNQQjIjcQL1DCaXyh9u2DVBZx12wvdnmyO7vrpKyz7OS5GBtqWYa+/Hj0F+qyKmm
MOjLg4vsm3wYFtJwiPDsEgeQC/hptjqA0ieCaojCZv3fv81NVQYjN/HVyxrLOx3g
nI3TP0GIIn2QI5YQ6fFc5g62piysKqCX0h2MxnHefjnw5xnrIJnTjneecWts08KZ
LYU8dp/nZyQFduBF/6jUT3fE0lcHQCEWc92LsMRejdG7a5cOwwfLTlhKeOvEmFKO
GxHq3rn1q+lezpKnNrIR6PSSQe0hz9k/+fJRBv9EROPi2eWd+EY7zAlLqJsrYXoz
iWSSKsjOHLu1QlNda5YUYCgQpeBvutIPdhLorSh55S/ej9/oTwdqm5DU+1F0pHyR
61auJS6lIpS4vN2P+p/fpzTi1rsFiuHvDV+BU36p/3lM9hzI2cpt0FsyUncHog5x
0oze4lnka9GO635MgDhVSFgSbQAqTNJjuJ4SBNLiQa4siri1k+klUOmViMSEUOrn
PJqXBZgnD/0jjp1hQ3q0Te6wURLpqgc9JCecPJS+iCKyo/u0zI0HI2xd6/xlmElI
zjzuBcVuX/LiqtJl/ldW
=ROSb
-----END PGP SIGNATURE-----

--KPgFVlUPNAvXnZZhXVWsoMytdnhEMNai5--
