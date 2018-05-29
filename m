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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40wL3D03N9zDqGD
 for <openbmc@lists.ozlabs.org>; Wed, 30 May 2018 03:15:50 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 3637D6DD38;
 Tue, 29 May 2018 13:15:46 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: Gerrit +1 policy
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CACPK8Xc_gTiJaCUzDiG6aNOu7rF6gU3e_oc-bd19bOswju7yTw@mail.gmail.com>
Date: Tue, 29 May 2018 13:15:46 -0400
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <823DB1E3-D72E-4C82-A093-7E75CD547D78@fuzziesquirrel.com>
References: <CACPK8Xc_gTiJaCUzDiG6aNOu7rF6gU3e_oc-bd19bOswju7yTw@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
X-Mailer: Apple Mail (2.3273)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 29 May 2018 17:15:52 -0000


> On May 29, 2018, at 8:53 AM, Joel Stanley <joel@jms.id.au> wrote:
>=20
> I get frustrated by Gerrit removing +1s from patches when I make a
> small change to the commit message.
>=20
> This is a configurable option in Gerrit:
>=20
> =
https://gerrit-review.googlesource.com/Documentation/config-labels.html#la=
bel_copyAllScoresIfNoCodeChange
>=20
> I would like to propose we change this setting to true.

fwiw, on repositories I maintain, I don=E2=80=99t hold-off on submitting =
a
change because of this.  If it isn=E2=80=99t being submitted there is =
some
other reason.

But with that said I don=E2=80=99t have a problem with changing the =
policy.=
