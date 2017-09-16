Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xvmjX29HyzDrSM
 for <openbmc@lists.ozlabs.org>; Sun, 17 Sep 2017 08:12:46 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
Message-ID: <1505599960.32310.1.camel@fuzziesquirrel.com>
Subject: Re: GPIO Centralized Control Daemon
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Patrick Venture <venture@google.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Date: Sat, 16 Sep 2017 18:12:40 -0400
In-Reply-To: <CAO=notyfYfT51+q_-8a7S5VrhJtuVbXaSav78mbCmGe6OnvjLA@mail.gmail.com>
References: <CAO=notyfYfT51+q_-8a7S5VrhJtuVbXaSav78mbCmGe6OnvjLA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Sat, 16 Sep 2017 22:12:48 -0000

Hi Patrick

On Thu, 2017-09-14 at 15:02 -0700, Patrick Venture wrote:
> I apologize if this already exists or is in the works.
>=20
> I propose we create a daemon that centralizes userspace GPIO access.
>=20
> From a high level, the daemon will implement interfaces to export or
> unexport GPIOs.=C2=A0 Each GPIO exported will exist on the dbus:
>=20
> /xyz/openbmc_project/gpio/53 and implement an interface with the
> following properties:
> value, direction, active_low, etc.

Just thinking out loud...are we sure a gpio is a useful abstraction?=20
If applications all just use the chardev API what is the benefit of
having a dbus object, at the cost of API complexity.

>=20
> Some doubts, should the gpio name on the dbus be the relative name
> (53), should it be the system specific name (G5) or the absolute
> name?=C2=A0 I'm thinking the relative name and let the daemon handle
> internalizing the adjustment from relative to absolute.
>=20
> I'm working on adding GPIO support within phosphor-hwmon so that I
> can access a voltage sensor that's gated by a GPIO, and I know there=20

Can you elaborate on what gated means?  Is it you have to wiggle a GPIO
before the hwmon driver for this voltage sensor can actually access the
sensor hardware?


> have been conversations and implementations of this for IPMI OEM --
> and I think it could easily be centralized.
>=20
> Thoughts?
>=20
> Patrick
