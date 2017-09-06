Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xnZ1y0dsGzDrK1
 for <openbmc@lists.ozlabs.org>; Thu,  7 Sep 2017 05:50:28 +1000 (AEST)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Sep 2017 12:50:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,355,1500966000"; d="scan'208";a="126210656"
Received: from mauery.jf.intel.com (HELO mauery) ([10.7.150.85])
 by orsmga004.jf.intel.com with ESMTP; 06 Sep 2017 12:50:26 -0700
Date: Wed, 6 Sep 2017 12:50:26 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Andrew Geissler <geissonator@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: RFC Systemd Service Restart Policy
Message-ID: <20170906195026.GD69617@mauery>
References: <CALLMt=q55PXP7_D49z2NHh9eZDzm1Z6MRzbSe=j1uaoUjsuFiA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CALLMt=q55PXP7_D49z2NHh9eZDzm1Z6MRzbSe=j1uaoUjsuFiA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Sep 2017 19:50:30 -0000

On 06-Sep-2017 02:03 PM, Andrew Geissler wrote:
> I=E2=80=99ve got an old but good one this sprint,
> https://github.com/openbmc/openbmc/issues/272
>=20
> The point of this issue is to define our restart and recovery policy
> for openbmc services.
>=20
> Currently we=E2=80=99re using the systemd defaults, which are the followi=
ng:
> RestartSec=3D100ms
> StartLimitIntervalSec=3D10s
> StartLimitBurst=3D5
> StartLimitAction=3Dnone
>=20
> So basically if a service fails, we will restart it up to 5 times,
> every 10s, with a 100ms delay between each restart.
> There is no action taken when we reach the 5 restarts, other then to
> do nothing until the 10s window has expired.
>=20
> I=E2=80=99d like to propose a few changes for openbmc:
>=20
> 1.  Change the StartLimitBurst to 3
> Five just seems excessive for our services in openbmc.  In all fail
> scenarios I=E2=80=99ve seen so far (other then with phosphor-hwmon), eith=
er
> restarting once does the job or restarting all 5 times does not help
> and we just end up hitting the 5 limit anyway.
>=20
> 2. Change the RestartSec from 100ms to 1s.
> When a service hits a failure, our new debug collection service kicks
> in.  When a core file is involved we=E2=80=99ve found that generating 5 c=
ore
> files within ~500ms puts a huge strain on the BMC.  Also, if we are
> going to get a fix on a restart of a service, the more time the better
> (think retries on device driver scenarios).

I think these two are pretty reasonable. We have had similar behavior=20
implemented on prior generations of BMC. I like your reasoning for both=20
changes.

> 3. Define a StartLimitAction for critical services to =E2=80=9Creboot=E2=
=80=9D the BMC
> With 1 and 2 above, we could have services starting indefinitely with
> no real recovery on the BMC.  Certain services are critical though,
> and I believe should result in a BMC reset to try and recover.  Those
> service are the following:
>    o dbus.service
>    o xyz.openbmc_project.ObjectMapper.service
>=20
> Some services that are on the bubble for me (external interfaces):
>    o phosphor-ipmi-host.service
>    o phosphor-ipmi-net.service
>    o dropbear@.service
>    o phosphor-gevent.service
>=20
> I have some maintainability concerns with trying to pick specific
> services to cause a BMC reboot.  Maybe it would be better to define a
> default  that all services cause a BMC reboot, then pick specific
> one=E2=80=99s that would not result in a reboot?  Or maybe it=E2=80=99s b=
est to never
> reboot, and just let the system owners manage it?  Thoughts
> appreciated.

I would prefer that we have a set core (such as dbus and the mapper)=20
that are terminal faults (maybe even without retries) and then assume=20
that everything else can be restarted nicely. If something cannot be=20
restarted nicely, there should be a really good reason for that and that=20
service's unit file can specify something other than the defaults to=20
change its behavior.

This is a Linux system; in the ideal world, it should only need to be=20
restarted for firmware updates. All other faults should be recoverable.=20
Ideal world aside, individual services that can only be recovered with a=20
reboot can handle that case without adjusting the global default.

--Vernon

> References:
> https://www.freedesktop.org/software/systemd/man/systemd.unit.html#
