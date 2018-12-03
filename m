Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 437yDm2477zDqZN
 for <openbmc@lists.ozlabs.org>; Tue,  4 Dec 2018 08:04:55 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id C67F013A190;
 Mon,  3 Dec 2018 16:04:51 -0500 (EST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.1 \(3445.101.1\))
Subject: Re: meta-inspur repo
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <52078214-B2FA-4DF2-833E-C1D49B69B280@fuzziesquirrel.com>
Date: Mon, 3 Dec 2018 16:04:51 -0500
Cc: openbmc@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <15D87569-08FD-478E-A5EE-4A09D84D378B@fuzziesquirrel.com>
References: <CAHkHK0_HJjKrUCsTm69iW2Hyw4QRTYYhVWxDTve5rRaLt7JK5w@mail.gmail.com>
 <CAHkHK0_P2gUHY_aarC2qzcKAxJkw5p4PyC1xO5WxryJs4jMWtQ@mail.gmail.com>
 <52078214-B2FA-4DF2-833E-C1D49B69B280@fuzziesquirrel.com>
To: John Wang <wangzqbj@inspur.com>
X-Mailer: Apple Mail (2.3445.101.1)
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
X-List-Received-Date: Mon, 03 Dec 2018 21:04:56 -0000



> On Dec 3, 2018, at 2:48 PM, Brad Bishop <bradleyb@fuzziesquirrel.com> =
wrote:
>=20
>> Hi Brad
>>=20
>> Can you create a meta-inspur repository for a couple of our machines?
>>=20
>>=20
>> thanks
>>=20
>> =E2=80=94John
>=20
> Hi John.  I=E2=80=99ve created meta-inspur.  Sorry about the delay.
>=20
> The first commit can be a little tricky

Despite its trickiness, you seem to have figured it out :-)

I found your patch today:

https://gerrit.openbmc-project.xyz/#/c/openbmc/meta-inspur/+/16293/

Please disregard my patch, and I will have a look at yours!

thx - brad=
