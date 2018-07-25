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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41bB1Q0yfhzDrHN
 for <openbmc@lists.ozlabs.org>; Wed, 25 Jul 2018 20:15:04 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
Message-ID: <1532513696.11932.8.camel@fuzziesquirrel.com>
Subject: Re: Need create a repo for chassis implementation.
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: "Wang, Kuiying" <kuiying.wang@intel.com>, "'openbmc@lists.ozlabs.org'"
 <openbmc@lists.ozlabs.org>
Cc: "'geissonator@yahoo.com'" <geissonator@yahoo.com>, "Tanous, Ed"
 <ed.tanous@intel.com>, "'yong.b.li@linux.intel.com'"
 <yong.b.li@linux.intel.com>,  "'richard.marian.thomaiyar@linux.intel.com'"
 <richard.marian.thomaiyar@linux.intel.com>, "'tomjoseph@in.ibm.com'"
 <tomjoseph@in.ibm.com>, "'openbmc-ci-admin@ozlabs.org'"
 <openbmc-ci-admin@ozlabs.org>, "'adamliyi@msn.com'" <adamliyi@msn.com>
Date: Wed, 25 Jul 2018 06:14:56 -0400
In-Reply-To: <959CAFA1E282D14FB901BE9A7BF4E77249DD28C6@SHSMSX101.ccr.corp.intel.com>
References: <959CAFA1E282D14FB901BE9A7BF4E77249DD28C6@SHSMSX101.ccr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Wed, 25 Jul 2018 10:15:06 -0000

On Wed, 2018-07-18 at 02:46 +0000, Wang, Kuiying wrote:
> Hi Brad/Andrew,
> =20
> As we discussed, I will upgrade Chassis based on C++ & sdbusplus by 3
> steps.
> Now, the step 1 is almost ready (Patch got two +1), so we can move on
> the step 2 =E2=80=9Cupstream the chassis implementation=E2=80=9D.
> Can you help create a repo =E2=80=9Cchassis-manager=E2=80=9D for chassi=
s
> implementation?

Hi Kuiying

Andrew tried to reply to your note but it was bounced by the list for
being too big.  In the future please don't send pictures or attachments
to the list.  I'll insert Andrew's reply here.

thx - brad

Hi Kuiying, thanks for refactoring these skeleton repositories. Within
openbmc, we try to have smaller, more specific repositories. So I'm
wondering if instead we should create a repo specifically for handling
buttons on openbmc machines:
phosphor-buttons

The pychassisctl function has all been deprecated by phosphor-state-
manager interfaces (except the button event monitoring).  I'd vote we
just put the button actions in the new phosphor-button repo (i.e.
calling the appropriate systemd targets)

The power control function is a bit more complicated.  It could be
specific to a machine, specific to a company, or specific to the type
of hardware.  The design there is to have a common dbus API and then a
repo for different implementations.  The code in skeleton/op-
pwrctl/power_control_obj.c was I believe attempted to be written in a
generic way but based on your info below, seems like for now we need
two new repositories?

openpower-power-control
x86-power-control =20

Andrew

> =20
> More info attached:
>=20
> =20
>       =20
> Thanks,
> Kuiying.
