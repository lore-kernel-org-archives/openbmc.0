Return-Path: <cyril.bur@au1.ibm.com>
Received: from e23smtp05.au.ibm.com (e23smtp05.au.ibm.com [202.81.31.147])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r9M49680bzDqCc
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2016 16:44:25 +1000 (AEST)
Received: from localhost
 by e23smtp05.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cyril.bur@au1.ibm.com>;
 Thu, 19 May 2016 16:44:24 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp05.au.ibm.com (202.81.31.211) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 19 May 2016 16:44:21 +1000
X-IBM-Helo: d23dlp02.au.ibm.com
X-IBM-MailFrom: cyril.bur@au1.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id A99332BB005E
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2016 16:44:15 +1000 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
 by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u4J6i2kj1966360
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2016 16:44:10 +1000
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u4J6hOpe030567
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2016 16:43:24 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u4J6hNIh029211; Thu, 19 May 2016 16:43:24 +1000
Received: from camb691 (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 2A29AA0196;
 Thu, 19 May 2016 16:41:30 +1000 (AEST)
Date: Thu, 19 May 2016 16:41:24 +1000
From: Cyril Bur <cyril.bur@au1.ibm.com>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH btbridge v4 5/6] Travis CI: Bump to Ubuntu 16.04
Message-ID: <20160519164124.577faad8@camb691>
In-Reply-To: <1463635726.2703.174.camel@aj.id.au>
References: <1462324208-11150-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1462324208-11150-6-git-send-email-openbmc-patches@stwcx.xyz>
 <1463635726.2703.174.camel@aj.id.au>
Organization: IBM
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16051906-0017-0000-0000-000004A85528
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 19 May 2016 06:44:26 -0000

On Thu, 19 May 2016 14:58:46 +0930
Andrew Jeffery <andrew@aj.id.au> wrote:

> On Tue, 2016-05-03 at 20:10 -0500, OpenBMC Patches wrote:
> > From: Cyril Bur <cyril.bur@au1.ibm.com>
> >=20
> > Signed-off-by: Cyril Bur <cyril.bur@au1.ibm.com>
> > ---
> > =C2=A0travis/build.sh | 4 ++--
> > =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/travis/build.sh b/travis/build.sh
> > index e330afd..6b7f0fb 100755
> > --- a/travis/build.sh
> > +++ b/travis/build.sh
> > @@ -2,7 +2,7 @@
> > =C2=A0set -evx
> > =C2=A0
> > =C2=A0Dockerfile=3D$(cat << EOF
> > -FROM ubuntu:15.10
> > +FROM ubuntu:16.04
> > =C2=A0RUN DEBIAN_FRONTEND=3Dnoninteractive apt-get update && apt-get up=
grade -yy
> > =C2=A0RUN DEBIAN_FRONTEND=3Dnoninteractive apt-get install --no-install=
-recommends -yy make gcc libsystemd-dev libc6-dev pkg-config
> > =C2=A0RUN mkdir /var/run/dbus
> > @@ -13,7 +13,7 @@ RUN /bin/bash
> > =C2=A0EOF
> > =C2=A0)
> > =C2=A0
> > -docker pull ubuntu:15.10
> > +docker pull ubuntu:16.04 =20
>=20
> Are there reasons for this beyond it being new and shiny? Whether there
> are or not, can you please add a description of the motivation to the
> commit message?

I like shiny things. Mostly shinyness but 16.04 being LTS is a nice bonus :=
).
Will do.

>=20
> > =C2=A0docker build -t temp - <<< "${Dockerfile}"
> > =C2=A0
> > =C2=A0sudo cp ./travis/org.openbmc.HostIpmi.conf.test /etc/dbus-1/syste=
m.d/org.openbmc.HostIpmi.conf =20
>=20
> Cheers,
>=20
> Andrew
