Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zgTR32kyCzF100
 for <openbmc@lists.ozlabs.org>; Tue, 13 Feb 2018 15:03:10 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 35CCB6E229;
 Mon, 12 Feb 2018 23:03:07 -0500 (EST)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH u-boot v2016.07-aspeed-openbmc] aspeed: un-hardcode FIT
 configuration selection
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CACPK8Xdj3zeH1PM=4DtS68jHDBKd_+eCJmRiBmw6cYeJRNUUVA@mail.gmail.com>
Date: Mon, 12 Feb 2018 23:03:07 -0500
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Rick Altherr <raltherr@google.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <277A734F-3F5B-4580-A94C-6DFDC8CFED4C@fuzziesquirrel.com>
References: <20180202030725.11771-1-bradleyb@fuzziesquirrel.com>
 <CACPK8Xdj3zeH1PM=4DtS68jHDBKd_+eCJmRiBmw6cYeJRNUUVA@mail.gmail.com>
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
X-List-Received-Date: Tue, 13 Feb 2018 04:03:11 -0000


> On Feb 12, 2018, at 10:58 PM, Joel Stanley <joel@jms.id.au> wrote:
>=20
> On Fri, Feb 2, 2018 at 1:37 PM, Brad Bishop =
<bradleyb@fuzziesquirrel.com> wrote:
>> Rely on the FDT parser to select a FIT config when looking for a
>> ramdisk_conf.  This allows image builders to use arbitrary =
configuration
>> names like /configurations/conf@foo.
>=20
> Can you elaborate?
>=20
> Do we even need this script? IIRC it was in place to support pre-FIT
> configurations where the initrd and the kernel were stored in seperate
> locations in flash. Now that all systems use FIT, we can simply say
> "bootm 2008000".
>=20
> I suggest we don't need it, so we should change the environment to be
>=20
> #define CONFIG_BOOTCOMMAND "bootm 20080000=E2=80=9D

Sounds good to me.=
