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
 by lists.ozlabs.org (Postfix) with ESMTPS id 437wXp5Vk0zDqW5
 for <openbmc@lists.ozlabs.org>; Tue,  4 Dec 2018 06:48:41 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 8868A1356B8;
 Mon,  3 Dec 2018 14:48:36 -0500 (EST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.1 \(3445.101.1\))
Subject: Re: meta-inspur repo
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAHkHK0_P2gUHY_aarC2qzcKAxJkw5p4PyC1xO5WxryJs4jMWtQ@mail.gmail.com>
Date: Mon, 3 Dec 2018 14:48:36 -0500
Cc: openbmc@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <52078214-B2FA-4DF2-833E-C1D49B69B280@fuzziesquirrel.com>
References: <CAHkHK0_HJjKrUCsTm69iW2Hyw4QRTYYhVWxDTve5rRaLt7JK5w@mail.gmail.com>
 <CAHkHK0_P2gUHY_aarC2qzcKAxJkw5p4PyC1xO5WxryJs4jMWtQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 03 Dec 2018 19:48:43 -0000

> Hi Brad
>=20
> Can you create a meta-inspur repository for a couple of our machines?
>=20
>=20
> thanks
>=20
> =E2=80=94John

Hi John.  I=E2=80=99ve created meta-inspur.  Sorry about the delay.

The first commit can be a little tricky, so I submitted one
that proposes the same licensing terms for meta-inspur that
all the others meta-* repos are using here:

https://gerrit.openbmc-project.xyz/#/c/openbmc/meta-inspur/+/16413/

Please have someone review and sign off on the change in Gerrit.

thx - brad=
