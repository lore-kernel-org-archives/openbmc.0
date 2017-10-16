Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yG6RZ4jW6zDrG0
 for <openbmc@lists.ozlabs.org>; Tue, 17 Oct 2017 05:34:16 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id C4CA0161EC9;
 Mon, 16 Oct 2017 14:34:11 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH linux dev-4.10 v5 31/31] drivers: hwmon: occ: Cancel occ
 operations in remove()
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CACPK8Xc7f0AYTSfuSBC2=kgPaYvWFw7q5O8y-tF=-TSNG7xyDw@mail.gmail.com>
Date: Mon, 16 Oct 2017 14:34:11 -0400
Cc: Eddie James <eajames@linux.vnet.ibm.com>, Andrew Jeffery <andrew@aj.id.au>,
 "Edward A. James" <eajames@us.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E5EB43D9-7C66-4768-91CD-18624E307522@fuzziesquirrel.com>
References: <1507300148-8208-1-git-send-email-eajames@linux.vnet.ibm.com>
 <CACPK8XeiD_qukBjibd1FxMjXt9AbJ_jXGF6AJCE5HQFwr0tuFw@mail.gmail.com>
 <1b82ae0a-9754-b9d1-3cba-12a796b37366@linux.vnet.ibm.com>
 <CACPK8Xc7f0AYTSfuSBC2=kgPaYvWFw7q5O8y-tF=-TSNG7xyDw@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
X-Mailer: Apple Mail (2.3273)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Oct 2017 18:34:20 -0000

>>>=20
>>> Why not spin_lock_irqsave/spin_unlock_irqsave? Same throughout this =
patch.
>>=20
>>=20
>> Well spin_lock_irq/spin_unlock_irq is used through the occ and =
sbefifo
>> drivers. Just following suit here. I can switch it if necessary.
>=20
> If you understand the differences and used the non-save/restore
> versions intentionally, then we can keep the driver as it is.

This is my fault.  The initial sbefifo driver introduced this.  I =
don=E2=80=99t remember
what my mode of thinking was.  Regardless, it sounds like it was wrong.

>=20
> In general, to be safe, more experienced kernel hackers than myself
> recommend the irqsave/irqrestore versions of the spin lock functions
> as they are safe to call from any context (IRQ or otherwise).
>=20
> Cheers,
>=20
> Joel
