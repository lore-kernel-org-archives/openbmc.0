Return-Path: <a.amelkin@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="jausuvfa"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41wyf11NbqzF2vT
 for <openbmc@lists.ozlabs.org>; Thu, 23 Aug 2018 18:44:56 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 859A841900;
 Thu, 23 Aug 2018 08:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:from:from:references:subject:subject
 :received:received:received; s=mta-01; t=1535013891; x=
 1536828292; bh=YtFfSDFgawmprHi07TGsT1Ts8DYxOtSc2I+Y1Uy/WyQ=; b=j
 ausuvfa8tQ1ZbiHTbGMy2MvUcbTMaTpfD036axeYqLZIoIjUsicuTgYqcHiSuEM0
 ttkdjWBbinButVRfe+AyhSoA5bD+YLr98jH7L2FeWxdUZeCfZ/bdAWRI7NStHren
 lbax85b7ZsVn3M+V9gVD+KjkLitUfVUw8+fRS+flvg=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vv1KcYUpbxYm; Thu, 23 Aug 2018 11:44:51 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id E5BD341185;
 Thu, 23 Aug 2018 11:44:47 +0300 (MSK)
Received: from [172.17.14.168] (172.17.14.168) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 23
 Aug 2018 11:44:47 +0300
Subject: Re: Proposals for commit log policy
To: "Tanous, Ed" <ed.tanous@intel.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <0ef9181f-eb70-552b-3411-da2bc9676be1@yadro.com>
 <7E9441B1E5EFFD4681F54958E82169934583385B@ORSMSX114.amr.corp.intel.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Message-ID: <ab12144e-3faf-2756-b7d7-16a294b2c7ee@yadro.com>
Date: Thu, 23 Aug 2018 11:44:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <7E9441B1E5EFFD4681F54958E82169934583385B@ORSMSX114.amr.corp.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="kotQxCbvpeGjQ7A820Yw01ICHsb6dz0k1"
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
X-List-Received-Date: Thu, 23 Aug 2018 08:44:58 -0000

--kotQxCbvpeGjQ7A820Yw01ICHsb6dz0k1
Content-Type: multipart/mixed; boundary="QaQeOAToq3W9BE2ddqDzkpZxXI4ASfvGw";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: "Tanous, Ed" <ed.tanous@intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Message-ID: <ab12144e-3faf-2756-b7d7-16a294b2c7ee@yadro.com>
Subject: Re: Proposals for commit log policy
References: <0ef9181f-eb70-552b-3411-da2bc9676be1@yadro.com>
 <7E9441B1E5EFFD4681F54958E82169934583385B@ORSMSX114.amr.corp.intel.com>
In-Reply-To: <7E9441B1E5EFFD4681F54958E82169934583385B@ORSMSX114.amr.corp.intel.com>

--QaQeOAToq3W9BE2ddqDzkpZxXI4ASfvGw
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

22.08.2018 23:39, Tanous, Ed wrote:
> I'm not really understanding the issue here.  Is the log information no=
t available in the individual repositories?  Is it just hard to parse?  C=
ould this be automated, either using a script, or a list of repositories?=

You're obviously not getting my point. There are logs. But they are purel=
y developer-oriented. Nobody actually cares (except for developers) that,=
 for instance, some commit "Resolves some build failures and updates the =
bmcweb recipe to use the proper target names for image selection". That c=
hange is TOTALLY invisible to end users and must not get into Release Not=
es for a binary firmware release. Nobody actually wants to know that some=
 changeset "replaces phosphor rest with bmcweb for the s2600wf target" or=
 that "the handcoded harware sensor yaml file is merged with the final se=
nsor yaml file". What end users want to know before they make a decision =
to upgrade is how the system behavior (user experience, responses to comm=
ands, etc.) has changed since the currently installed firmware. Writing e=
nd-user-centric Release Notes for a binary release takes a lot of time, b=
ecause it requires analyzing all those purely developer-oriented logs. An=
d that's a job that is done on a regular
basis by each vendor, I believe. And it takes, as I said, at least 3 full=
 days contiguously of a qualified engineer. What I propose is ask each en=
gineer who commits a change and knows his change, thus doesn't need to sp=
end time analyzing it, to write a short description of end user impact. I=
t will take like 5 extra minutes per commit.

> While I think there's value in the logs, I don't think maintainers time=
 is best used by creating git logs manually all the time, especially when=
 it should be easy enough to parse the git logs between the recipe bumps.=
  I've had to do this before to do bisects before, and it's not too diffi=
cult once you get the hang of it.
For bumps the task is "automatable" indeed. It's not actually as easy wit=
h Yocto as it may seem "to parse the git logs between the recipe bumps" (=
have you tried?), but it can be automated. But the end user impact inform=
ation is not. It's either written by the developer in the commit log, or =
deduced (sometimes incorrectly or incompletely) by an engineer writing th=
e Release Notes.

Alexander.


--QaQeOAToq3W9BE2ddqDzkpZxXI4ASfvGw--

--kotQxCbvpeGjQ7A820Yw01ICHsb6dz0k1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJbfnP/AAoJEOiTWHtbdBeN1jMP/AnDRQX/7+sgK0uFc21VmAcS
4naXmTpyY9b5zVYdOQD+UAOgzQ+DKN/AGdTve3miJgiMvT3+ToETyMOTwn8sq7Aj
bJkdrjwCwZDiD0U5BU5MnAbKLt9NAqN3+hO9u8Pm15I0hJTA1aZGuWtxBMRviP3K
8piJI8FjzGKW0c+CK9vDtNvN4lx16Fky8S1Xh0Acd83kiYO1vqRZ/VCKoUtGC+/y
aTIKCW0iRF6R+C2SL3C5k+WT/IGuyG63EMBBpLBAFev+gcxPPhw1ccnJ3SgI0wVo
NF0O25pDROcUZUf6+BAPWlCMkcmD7O5xXiX/kjVni+M+HlfXTOydj3wu3Vtl8krw
KMb4uUCGwqosvKISC6JqNB4QCRmPg8m8TrMlUhuQ/iMAMRpZm1bQSa2zE86LnNwn
OLv4kqW99dEyWgqAV5R2yNe3n/n7YGwtcZVVB/Mk2LIwU4ZbOfBo8ci6YB5tffgZ
DKNy9DlnXyMQx8EGcM/FUfaiYWjVzbPiO/dBNmjMJTphG40rp5Syf7z0RUITsxpp
stBq1R1PEfvhRwjqryr6C13Myw/keljnb71w7dXO4sHoSXzwGdu+8T5LAhwp7nIF
0OdvUE7zzNvOGssn+wwC8yjiBZqVOkvLA004mP8qedNzVcBhVH4QOJ1loMGCDwEK
NIAoGjUiBRP8NCD0iekO
=gZ79
-----END PGP SIGNATURE-----

--kotQxCbvpeGjQ7A820Yw01ICHsb6dz0k1--
