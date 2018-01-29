Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zVjZ3047RzDr0j
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jan 2018 08:38:50 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id A9C566DC95;
 Mon, 29 Jan 2018 16:38:46 -0500 (EST)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: BMC redundancy
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <20180129204314.GZ113334@mauery>
Date: Mon, 29 Jan 2018 16:38:46 -0500
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C23CA6D0-0BC3-484E-9EB9-82128C863F06@fuzziesquirrel.com>
References: <AFD7FFE5-8EA8-41FF-85C9-71AF312D4775@fuzziesquirrel.com>
 <20180129204314.GZ113334@mauery>
To: Vernon Mauery <vernon.mauery@linux.intel.com>
X-Mailer: Apple Mail (2.3273)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Jan 2018 21:38:51 -0000


> On Jan 29, 2018, at 3:43 PM, Vernon Mauery =
<vernon.mauery@linux.intel.com> wrote:
>=20
> On 29-Jan-2018 10:52 AM, Brad Bishop wrote:
>> I know we have a lot of work to do with the basics before tackling =
something
>> like supporting multiple BMCs in a single system, but its never too =
early to
>> brainstorm.
>>=20
>> Quick community poll:  Please share any thoughts you may have around =
supporting
>> systems with multiple BMCs.  Does your organization care?  Thoughts =
on how it
>> could/should be done?  System designs that are a non-starter for =
OpenBMC?
>=20
> Intel has supported systems like this in the past, and it is likely =
that we will have need of multi-node/multi-bmc systems in the future.

Thanks Vernon - its good to hear there might be room to collaborate on =
this.

>=20
> Our systems in the past have been sled-based with four sleds =
(BMC+host) per chassis and the BMCs connected via I2C over the =
backplane.  One of the BMCs was elected (based on availability and ID) =
to be the master for the system to control the shared resources (power =
supplies and other common stuff).=20
> Each BMC was individually accessible in the normal ways (KCS from host =
or RMCP/web over the network).
>=20
> Is this the sort of stuff that you are looking for or were you =
thinking of BMC redundancy for a single system?

I think so yes.  Very similar to what you describe but with a single
SMP fabric across all the sleds.  I think in practice it doesn=E2=80=99t
make much difference - the SMP fabric would just another shared
resource amongst the sleds.

>=20
> --Vernon
