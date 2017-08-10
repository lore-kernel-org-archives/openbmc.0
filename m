Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xSr091D0GzDqrx
 for <openbmc@lists.ozlabs.org>; Fri, 11 Aug 2017 00:20:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="OooN534X"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="NOqzlWJd"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8173E205A1;
 Thu, 10 Aug 2017 10:20:54 -0400 (EDT)
Received: from web1 ([10.202.2.211])
 by compute4.internal (MEProxy); Thu, 10 Aug 2017 10:20:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=RtkDyJ9IoH35oaKZI/44hVGgL8tWU
 vGEhdU1e8ZWI90=; b=OooN534XNT1g9LfFCDOB4fp+BJxtlIIYIvE5y44CzchTw
 emerP8TQaCJ9MnTKdsOWBdV/bNWUWeC8CJGlef9x7y92RBCqWMh9zb7ikuSB5OsE
 kZmaK707Ut2ZU/I5WAj6EZUxt4cQetO3u81ndrVv5aXk2yClnHGM5+uUrTOUcby8
 9chN6TCmmrcy7C+ZUy0CQMD5ncnTrXL8ve6Hox3mI2dcO/8wfaMWaOoqO8mtpLDd
 YbmsJADRfsambZaS2FQkZ4PBSV6uu0Ktj4sy+moeMhL1TKE/k6tRihHaaiQjjn0j
 0YSonXdxIYjHJmleKoCh93ULAWV/xICFga84Unx9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=RtkDyJ
 9IoH35oaKZI/44hVGgL8tWUvGEhdU1e8ZWI90=; b=NOqzlWJdocTGqigQpm5Iio
 Dp8r2W1PzIGmAbl/kCIkZKL2G4Z3tM8qXAHcsNW80JJi4Bn/3Aj3rtehJWapg0dI
 cpgyvzXECvH/Gzd95tvBvm+wn25GHnsFAhW7nDKI6DWjL0oE/OexuhRwmqGcZPva
 bWDKnJiwXnrgo5SB0NCGlMZQVooOtWXHYC/SzwPf3ravqfmzCd7RnVlz7oEwFj+u
 NyGZUoy8XTlnYfnaZXTui9f1YndfkpGzFW1uFOz1eRzelMClv1PLw0knGpYVRQeZ
 uADMWY7BzKe9chuuG/WebMcCB4JFj6EnOzZGTIJcn2pTqe7xgnYWqhHuByD86s+w
 ==
X-ME-Sender: <xms:xmuMWSSZYNwZNZZYvnAtcx2fA_bAYtj67wjPPc3W3isyKI_3AxgoVQ>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 6474795712; Thu, 10 Aug 2017 10:20:54 -0400 (EDT)
Message-Id: <1502374854.1431709.1069264592.5D5C9137@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?utf-8?Q?David=20M=C3=BCller=20=28ELSOFT=20AG=29?=
 <d.mueller@elsoft.ch>, openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-b56c1ff4
Subject: Re: Crashing Phosphor Settings Manager
In-Reply-To: <ee3d713b-b320-4d4d-a758-0684de0799d9@elsoft.ch>
Date: Thu, 10 Aug 2017 23:50:54 +0930
References: <f332da14-43c6-ccf9-b602-ca5358dd124e@elsoft.ch>
 <ee3d713b-b320-4d4d-a758-0684de0799d9@elsoft.ch>
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
X-List-Received-Date: Thu, 10 Aug 2017 14:20:58 -0000

Hi Dave,

On Thu, Aug 10, 2017, at 23:07, David M=C3=BCller (ELSOFT AG) wrote:
> Hello
>=20
> While trying to further debug my problem, I had the idea to check how
> things are done on the AST2500 eval board. So I built and install a new
> flash image using the "evb-ast2500" configuration.
>=20
> Unfortunately the symtoms are the same as with my custom configuration.
>=20
> - The evb-ast2500 OpenBMC configuration is known to be good, isn't it?
>=20
> - Which process/service is responsible for the "/org/openbmc/control"
>   object?
>=20
>=20
> root@evb-ast2500:~# cat /etc/os-release
> ID=3D"openbmc-phosphor"
> NAME=3D"Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro)"
> VERSION=3D"v1.99.8-208"
> VERSION_ID=3D"v1.99.8-208-g4ee67571-dirty"
> PRETTY_NAME=3D"Phosphor OpenBMC (Phosphor OpenBMC Project Reference
> Distro) v1.99.8-208"
> BUILD_ID=3D"v1.99.8"
>=20
>=20
>=20
> Aug 10 11:28:27 evb-ast2500 daemon.info systemd[1]: Starting Phosphor
> Settings Manager...
> Aug 10 11:28:29 evb-ast2500 daemon.info settings_manager.py[1033]:
> Traceback (most recent call last):
> Aug 10 11:28:29 evb-ast2500 daemon.info settings_manager.py[1033]:
> File "/usr/sbin/settings_manager.py", line 262, in <module>
> Aug 10 11:28:29 evb-ast2500 daemon.info settings_manager.py[1033]:
> allobjects =3D create_object(s.SETTINGS)
> Aug 10 11:28:29 evb-ast2500 daemon.info settings_manager.py[1033]:
> File "/usr/sbin/settings_manager.py", line 72, in create_object
> Aug 10 11:28:29 evb-ast2500 daemon.info settings_manager.py[1033]:
> retries=3D10, interval=3D0.1)
> Aug 10 11:28:29 evb-ast2500 daemon.info settings_manager.py[1033]:
> File "/usr/lib/python2.7/site-packages/obmc/mapper/bindings.py", line
> 66, in get_subtree_paths
> Aug 10 11:28:29 evb-ast2500 daemon.info settings_manager.py[1033]:
> retries, interval)
> Aug 10 11:28:29 evb-ast2500 daemon.info settings_manager.py[1033]:
> File "/usr/lib/python2.7/site-packages/obmc/mapper/bindings.py", line
> 42, in retry
> Aug 10 11:28:29 evb-ast2500 daemon.info settings_manager.py[1033]:
> return func()
> Aug 10 11:28:29 evb-ast2500 daemon.info settings_manager.py[1033]:
> File "/usr/lib/python2.7/site-packages/obmc/mapper/bindings.py", line
> 65, in <lambda>
> Aug 10 11:28:29 evb-ast2500 daemon.info settings_manager.py[1033]:
> path, de/lib/python2.7/site-packages/dbus/connection.py", line 651, in
> call_blocking
> Aug 10 11:40:45 evb-ast2500 daemon.info settings_manager.py[1589]:
> message, timeout)
> Aug 10 11:40:45 evb-ast2500 daemon.info settings_manager.py[1589]:
> dbus.exceptions.DBusException: org.freedesktop.DBus.Error.FileNotFound:
> path or object not found: /org/openbmc/control
> Aug 10 11:40:45 evb-ast2500 daemon.notice systemd[1]:
> org.openbmc.settings.Host
> .service: Main process exited, code=3Dexited, status=3D1/FAILURE
> Aug 10 11:40:45 evb-ast2500 daemon.err systemd[1]: Failed to start
> Phosphor Settings Manager.
> Aug 10 11:40:45 evb-ast2500 daemon.notice systemd[1]:
> org.openbmc.settings.Host.service: Unit entered failed state.
> Aug 10 11:40:45 evb-ast2500 daemon.warn systemd[1]:
> org.openbmc.settings.Host.service: Failed with result 'exit-code'.
> Aug 10 11:40:46 evb-ast2500 daemon.info systemd[1]:
> org.openbmc.settings.Host.service: Service hold-off time over,
> scheduling restart.
> Aug 10 11:40:46 evb-ast2500 daemon.info systemd[1]: Stopped Phosphor
> Settings Manager.

Your best bet might be to open an issue on Github. I had a quick search
and couldn't see any existing issues that were relevant.

Andrew

>=20
>=20
> Dave
