Return-Path: <a.amelkin@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="ozOAz4mr"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41q29G0l0czDrYj
 for <openbmc@lists.ozlabs.org>; Tue, 14 Aug 2018 03:02:57 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 3E49E418FF;
 Mon, 13 Aug 2018 17:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:from:from:references:subject:subject
 :received:received:received; s=mta-01; t=1534179767; x=
 1535994168; bh=LVa22wnDRgL+NL6AC7WlVqCbsV1+gqwTqQ+cRg68vgE=; b=o
 zOAz4mr99p5YOaiunSgYoEPrnMfu7bXGBX3aaIpNIVeU5Q75/fpxsZqF5OCXyCtQ
 8pj4iLYWvsi3hM/qrUv/SlcwVf0O1Vm+7I6MkFnLhCSTwVQHzKvV4dhcRchJDQWy
 ugWbzxY8M5mRONNeDr20DMxFQH8YqHSFvVv15QjHe0=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ql_hjRL2dckT; Mon, 13 Aug 2018 20:02:47 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id C69D8404CB;
 Mon, 13 Aug 2018 20:02:47 +0300 (MSK)
Received: from [172.17.14.168] (172.17.14.168) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 13
 Aug 2018 20:02:47 +0300
Subject: Re: Licensing Question
To: Patrick Venture <venture@google.com>, Vernon Mauery
 <vernon.mauery@linux.intel.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CAO=notzP1FWobbpUhqdf8ZrGRqsNZvZHBp=8cmXZjWOL0dcCrA@mail.gmail.com>
 <20180809163211.GA37965@mauery.jf.intel.com>
 <CAO=notyXi0VLv=-eJHsODwJvukoMRMbMcC8qndzR9ncYkbsvww@mail.gmail.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 xsFNBFj0jdkBEADhQF4vZuu9vFfzxchRQtU/ys62Z13HTaYK/VCQKzPnm2mf593Il61FP9WV
 0Srt4t4yumiXK7NhHeqktN/YZjYDYVr9l+vZpNydOHpDjk7xjPgb0KkoFCo7bcQ2/e4AtLTQ
 XGoWIKv983vWlphPCG1Jof5jH3RA7mccCNXtGlzVYF0RYR0/qKGgsoBymkldNKPwgPf/3SXb
 QY5V3sJ5SHwDjmhg3MYnblV29OULdi72DKI9MkhTTHQFlA++CfYstx/cZ1BZwWmoMgi0umpj
 Pf+5mAkmTtlPW7U54EUgFpvTMfxRRS7yH+iTlvngduYW6jryt0zm6r7M2LGR+uWGSTmWBB7Y
 t06D0Xrm0Zwl4alQ5WDrlUTkzZcXDb0QqY7UkQSkghLmUjItEj4Z+ay7ynIsfjQe0OYdTofh
 dY0IUxMxNm9jeckOkRpSdgsQrTcKIOAt/8jI62jlzN1EXA6blhASv5xtt7I1WXCpDU+mpfKf
 ccUVJfmd0Q2nlG64L4Bv8o+iBI0Xu5+EX2NzDKQF5vSQIK8mwniAPT16hi80mZG9EQf0fJ1C
 p7xJGvwA6IiwXWsAqhNRhYbmNDfiR2MMxw5DFdQSeqoK3ONeeIwrJAPNdme+Z1DoT2+ZuZP0
 nfUa8e2QaMHkXwCz9e0cI2NUmAwFJ9Qg4L0eyhdZP4rQ1KCg/QARAQABzSxBbGV4YW5kZXIg
 QW1lbGtpbiA8YWxleGFuZGVyQGFtZWxraW4ubXNrLnJ1PsLBgAQTAQgAKgIbAwULCQgHAgYV
 CAkKCwIEFgIDAQIeAQIXgAIZAQUCWmWolAUJcjFDNwAKCRDok1h7W3QXjXyOEACUv6oDO7Vn
 KnDTUypYhyTVi8C+fjlHTH+AIDP4qk6nXjMIJeh0P7rQCHAOIOCW9osy/urYQ5at90eUolDV
 udMe5+sSvKRHYksu74O+4XedE2TDFJnntnz0JIeyuaH4FVRDX5i2hlK6wx2D06wTJj4JONlW
 c1aLULPKfrCbMbpNlD9s/+48RkCj77kl30nJ+56ThEMkSgomMIL9XMesNnQAa83Y55mJhx1f
 n3Gz7kH6nxLPPgLWgKXebAgM6ltJAjaCIWxZYlJK5dQmQC5N7PR0kXdnHttSx89ldgPacpX7
 V39dBMoURY/+YtMU7VKUNVW/IXkwXT7m42QoxO3H+HNHRVfDtELy2l6fBCf0ShXs4b3AF654
 aRJrwQX1Za3mg6OXTmAVDEerqOBht5XZl2Y/FyxV1Tka2SarkYrNVjD3YXODnmF3GfAuP8Jk
 F8uYvQyXpLMpThnUPjs+Vl1NC1exh2mrM+7kxGXPKhrFWxX7tduAJpULpdCk4mefO9/U7I8/
 Edf5giE1o9yhECZ71lzmA7p7bLDv54Qfu4WAVndUgHLHCH7uUsKf3cds/gLtpuTrHB83nvvh
 LKZ6+kYnn5pK89hkia0EbpOrTrqBqphMyxFb7WFapXip7kRaqUdMOqdRO+JHG3rFAhz7sl/0
 DPWSea7WGLe0TNySCQ4GdytKLs7BTQRY9I3ZARAAygmVNgjvxkqud75kP5fwhmwMVu13sLh8
 QnZxjMsA9Zelt1Hu+BVmjET7YL4xBhdJDZ4y3UI/MV8ZzOfJHUWSNr6POwKIrsQfGzdlgB0e
 w2k6Rm651Jp+aAsygB4GR7BopptJd9d/q5oCnZxpPgDpZOBCpl4DQ3fJIGSc8iQVmA84lHLS
 +mqIJ94PZ7uza4F0ly6Au+Hbkhowh/1q+BUd6Rn553WAmPAG7g0lAG/Obq1m77ovlR86yY5i
 C503QKlPJELSNYtzczuLQZetjDtaFkugke4QMlhzHyc7DjSsjyccdhepPtXWEm84jPCx1/KU
 3m9jAWtPdARQ73su/fiitmXAifQXJBB2R9fmKuM2F3ClHcJxv/l0W1ruekD9vojOO75yvBEG
 7fGlLc9hUgIIGgBJvI+Yb1/KhqWC9r53TS6kcuCi+z9kf+4MTBge2sU97DtivZGzul6yhrcr
 3Ic5paWoaka2ClGqKBQo3A9o4F60q3rRq5FAcMdKQq7qJutCzcjkcCpVVik1im0u0+UGrK0s
 YQuAgTu45mJPOfINqz1xz+qwxSjYI/wjxJaYTZLO68CIdBiDj+zxIeo9o/mUJvS+DhnPzKhW
 KXToZl2D7VdjOlu8zZ0tIFYrULJYhuw2f/KwD1lwoehlKikEE0H0xkPygufjtiYo6jTb+BKa
 sG8AEQEAAcLBZQQYAQgADwIbDAUCWmWo6AUJcjFDNwAKCRDok1h7W3QXjc9vEADXse2POSaT
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
Message-ID: <4fdfac5d-c204-b0e9-3c19-8a2cbd7f191f@yadro.com>
Date: Mon, 13 Aug 2018 20:02:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CAO=notyXi0VLv=-eJHsODwJvukoMRMbMcC8qndzR9ncYkbsvww@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="fbWCCTpNQJT6hGVytX0FfxjzGA2zorF58"
X-Originating-IP: [172.17.14.168]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Aug 2018 17:02:59 -0000

--fbWCCTpNQJT6hGVytX0FfxjzGA2zorF58
Content-Type: multipart/mixed; boundary="rBcbBHRxC1ZKlxrMzXZyKwqfVzcBXWLnH";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: Patrick Venture <venture@google.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Message-ID: <4fdfac5d-c204-b0e9-3c19-8a2cbd7f191f@yadro.com>
Subject: Re: Licensing Question
References: <CAO=notzP1FWobbpUhqdf8ZrGRqsNZvZHBp=8cmXZjWOL0dcCrA@mail.gmail.com>
 <20180809163211.GA37965@mauery.jf.intel.com>
 <CAO=notyXi0VLv=-eJHsODwJvukoMRMbMcC8qndzR9ncYkbsvww@mail.gmail.com>
In-Reply-To: <CAO=notyXi0VLv=-eJHsODwJvukoMRMbMcC8qndzR9ncYkbsvww@mail.gmail.com>

--rBcbBHRxC1ZKlxrMzXZyKwqfVzcBXWLnH
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

09.08.2018 19:41, Patrick Venture wrote:
> On Thu, Aug 9, 2018 at 9:32 AM, Vernon Mauery
> <vernon.mauery@linux.intel.com> wrote:
>> On 08-Aug-2018 03:45 PM, Patrick Venture wrote:
>>> So, I've spent the last hour trying to submodule my way to using
>>> ipmitool.  I've managed to get it compiling for just the one file I
>>
>> Okay, I'll bite. What are you trying to use ipmitool for?
> I'm trying to use the ipmitool source for speaking IPMI without
> duplicating the code to do so.  I can just open the file interface
> myself and handle it, but it seemed to reinvent the wheel on this one.
> Although I do need to push a bugfix to ipmitool where they don't check
> the msgId returned to see if it matches their expectation.  Unless
> someone else fixed it (still need to check).
There are other options, you know. You could use libopenipmi or
libfreeipmi libraries if you're trying to talk IPMI from a C++ code.
ipmitool is only good for scripts.
>> I think Alexander is working on getting ipmitool to compile without wa=
rnings
>> upstream. That is quite the task though; he inherited a lot of warning=
s. :)
I do. And it's really hell of a task. I've inherited not just a lot of
warnings, but also a lot of magic numbers, copy-pasted or plain
inefficient or useless code, etc. A good example of how broken things
live for decades and even soak into parallel products is
https://github.com/ipmitool/ipmitool/issues/25
>>
>>> So, I can keep battling this, or I can ask -- the license for the
>>> ipmitool just says I need to keep a copy of the license with the
>>> source if I reuse it.  So, I can do that, and I can hack it up to wor=
k
>>> -- but where I'm curious is -- how does that impact the license of
>>> phosphor-ipmi-flash?
What exactly are you trying to do? Create your own flavor of ipmitool
with blackjack and... bugfixes? Better submit pull requests to upstream
then.

If you're trying to just borrow some portions of code, then... Well, you
can do it as long as you keep the BSD license boilerplate with
respective copyright info, but I'm feeling like it's not a good idea
anyway.
> The license is fairly permissive, just says I need to include it.
Yup. It's just a standard BSD three-clause license.

Alexander.


--rBcbBHRxC1ZKlxrMzXZyKwqfVzcBXWLnH--

--fbWCCTpNQJT6hGVytX0FfxjzGA2zorF58
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJbcbm2AAoJEOiTWHtbdBeNt1gQAJ/ROZ1im1usJtES7zlmCQi9
SpFzmiiSvYG125PnYCDvHwSKSkMis/SgmCCUP09KIEfiTItZfsXC5bwoL6NXW+7z
eO7R7ukmS5L35xi0ATcm98oq5OkHDVoQZ8GXG7S42Pmc3zYFZPl8J3/7z2k0EILP
p1Yu7ZyznZ8k4xX2DGPseKza5bKIz1jmOdqfN7YgYjkKP4YC9kOPtdXiQ/iWjp/V
rhgpjbmAjI9zOoVY1wlGuGfwcHRFc1RdGUqLMJJoIldU1TPL+2IjNUL2kVM8hDCP
sjb1s2fTRDDUjcrPNwY0jXtkfe3F37Jnw2E2QNC1cRx6MWdcz9hCmu+CD70WVRl6
bunt0o9l7W9arKq1fNi7n9qiUoAg7A8E0LUXbYrdxY790Dy9WJPt75sbp6CyKw//
4PLJnq81mlBw5o3cXnqFrjESTsuGinSm9BMiexT9WuunCkkQIXQrOQxUSfFOg5h0
OT7tAMC4a1In6gQP8j0TRXbYOFe1Z2OPsUPA6pLvzp6NEngVUVkutFCdUZjhSU96
uufWMynspQMqLsBaedVjjc/ejQDG/enLucbcGHbBRtfxxfQad/2yXGYf6aFKl5yW
NgMqHSgsk0Hvx9TMd7eThEnOHSb7nu+B3h+zQ1R9EFATyDrQQUrv5UvAe5V2vs38
gJ3MainCKnWs7l467mTL
=jAIr
-----END PGP SIGNATURE-----

--fbWCCTpNQJT6hGVytX0FfxjzGA2zorF58--
