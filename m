Return-Path: <kunyi@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::141; helo=mail-it1-x141.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ByOc3dxk"; 
 dkim-atps=neutral
Received: from mail-it1-x141.google.com (mail-it1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44QCXk0MS5zDqSg
 for <openbmc@lists.ozlabs.org>; Fri, 22 Mar 2019 03:53:23 +1100 (AEDT)
Received: by mail-it1-x141.google.com with SMTP id z124so5168555itc.2
 for <openbmc@lists.ozlabs.org>; Thu, 21 Mar 2019 09:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=4GZWUc85i18fO8xXG8j+n30pOCfuKt5x67i7Rj6wPhU=;
 b=ByOc3dxkrk37XRaCQ42xC7lj2leO5OpU5ckJkdPhMU6aMiRFMlyZgYZ+PwW1UqokYd
 HQuo8UqJIrJA89xmXb+nhkkPz0RU6CbS9GbhROHP7PMaDcFyXdhpvgsagoHuVmXwwrOd
 YG4+exQfZmZFOVElYDMsn649xqyLqWVN7wmxd+gvJbQVGDqAsHeK+QIpGVoQgqNzwYcJ
 Vvgi0nm5sNlAYh+IOEEmx+MZSjazSUgsQ5d/3ylrOHDPgxl57aSylQ7OyXxJTpuAGo5w
 78Ahx55+XsimKTpZiVSZs5agInfDs2TBEC6uJg4BBe7CrBxQ+q36B3NtUdYPMyNJ83+s
 /whw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=4GZWUc85i18fO8xXG8j+n30pOCfuKt5x67i7Rj6wPhU=;
 b=oDUDG08oUlbA0okI9K8LnzmYv5Unsm/ygCa77CbMIUWZ1q5GAZKdh+yMhKBVjUPfFl
 g9IKswePZIG2YRwC+bm+q+afoSVB2on51A75NuIoELD9hwtHCoVKGXYriB/g6aP7VVQq
 wgeh/uqM0ErUtq3/dIMuwQ4zJwgy/c0QuPY07shFq70Tciy293qMyQZUJbKqOR7ggQ2s
 7SnOYSKgvda9a07vnqV1Go44e/kxMytShJNA+drsMhI37v2+WYqxbU45Rc/JzSM7tvQf
 Z75MEUAA30Ga6dNm9XuBPrY5M3pN23R+RzvzmRbkWS2W7rD027ystuuBJy9dmqDL1JDr
 4dOw==
X-Gm-Message-State: APjAAAUrPRP/Gwm1llIw0q3BP1BSfsz/xLTN8wKnbA528hl3l71AJUSy
 q9cWPDQinKPcTiRJj1nV53fTW/xeGEAtrF1vt4qjNLsSYkgjew==
X-Google-Smtp-Source: APXvYqz/mt2cqGrK3WA6oBAMKn1IpfIXHmonwpywfq/KRwyFhrkeziAbWbwexHo/w1A96ndSSjiYOjiYnJmJXc63NX8=
X-Received: by 2002:a05:660c:1:: with SMTP id q1mr3151168itj.98.1553187199607; 
 Thu, 21 Mar 2019 09:53:19 -0700 (PDT)
MIME-Version: 1.0
From: Kun Yi <kunyi@google.com>
Date: Thu, 21 Mar 2019 09:52:53 -0700
Message-ID: <CAGMNF6W+m-AjmJVwP1U=Pbv7-Ww4L2w5JYvH124hZ70xz30B1w@mail.gmail.com>
Subject: Phosphor inventory random failure and generating file names with
 weird characters?
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000004debc405849d9389"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Mar 2019 16:53:26 -0000

--0000000000004debc405849d9389
Content-Type: text/plain; charset="UTF-8"

Hello friends,

I'm seeing a weird error and need your help. Basically I saw two symptoms
that may or may not be related, and seems no one has reported them yet in
Github issues. The BMC software stack is based on 2.6 release.

1. With repeated BMC reboot occasionally obmc-read-eeprom will fail to get
the result from a mapper DBus call:

$ systemctl status obmc-read-eeprom@system-chassis-motherboard.service

Mar 07 21:36:04  systemd[1]: Starting Read system/chassis/motherboard
EEPROM...
Mar 07 21:36:06  phosphor-read-eeprom[2598]: FRU Data
Mar 07 21:36:06  phosphor-read-eeprom[2598]: Successfully verified area.
Mar 07 21:36:06  phosphor-read-eeprom[2598]: Populated FRU areas
Mar 07 21:36:13  phosphor-read-eeprom[2598]:
[[0;1;31m[[0;1;39m[[0;1;31mException from sdbus call[[0m
Mar 07 21:36:13  phosphor-read-eeprom[2598]: sd_bus_call:
org.freedesktop.DBus.Error.FileNotFound: path or object not found
Mar 07 21:36:13  phosphor-read-eeprom[2598]:
[[0;1;31m[[0;1;39m[[0;1;31mError updating inventory.[[0m
Mar 07 21:36:13  systemd[1]:
[[0;1;39m[[0;1;31m[[0;1;39mobmc-read-eeprom@system-chassis-motherboard.service:
Main process exit
ed, code=exited, status=1/FAILURE[[0m

this is a call to mapper "GetObject sas /xyz/openbmc_project/inventory 1
xyz.openbmc_project.Inventory.Manager". However both the mapper and
inventory manager seem to run fine, and
mapper-wait-xyz.openbmc_project.Inventory.Manager exits correctly
before obmc-read-eeprom is started.

At this point, I'm not sure whether it's a problem with the object mapper,
inventory manager, or something else.

2. Upon closer inspection, the system has had many weird filenames in its
RW partition where the inventory serialization data is stored:

/var/lib/phosphor-inventory-manager/xyz/openbmc_project/inventory/system:
drwxr-xr-x    3 root     root             0 Mar  8 00:38 chassis
-rw-r--r--    1 root     root            81 Mar  8 00:38
xyz.openOby?:w=?xyz.Invebmc_?8?$xyz.tor.AssetTag
-rw-r--r--    1 root     root            81 Mar 21 03:17
xyz.openbmc_project.Inventory.Decorator.AssetTag
-rw-r--r--    1 root     root            81 Mar 20 23:29
xyz.openbmc_projxyz.Inventory.Deect.tor.AssetTag
-rw-r--r--    1 root     root            81 Mar 20 17:44
xyz.openbmc_projxyz.Inventory.Dexyz.tor.AssetTag
-rw-r--r--    1 root     root            81 Mar  8 00:38
xyz.openbmc_????xyz.Inventor???{xyz.tor.AssetTag
-rw-r--r--    1 root     root            81 Mar  8 00:38
xyz.open???t's??xyz.Invebmc_?7V?xyz.tor.AssetTag

/var/lib/phosphor-inventory-manager/xyz/openbmc_project/inventory/system/chassis:
drwxr-xr-x    2 root     root             0 Mar 20 21:35 motherboard

/var/lib/phosphor-inventory-manager/xyz/openbmc_project/inventory/system/chassis/motherboard:
-rw-r--r--    1 root     root           223 Mar  8 00:38
xyz.open6????d?!xyz.Invebmc_y??mxyz.tor.Asset
-rw-r--r--    1 root     root           223 Mar  8 00:38
xyz.openEyU?4]#?xyz.Inve???????Oxyz.tor.Asset
-rw-r--r--    1 root     root           223 Mar 20 21:42
xyz.openbmc_project.Inventory.Decorator.Asset
-rw-r--r--    1 root     root           113 Mar 20 21:42
xyz.openbmc_project.Inventory.Item
-rw-r--r--    1 root     root           223 Mar 20 17:45
xyz.openbmc_projxyz.Inventory.Deect.tor.Asset
-rw-r--r--    1 root     root           223 Mar 20 23:29
xyz.open????y??mxyz.Invebmc_project.tor.Asset
-rw-r--r--    1 root     root           223 Mar  8 00:38
xyz.open??N6m???xyz.Inve?n{??FT?xyz.tor.Asset

Is this expected? I deleted the directory for serialized data and rebooted
the BMC, and it only generates one item with valid names.

Any suggestions on how to debug these? I will convert these to Github
issues and append my findings if any.

-- 
Regards,
Kun

--0000000000004debc405849d9389
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hello friends,=
<div><br></div><div>I&#39;m seeing a weird error and need your help. Basica=
lly I saw two symptoms that may or may not be related, and seems no one has=
 reported them yet in Github issues. The BMC software stack is based on 2.6=
 release.</div><div><br></div><div>1. With repeated BMC reboot occasionally=
=C2=A0obmc-read-eeprom will fail to get the result from a mapper DBus call:=
</div><div><br></div><div><div>$ systemctl status obmc-read-eeprom@system-c=
hassis-motherboard.service</div><div><br></div><div>Mar 07 21:36:04=C2=A0 s=
ystemd[1]: Starting Read system/chassis/motherboard EEPROM...</div><div>Mar=
 07 21:36:06=C2=A0 phosphor-read-eeprom[2598]: FRU Data</div><div>Mar 07 21=
:36:06=C2=A0 phosphor-read-eeprom[2598]: Successfully verified area.</div><=
div>Mar 07 21:36:06=C2=A0 phosphor-read-eeprom[2598]: Populated FRU areas</=
div><div>Mar 07 21:36:13=C2=A0 phosphor-read-eeprom[2598]: [[0;1;31m[[0;1;3=
9m[[0;1;31mException from sdbus call[[0m</div><div>Mar 07 21:36:13=C2=A0 ph=
osphor-read-eeprom[2598]: sd_bus_call: org.freedesktop.DBus.Error.FileNotFo=
und: path or object not found</div><div>Mar 07 21:36:13=C2=A0 phosphor-read=
-eeprom[2598]: [[0;1;31m[[0;1;39m[[0;1;31mError updating inventory.[[0m</di=
v><div>Mar 07 21:36:13=C2=A0 systemd[1]: [[0;1;39m[[0;1;31m[[0;1;39mobmc-re=
ad-eeprom@system-chassis-motherboard.service: Main process exit</div><div>e=
d, code=3Dexited, status=3D1/FAILURE[[0m</div></div><div><br></div><div>thi=
s is a call to mapper &quot;GetObject sas /xyz/openbmc_project/inventory 1 =
xyz.openbmc_project.Inventory.Manager&quot;. However both the mapper and in=
ventory manager seem to run fine, and mapper-wait-xyz.openbmc_project.Inven=
tory.Manager exits correctly before=C2=A0obmc-read-eeprom is started.</div>=
<div><br></div><div>At this point, I&#39;m not sure whether it&#39;s a prob=
lem with the object mapper, inventory manager, or something else.</div><div=
><br></div><div>2. Upon closer inspection, the system has had many weird fi=
lenames in its RW partition where the inventory serialization data is store=
d:</div><div><br></div><div><div>/var/lib/phosphor-inventory-manager/xyz/op=
enbmc_project/inventory/system:</div><div>drwxr-xr-x=C2=A0 =C2=A0 3 root=C2=
=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 Mar=
=C2=A0 8 00:38 chassis</div><div>-rw-r--r--=C2=A0 =C2=A0 1 root=C2=A0 =C2=
=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 81 Mar=C2=A0 8 00:3=
8 xyz.openOby?:w=3D?xyz.Invebmc_?8?$xyz.tor.AssetTag</div><div>-rw-r--r--=
=C2=A0 =C2=A0 1 root=C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 81 Mar 21 03:17 xyz.openbmc_project.Inventory.Decorator.AssetTag=
</div><div>-rw-r--r--=C2=A0 =C2=A0 1 root=C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 81 Mar 20 23:29 xyz.openbmc_projxyz.Invento=
ry.Deect.tor.AssetTag</div><div>-rw-r--r--=C2=A0 =C2=A0 1 root=C2=A0 =C2=A0=
 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 81 Mar 20 17:44 xyz.op=
enbmc_projxyz.Inventory.Dexyz.tor.AssetTag</div><div>-rw-r--r--=C2=A0 =C2=
=A0 1 root=C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 81 Mar=C2=A0 8 00:38 xyz.openbmc_????xyz.Inventor???{xyz.tor.AssetTag</div=
><div>-rw-r--r--=C2=A0 =C2=A0 1 root=C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 81 Mar=C2=A0 8 00:38 xyz.open???t&#39;s??xyz.In=
vebmc_?7V?xyz.tor.AssetTag</div><div><br></div><div>/var/lib/phosphor-inven=
tory-manager/xyz/openbmc_project/inventory/system/chassis:</div><div>drwxr-=
xr-x=C2=A0 =C2=A0 2 root=C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A00 Mar 20 21:35 motherboard</div><div><br></div><div>/v=
ar/lib/phosphor-inventory-manager/xyz/openbmc_project/inventory/system/chas=
sis/motherboard:</div><div>-rw-r--r--=C2=A0 =C2=A0 1 root=C2=A0 =C2=A0 =C2=
=A0root=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0223 Mar=C2=A0 8 00:38 xyz.o=
pen6????d?!xyz.Invebmc_y??mxyz.tor.Asset</div><div>-rw-r--r--=C2=A0 =C2=A0 =
1 root=C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0223 =
Mar=C2=A0 8 00:38 xyz.openEyU?4]#?xyz.Inve???????Oxyz.tor.Asset</div><div>-=
rw-r--r--=C2=A0 =C2=A0 1 root=C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0223 Mar 20 21:42 xyz.openbmc_project.Inventory.Decorato=
r.Asset</div><div>-rw-r--r--=C2=A0 =C2=A0 1 root=C2=A0 =C2=A0 =C2=A0root=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0113 Mar 20 21:42 xyz.openbmc_project.=
Inventory.Item</div><div>-rw-r--r--=C2=A0 =C2=A0 1 root=C2=A0 =C2=A0 =C2=A0=
root=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0223 Mar 20 17:45 xyz.openbmc_p=
rojxyz.Inventory.Deect.tor.Asset</div><div>-rw-r--r--=C2=A0 =C2=A0 1 root=
=C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0223 Mar 20=
 23:29 xyz.open????y??mxyz.Invebmc_project.tor.Asset</div><div>-rw-r--r--=
=C2=A0 =C2=A0 1 root=C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0223 Mar=C2=A0 8 00:38 xyz.open??N6m???xyz.Inve?n{??FT?xyz.tor.Ass=
et</div></div><div><br></div><div>Is this expected? I deleted the directory=
 for serialized data and rebooted the BMC, and it only generates one item w=
ith valid names.</div><div><br></div><div>Any suggestions on how to debug t=
hese? I will convert these to Github issues and append my findings if any.<=
/div><div></div><div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail-=
m_-4760977766139129335gmail_signature"><div dir=3D"ltr">Regards,<div>Kun</d=
iv></div></div></div></div></div></div></div></div></div></div></div>

--0000000000004debc405849d9389--
