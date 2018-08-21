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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41vqTB467xzF0kx
 for <openbmc@lists.ozlabs.org>; Tue, 21 Aug 2018 22:18:20 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 5E4266E209;
 Tue, 21 Aug 2018 08:18:15 -0400 (EDT)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: Streaming logs via rsyslog
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <1c87c6bc-0f3b-73f2-e2a5-4b6ad7180f99@linux.vnet.ibm.com>
Date: Tue, 21 Aug 2018 08:18:15 -0400
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <041864C3-3D6F-4C41-B69E-3CD44272A3DC@fuzziesquirrel.com>
References: <1c87c6bc-0f3b-73f2-e2a5-4b6ad7180f99@linux.vnet.ibm.com>
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
X-Mailer: Apple Mail (2.3273)
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
X-List-Received-Date: Tue, 21 Aug 2018 12:18:23 -0000


> On Aug 16, 2018, at 6:21 AM, Deepak Kodihalli =
<dkodihal@linux.vnet.ibm.com> wrote:
>=20
> Hi,
>=20
> We have a requirement to forward BMC logs (the systemd journal) to an =
external logging server.
>=20
> We're proposing doing this by making use of rsyslog. Here are notes =
based on some initial investigation.
>=20
> Forwarding the journal logs to a syslog daemon :
> Journald has this feature of being able to write journal logs to a =
socket which then can be read by a syslog daemon. I see that (on =
Witherspoon at least) the syslog daemon running by default (busybox =
syslogd) doesn't support reading logs forwarded by the journald to due =
to this commit : =
https://git.busybox.net/busybox/commit/?id=3Daccd9eeb719916da974584b33b1ae=
ced5f3bb346. However, I could get the forwarding working with the =
rsyslog daemon. I found an existing rsyslog recipe in the meta-oe layer.
>=20
> rsyslog configuration :
> rsyslog is configurable in various ways. For example, I can turn off =
local logging altogether via a config file, if I'm interested only in =
using rsyslog for streaming journal logs out. Various optional features =
can be turned off at build time to save flash space.
>=20
> rsyslog server provision :
> The BMC would need to be made aware of the external rsyslog server. =
This can just be an admin updating the rsyslog config file on the BMC, =
and there could also be a REST API if need be. I think a small app can =
implement the =
https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbm=
c_project/Network/Client.interface.yaml interface to update the rsyslog =
config.
>=20
> streaming :
> rsyslog can be configured to make use of TCP, or UDP, and optionally =
TLS. I think TCP is the default.
>=20
>=20
> Thoughts on this proposal? If this sounds okay, I'm planning to get =
some commits up in Gerrit for review. I can pull rsyslog in a phosphor =
layer (I mean as the default choice of a syslog daemon, replacing =
busybox syslog) if there's interest, as opposed to making it only a =
meta-witherspoon package. Specific rsyslog package config and config =
file overrides are possible in system specific layers.
>=20
> Regards,
> Deepak

Hi Deepak

Plain-old syslogd can forward log entries over the network to another
syslogd instance.  Did we evaluate that?

-brad=
