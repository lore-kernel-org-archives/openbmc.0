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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41VyW80qbWzF35L
 for <openbmc@lists.ozlabs.org>; Wed, 18 Jul 2018 23:22:42 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 190635C096;
 Wed, 18 Jul 2018 09:22:09 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: Help patching rest_dbus.py
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAMNAJg33kMTbK-H=Aq--rxT=-K+7P1efGqR5XqV8ANy9spbwDw@mail.gmail.com>
Date: Wed, 18 Jul 2018 09:22:08 -0400
Cc: openbmc@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <A5B126A5-9C2D-41F0-9E01-D5E01AC96080@fuzziesquirrel.com>
References: <CAMNAJg33kMTbK-H=Aq--rxT=-K+7P1efGqR5XqV8ANy9spbwDw@mail.gmail.com>
To: guhan balasubramanian <guhan.sac@gmail.com>
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
X-List-Received-Date: Wed, 18 Jul 2018 13:22:45 -0000


> On Jul 17, 2018, at 2:10 PM, guhan balasubramanian =
<guhan.sac@gmail.com> wrote:
>=20
> Hi,
>=20
> We are trying to make some custom changes to the phosphor web =
application.

Can you describe what the custom changes are?  Maybe upstreaming your =
changes
is possible and you don=E2=80=99t need a bbappend at all.

> Since the web application is present in meta-phosphor, we were trying =
to patch the web application from our own meta layer.=20
>=20
> =46rom the tmp/work/ directory, I was able to create a git patch for =
the rest_dbus.py file in phosphor-gevent and phosphor-rest.=20
>=20
> But since the source is not included directly, I get a quilt error =
saying that there is no file to patch.=20
>=20
> The web (bottle) application I see, is included through the following =
variable:=20
> SYSTEMD_ENVIRONMENT_FILE_${PN} +=3D "obmc/wsgi_app"
>=20
> Can someone please help with what I am missing or the best way to go =
about this?=20
>=20
> -----
> bash-4.2$ tree phosphor-rest/
> phosphor-rest/
> =E2=94=9C=E2=94=80=E2=94=80 phosphor-rest
> =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 0001-rest-dbus-test.patch
> =E2=94=94=E2=94=80=E2=94=80 phosphor-rest.bbappend
>=20
> 1 directory, 2 files
> bash-4.2$ cat phosphor-rest/phosphor-rest.bbappend=20
> FILESEXTRAPATHS_prepend :=3D "${THISDIR}/phosphor-rest:"
> SRC_URI +=3D " \
>      file://0001-rest-dbus-test.patch \
> "
> bash-4.2$=20
> -------
>=20
>=20
> Thanks,
> Guhan
