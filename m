Return-Path: <openbmc+bounces-2002-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFCEECD5BD0
	for <openbmc@archiver.kernel.org>; Wed, 27 May 2026 23:57:52 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gQmlG1cR3z2ySf;
	Thu, 28 May 2026 09:57:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=79.135.106.120
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779876606;
	cv=none; b=HMdBoNykHrLjJ+jgI95UVdai/IkG5LFyh+qpIMtjghVWbBHNBaU0dcB1WY9oJaLjgoLIEEc3yrym7jW1v6eCdKVfEMzrXzR5oIU/bDq7NbtqpUU6dpnV1feYqEPsri+kur/KO65gckYh3KRlSPIhlhuAjP35rHyb152ICr6uiJt7022RZ1NESZhQ1m4wm5fuO0vHUcLO8IkvbgrSSgKLxOXQnwsmjor+DhsZl4CLIpMNve3W4bqNkj5fZ0rkWXudOU9BhUm56q7WFHlw9HJMmib6mEVjmumIJoPQxnbbl5+6/htfDTr8jlg4bTFBhnYfjxvh3EVRhWhGNjlz8CpVdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779876606; c=relaxed/relaxed;
	bh=k8Xsc4NtQYmMJ69R4wqx/1+GRRcvRfD+4+9PuYn+3lE=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=S7TppsrPyZyCBAAIa/QYfBMtjw/0MdsF5UfWtdSvxOuTEeD1LqwXwEG0naaPlzxV5Hdi3DPQ34ckNF2cDBBVIWd01eU7qN6pM+ne01HW5oo83bNmDwFcfNKNhvVkDf/nQTvPEWdP1Bud3EtQZhe4zjsK+7PeQJRam62img/GhzvoRvW/CpG6j2a6YrepLp5ADEQ66DJYJwDmKKhHda+K34hfvFnX1XI3c9N3tKnbDEyBHMh/zsI4yD7CBfMheaH/DWh6FkapeNlio1sn1UIl0KGsxXM1po8esXUMRYLYAMwkCcyoTjSYvxor2lGbxhePoea9UjkqI/Xoa8HCn28wWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; dkim=pass (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail header.b=nK40RrjH; dkim-atps=neutral; spf=pass (client-ip=79.135.106.120; helo=mail-106120.protonmail.ch; envelope-from=bobdabot@proton.me; receiver=lists.ozlabs.org) smtp.mailfrom=proton.me
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail header.b=nK40RrjH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=proton.me (client-ip=79.135.106.120; helo=mail-106120.protonmail.ch; envelope-from=bobdabot@proton.me; receiver=lists.ozlabs.org)
Received: from mail-106120.protonmail.ch (mail-106120.protonmail.ch [79.135.106.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gQQNB1nblz2xHK
	for <openbmc@lists.ozlabs.org>; Wed, 27 May 2026 20:09:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1779876588; x=1780135788;
	bh=k8Xsc4NtQYmMJ69R4wqx/1+GRRcvRfD+4+9PuYn+3lE=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=nK40RrjHDChWVVqs9jX7SXfWAvvGlOeD7fQqVjQKjoU5oPIZvnvhb6XPYAvA4cvbP
	 You6yx99Es3gv17pM+Khjq9lX1U1WoxX8w7FP8hCO2F8sQyN3CN6wAYwFs+1YdFDnw
	 xO8eiPSmdVsPCNYO3yBB33egVxnwq1Udl9VvWeHPxdRJGqwt2DFLRQLoZjkIy25Bgc
	 JHozguzEE2kLN1xwGLU81XMPCjX3WQRrVaLTG9Q7X6fQ06FrVmw1mUPsbu7NIqVH2k
	 HD0Vrae/xyTEFEPGLT1MOrRWBZr+kqYB9+RL2qWfotA3/iPxRNk886A0m242DmmNVG
	 82L6QX4BOPxJQ==
Date: Wed, 27 May 2026 10:09:45 +0000
To: openbmc@lists.ozlabs.org
From: binreaper <bobdabot@proton.me>
Cc: Ed Tanous <ed@tanous.net>, Joseph Reynolds <joseph.reynolds1@ibm.com>, Gunnar Mills <gunnar@gmills.xyz>
Subject: bmcweb mTLS: UPN domain suffix matching authenticates parent-domain and TLD-only certificates
Message-ID: <Edi-ZB9R4AJAZhrvwWnwKu4TZURV7FTcns18seYmP2-hZHZziG1BkyPF3iS1wJbE2wttI8MEHtDCBiVowlF2YYBjX4Gzl54iafbhmKespAw=@proton.me>
Feedback-ID: 180516549:user:proton
X-Pm-Message-ID: e9c5557ad0fae8593a34354f398c97193bc04c5a
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi all,

A second of the four bmcweb security findings I reported privately on 2026-=
02-23 remains unfixed in master. I posted the more severe of the two (HTTP/=
2 pre-auth body accumulation) to this list earlier today; this is the lower=
-severity sibling. Same redirect rationale (Ed Tanous's 2026-05-14 instruct=
ion to use public channels). A suggested Gerrit change accompanies this pos=
t.

## Summary

`isUPNMatch()` in `http/mutual_tls.cpp` performs domain suffix matching whe=
n validating mTLS client certificates in UserPrincipalName (UPN) mode. The =
algorithm strips dot-separated labels from right to left and returns true o=
nce the UPN domain runs out of labels, regardless of how many hostname labe=
ls remain. The result is that a certificate with a UPN of just a TLD (`user=
@com`) authenticates against any BMC in that TLD, and a parent-domain certi=
ficate (`user@example.com`) authenticates against any BMC nested under that=
 parent (`bmc.lab.internal.example.com`).

- **Affected component**: bmcweb mTLS authentication, `http/mutual_tls.cpp:=
:isUPNMatch()`.
- **Configuration prerequisite**: `CertificateMappingAttribute=3DUserPrinci=
palName` (not the default; default is `CommonName`). UPN mode is opt-in but=
 is deployed by several large operators.
- **Severity**: CVSS 3.1 6.8 (Medium) =E2=80=94 `AV:N/AC:H/PR:L/UI:N/S:U/C:=
H/I:H/A:N`. Attack complexity is High because the attacker needs a CA-signe=
d client certificate with a parent-domain or TLD-only UPN; the scope is "an=
yone holding such a cert against any BMC under that suffix", which can be v=
ery broad in enterprise PKI deployments.

## Reproducer (no exploit code required)

The behavior is asserted by the project's own existing unit test, which I w=
ill not reproduce verbatim per the customary list etiquette, but the form i=
s:

```
EXPECT_TRUE(isUPNMatch("user@com", "hostname.region.domain.com"));
```

That expectation is the bug. Any certificate the BMC will accept whose UPN =
domain is just `com` will authenticate the bearer against `hostname.region.=
domain.com`. The same applies to any other suffix relationship.

The "patches" landed on master on 2026-04-10 (commits `af44b2bd` "Make UPN =
domain matching case-insensitive" and `5d4a41fa` more UPN unit tests) touch=
ed the exact function and added unit tests, but they only made matching cas=
e-insensitive =E2=80=94 they did not address the suffix-matching escalation=
. From the outside the bug looks closed; it is not.

## Suggested fix

The Gerrit change linked above replaces the right-to-left label walk with t=
wo checks:

1. Exact match: the UPN domain equals the BMC hostname.
2. One-label-prefix tolerance: the UPN domain equals the BMC hostname after=
 stripping a single leading short-hostname label. This preserves the common=
 pattern where the UPN uses the DNS domain (`domain.com`) and the BMC hostn=
ame prepends one label (`bmc-01.domain.com`).

Any deeper nesting is rejected. Case-insensitivity is retained via `bmcweb:=
:asciiIEquals()`. The existing unit test that asserted the suffix-match beh=
avior is corrected to `EXPECT_FALSE` and two additional positive cases (exa=
ct match, one-label prefix) are added.

This is a minimal-change fix. An alternative =E2=80=94 minimum-label-depth =
enforcement (require the UPN domain to contain at least one dot) =E2=80=
=94 would prevent only the TLD-only case and leave the parent-domain escala=
tion intact. I went with the exact-plus-one-label form because it covers bo=
th bug classes and matches the actual operational pattern that UPN mode is =
configured for.

## What I'd appreciate

A maintainer review of the Gerrit change. The diff is small (~36/-28 across=
 `http/mutual_tls.cpp` and `test/http/mutual_tls.cpp`). If a different shap=
e of fix would land more cleanly with bmcweb's design, I'm happy to revise;=
 if the one-label-prefix tolerance is itself too permissive, I'm happy to t=
ighten further to exact-match-only.

## Timeline

- **2026-02-23** =E2=80=94 Reported privately to `openbmc-security@lists.oz=
labs.org` as the fourth of four findings; acknowledged the same day by Jose=
ph Reynolds and forwarded to the bmcweb maintainers.
- **2026-04-10** =E2=80=94 `af44b2bd` "Make UPN domain matching case-insens=
itive" + `5d4a41fa` more UPN unit tests landed on master. These touch the s=
ame function but do not address the suffix-matching escalation.
- **2026-05-05** =E2=80=94 Status-check email to the maintainers. No reply =
on this finding.
- **2026-05-14** =E2=80=94 Maintainer reply (Ed Tanous) redirected further =
correspondence on the remaining findings to public OpenBMC channels. This p=
ost is that follow-up.
- **2026-05-27** =E2=80=94 H2-F1 (the more severe sibling finding) posted t=
o this list with Gerrit change 90580; this post and Gerrit change 90581 cov=
er AUTH-F6.

Best regards,
binreaper
bobdabot@proton.me


