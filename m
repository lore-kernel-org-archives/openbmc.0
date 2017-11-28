Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ymbTh1xg1zDrYv
 for <openbmc@lists.ozlabs.org>; Wed, 29 Nov 2017 07:52:55 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 53EE897580;
 Tue, 28 Nov 2017 15:52:51 -0500 (EST)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: chassis_control.py in skeleton
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <000001d3641d$3e482120$bad86360$@linux.intel.com>
Date: Tue, 28 Nov 2017 15:52:51 -0500
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Li, Yong B" <yong.b.li@intel.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1ABEA804-8141-49CA-AFBF-B47C8D0ABD31@fuzziesquirrel.com>
References: <000001d3641d$3e482120$bad86360$@linux.intel.com>
To: Yong Li <yong.b.li@linux.intel.com>
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
X-List-Received-Date: Tue, 28 Nov 2017 20:52:56 -0000


> On Nov 23, 2017, at 12:38 AM, Yong Li <yong.b.li@linux.intel.com> =
wrote:
>=20
> Hi All,
>=20
> Based on my understanding, these chassis control/system manager =
related
> projects in skeleton should be initial/reference code, and will be

This is correct.  The intent is to remove them eventually.

The replacement for the chassis manager is
https://github.com/openbmc/phosphor-state-manager

The functions of the system manager have gradually been replicated
elsewhere.  For instance its state management functions were
moved to phosphor-state-manager or systemd.  Other functions were
distributed amongst configuration files and other applications.

They have not been removed from the current systems because
they all need to be scrubbed for any remaining usage.

> rewritten/reimplementation. I would like to know if there is any plan =
or
> on-going projects on them?

The plan is to scrub the existing systems and eliminate use of these
programs.  This means identifying any functional gaps in the =
replacements
and implementing those.  I don=E2=80=99t think anyone is working on that =
at the
moment.

Ideally any new layers/platforms being added would just not use
these programs, but I understand if that requires replacement function
that isn=E2=80=99t available and wouldn=E2=80=99t want that to hinder =
upstreaming
of a new platform.

If I were to begin to work on this, I would start by building images
for the current systems, remove these applications from the image
and see what breaks.


>=20
> Thanks,
> Yong Li


-brad=
