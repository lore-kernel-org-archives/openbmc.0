Return-Path: <a.amelkin@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="C9YxeBKo"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41xd0j2YgkzDqj4
 for <openbmc@lists.ozlabs.org>; Fri, 24 Aug 2018 20:33:25 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 2BB384181D
 for <openbmc@lists.ozlabs.org>; Fri, 24 Aug 2018 10:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:from:from:references:subject:subject
 :received:received:received; s=mta-01; t=1535106801; x=
 1536921202; bh=zz0uKjg4vZIjJavYfIGVfimG7Y+M3Poyy3mBf35yTt8=; b=C
 9YxeBKojkUNrb3C9V34fbw2qiFaDy14wp3YFBLAwcGq4hy8w1yZYKsZe+f6R93uj
 UA2398P5ZWo9HYjXna6sEAWlDCweWL+R9Y29bmFrwWP5cK0he2MmCLrkeVCOCsMo
 vPgnJ1/lzm0ryAqn4ynAGWxS0jK6fkJDlQVR7sE3ww=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 52OalFUKcEVY for <openbmc@lists.ozlabs.org>;
 Fri, 24 Aug 2018 13:33:21 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 01162404CB
 for <openbmc@lists.ozlabs.org>; Fri, 24 Aug 2018 13:33:20 +0300 (MSK)
Received: from [172.17.14.168] (172.17.14.168) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 24
 Aug 2018 13:33:20 +0300
Subject: Re: openbmc repository restructuring
To: <openbmc@lists.ozlabs.org>
References: <8BD97EC3-91CE-45DD-AD6D-678BA4BC2A89@fuzziesquirrel.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Message-ID: <0d2a300d-e664-3c6c-e577-3dcc4c3e39b9@yadro.com>
Date: Fri, 24 Aug 2018 13:33:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <8BD97EC3-91CE-45DD-AD6D-678BA4BC2A89@fuzziesquirrel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="tuFfXWTVysho1jp8pWSLRCoAkleqjvnt1"
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
X-List-Received-Date: Fri, 24 Aug 2018 10:33:26 -0000

--tuFfXWTVysho1jp8pWSLRCoAkleqjvnt1
Content-Type: multipart/mixed; boundary="w2vk92Zar3sGzi0I3q9fNBa9gIpfytQOJ";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: openbmc@lists.ozlabs.org
Message-ID: <0d2a300d-e664-3c6c-e577-3dcc4c3e39b9@yadro.com>
Subject: Re: openbmc repository restructuring
References: <8BD97EC3-91CE-45DD-AD6D-678BA4BC2A89@fuzziesquirrel.com>
In-Reply-To: <8BD97EC3-91CE-45DD-AD6D-678BA4BC2A89@fuzziesquirrel.com>

--w2vk92Zar3sGzi0I3q9fNBa9gIpfytQOJ
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

24.08.2018 05:20, Brad Bishop wrote:
> There is a pretty significant refactor of the openbmc repository going
> through the pipe right now.
>
> This has been discussed here:
> https://gerrit.openbmc-project.xyz/#/q/topic:subtrees
>
> and here:
> https://lists.ozlabs.org/pipermail/openbmc/2018-August/012707.html
>
> and here:
> https://lists.ozlabs.org/pipermail/openbmc/2018-July/012558.html
This is great!
I would be happy if we went further and made all phosphor packages subtre=
es (changing the recipes to take files from "local" folders). That would =
make it soooo much easier to maintain! We'd get rid of those 'bump versio=
n' commits, and vendors wouldn't have to keep "patches to patches" in the=
ir repos.

Actually, that's what I'm now trying to do for our local fork.

> You will likely have some impact to your bitbake development workflow;
> you may have to rebase or resubmit your unmerged bitbake changes; and,
> you might see odd Jenkins CI failures periodically.
>
> Please bear with it for the next couple of days while this transition i=
s
> completed.  Feel free to find me on IRC if there are any questions.
>
> I will follow up with another note when the transition is complete with=

> additional instructions.
>
> thx - brad



--w2vk92Zar3sGzi0I3q9fNBa9gIpfytQOJ--

--tuFfXWTVysho1jp8pWSLRCoAkleqjvnt1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJbf97wAAoJEOiTWHtbdBeNK+0P/jGYFbbdBAmxcJcK3AkWFx+y
6OOsHwpivDoo3ljW3puyfCfhAT5Fehd5AUnTd/vkWVYALRkHlOpnKrqC/9N247q0
JNYRtz430pGqm4BDBKswvpLS2QpbvrfXqAYf3d5+dFURy+ka8TWxUZJJt0RI6U3u
p2gYVmblnncWKkVWHNzKlhCi3Bq/w2frHvpUdhcinlkz8SHy0HacJmd6p/aeloON
o5WMgsg7ohramMc1DniMgqVBdwm04A2SpJU+IGRWAaYiahA2qsrAltyyBlr8LxGF
cq/VcqCdXpDGkegNupOGl/bMKcZ+teP07YCz5buX+ZYVztu3axciB/OtKPfN+Ifb
WFNefRk37ZEkf6doOepzDfaDwJm2Tow6EwH+hrHZ+mkCkdZElOxw/plXfoxwb86H
CEO5pyb+bhUV3og6+kquN2Q5SrKBMdPay4R3DNtpj0gWeUYUsyA322KD615i9v84
ItJMyPtqKdNnchFjrHou+1KKwVIu7Beh6PVNuaD4M8AIGRlSN9iC2qhWSXeQtuSx
h6wogKMSvxiKUJIuQazVBvInCcBLd/cPXGP+daNSPkN3QhoMcZ4S1k3FFJyFlKB8
kThPn0j080p8d2es4Vy+aIvhI/FqSys4KeknNabi+VelQnoU4hhUqVz3lhNvZBlo
fAGXX/jCo55iSQSNALWu
=Bu7l
-----END PGP SIGNATURE-----

--tuFfXWTVysho1jp8pWSLRCoAkleqjvnt1--
