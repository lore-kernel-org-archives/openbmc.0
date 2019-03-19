Return-Path: <henbinchang@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::834; helo=mail-qt1-x834.google.com;
 envelope-from=henbinchang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="F79jzJST"; 
 dkim-atps=neutral
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44NdC027JYzDqH6
 for <openbmc@lists.ozlabs.org>; Tue, 19 Mar 2019 14:02:32 +1100 (AEDT)
Received: by mail-qt1-x834.google.com with SMTP id t28so20546856qte.6
 for <openbmc@lists.ozlabs.org>; Mon, 18 Mar 2019 20:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=T7KfzykoZcWsgvMoVucJw0rhAOjWIvsfxUdaYnH0oQI=;
 b=F79jzJSTyxG4sUQuPaC7CbXu/IlQ0qw70/x6/93xuBmixctgGeNDu46QDF9b7FxD94
 NFyp3OThI/0efjhDrUYSIQ104SRHJX7OWGakxtbKIHole1PM91ydC59B59n+figt8wV7
 zZI9hNek4iWfL1yNxTXOv8aOrIjgl37si5eR+LCuukz/r/jWAqkFqofVHm9AXRdlE2PG
 RT7Tx2J4rlhaPFgp46ZXqtRn1T5WpE48UnUzpdmUAkUMnBXJ1/Yu8MB7NSkyqv+aqkMT
 PBcNCO+3LhFvSzhewju+hXjX+8aa38Z1+aEr2mPydP4LtmZt0SM/ssOG6jalB9FGBDu9
 uCcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=T7KfzykoZcWsgvMoVucJw0rhAOjWIvsfxUdaYnH0oQI=;
 b=leJU9dfBwV2DsBSHIbK6KGpqRT8tzG9EzYJ0ji0VUsFbtqz682NUbfT1kBLTZd7IOG
 3XRVMBS1AE2qmTlOGB3sKwbF6JCjnC6UhBjdAh0JIhQYsgoLMBP7O6IuQXYvOmpWzaMD
 nEQ6L19AqW1H4r4QyO7eOEzJE3uNcyxJ61wye6EXjYtoxwSVBnqay9B64fcc+jpakbEE
 VRYxR10Ip/mkr2vwV5wPO5Xef+8FwYQIFuA2XqnohYSWF+8lmTpzH607vMjBXS+aOCqv
 UZSD9AOZaRls81nbIvEWubkZ4kIS1xo6hBm8omkERAYh9al5UsGXWQ4ccFuxFxpVPbMJ
 Ur5A==
X-Gm-Message-State: APjAAAUmQzQ1twEXWRqKWrm8ojp3bcH6K0KhXHjtKSOJiGTLYmwDEtt5
 1bAhF0DAMBOHhDEZflncrnmOuOLxgUmlabY+DdvJVub6
X-Google-Smtp-Source: APXvYqysrT6Uc3Hzsx7LwANTKLF/tzOTeOKivYaLRoYNK7PxgBw9V0MZJC70ZXHGwqlIOARV5K9oUzC52nAiQDs8rtA=
X-Received: by 2002:aed:2232:: with SMTP id n47mr151619qtc.63.1552964548599;
 Mon, 18 Mar 2019 20:02:28 -0700 (PDT)
MIME-Version: 1.0
From: Henbin Chang <henbinchang@gmail.com>
Date: Tue, 19 Mar 2019 11:02:17 +0800
Message-ID: <CAG9c7cD-x3sAO_F+=2Qi-NKOoOmLp5P-i_vnzSgnuvr047xCUw@mail.gmail.com>
Subject: Phosphor Hwmon not work
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000044a4e0058469bc58"
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
X-List-Received-Date: Tue, 19 Mar 2019 03:02:38 -0000

--00000000000044a4e0058469bc58
Content-Type: text/plain; charset="UTF-8"

Hi All,

We found the 'Phosphor Hwmon Poller' would terminate with the error message.

Mar 15 09:45:04  systemd[1]: Started Phosphor Hwmon Poller.
Mar 15 09:45:06  phosphor-hwmon-readd[1137]: terminate called after
throwing an instance of 'std::filesystem::__cxx11::filesystem_error'
Mar 15 09:45:06  phosphor-hwmon-readd[1137]:   what():  filesystem error:
recursive directory iterator cannot open directory: No such file or
directory [/ahb/a
pb/i2c@1e78a000/i2c-bus@1c0/tmp421@4f]
Mar 15 09:45:07  systemd[1]:
[[0;1;39m[[0;1;31m[[0;1;39mxyz.openbmc_project.Hwmon@
-ahb-apb-i2c@1e78a000-i2c\x2dbus@1c0-tmp421@4f.service: Main process exited,
code=killed, status=6/ABRT[[0m
Mar 15 09:45:07  systemd[1]:
[[0;1;39m[[0;1;31m[[0;1;39mxyz.openbmc_project.Hwmon@
-ahb-apb-i2c@1e78a000-i2c\x2dbus@1c0-tmp421@4f.service: Failed with result
's
ignal'.[[0m
Mar 15 09:45:08  systemd[1]: xyz.openbmc_project.Hwmon@
-ahb-apb-i2c@1e78a000-i2c\x2dbus@1c0-tmp421@4f.service: Service
RestartSec=1s expired, scheduling restar
t.
Mar 15 09:45:08  systemd[1]: xyz.openbmc_project.Hwmon@
-ahb-apb-i2c@1e78a000-i2c\x2dbus@1c0-tmp421@4f.service: Scheduled restart
job, restart counter is at 2.
Mar 15 09:45:10  systemd[1]: Stopped Phosphor Hwmon Poller.

We confirmed it's caused by the latest commit of phosphor-hwmon repository

commit 9e997b4da98725401769ef82fe26e11c46a059d9
Author: Patrick Venture <venture@google.com>
Date:   Fri Mar 8 13:42:10 2019 -0800

    use filesystem instead of experimental

    Use filesystem now that it should be available instead of
    experimental::filesystem.

    Change-Id: I62838b343ce34f85a47661f1eaaff3c7e6338bbf
    Signed-off-by: Patrick Venture <venture@google.com>

it would work if we reverted that commit.

# ps | grep readd
    2 root         0 SW   [kthreadd]
 1106 root      7668 S    phosphor-hwmon-readd -o /ahb/apb/i2c@1e78a000
/i2c-bus@1c0/tmp421@4f

Can anyone give the suggestion?

Thanks.

--00000000000044a4e0058469bc58
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div><div>Hi All,</div><div><br=
></div><div>We found the &#39;Phosphor Hwmon Poller&#39; would terminate wi=
th the error message.</div><div><br></div><div>Mar 15 09:45:04=C2=A0 system=
d[1]: Started Phosphor Hwmon Poller.</div><div>Mar 15 09:45:06=C2=A0 phosph=
or-hwmon-readd[1137]: terminate called after throwing an instance of &#39;s=
td::filesystem::__cxx11::filesystem_error&#39;</div><div>Mar 15 09:45:06=C2=
=A0 phosphor-hwmon-readd[1137]:=C2=A0 =C2=A0what():=C2=A0 filesystem error:=
 recursive directory iterator cannot open directory: No such file or direct=
ory [/ahb/a</div><div>pb/i2c@1e78a000/i2c-bus@1c0/tmp421@4f]</div><div>Mar =
15 09:45:07=C2=A0 systemd[1]: [[0;1;39m[[0;1;31m[[0;1;39mxyz.openbmc_projec=
t.Hwmon@-ahb-apb-i2c@1e78a000-i2c\x2dbus@1c0-tmp421@4f.service: Main proces=
s exited,</div><div>code=3Dkilled, status=3D6/ABRT[[0m</div><div>Mar 15 09:=
45:07=C2=A0 systemd[1]: [[0;1;39m[[0;1;31m[[0;1;39mxyz.openbmc_project.Hwmo=
n@-ahb-apb-i2c@1e78a000-i2c\x2dbus@1c0-tmp421@4f.service: Failed with resul=
t &#39;s</div><div>ignal&#39;.[[0m</div><div>Mar 15 09:45:08=C2=A0 systemd[=
1]: xyz.openbmc_project.Hwmon@-ahb-apb-i2c@1e78a000-i2c\x2dbus@1c0-tmp421@4=
f.service: Service RestartSec=3D1s expired, scheduling restar</div><div>t.<=
/div><div>Mar 15 09:45:08=C2=A0 systemd[1]: xyz.openbmc_project.Hwmon@-ahb-=
apb-i2c@1e78a000-i2c\x2dbus@1c0-tmp421@4f.service: Scheduled restart job, r=
estart counter is at 2.</div><div>Mar 15 09:45:10=C2=A0 systemd[1]: Stopped=
 Phosphor Hwmon Poller.</div><div><br></div><div>We confirmed it&#39;s caus=
ed by the latest commit of phosphor-hwmon repository</div><div><br></div><d=
iv>commit 9e997b4da98725401769ef82fe26e11c46a059d9</div><div>Author: Patric=
k Venture &lt;<a href=3D"mailto:venture@google.com">venture@google.com</a>&=
gt;</div><div>Date:=C2=A0 =C2=A0Fri Mar 8 13:42:10 2019 -0800</div><div><br=
></div><div>=C2=A0 =C2=A0 use filesystem instead of experimental</div><div>=
<br></div><div>=C2=A0 =C2=A0 Use filesystem now that it should be available=
 instead of</div><div>=C2=A0 =C2=A0 experimental::filesystem.</div><div><br=
></div><div>=C2=A0 =C2=A0 Change-Id: I62838b343ce34f85a47661f1eaaff3c7e6338=
bbf</div><div>=C2=A0 =C2=A0 Signed-off-by: Patrick Venture &lt;<a href=3D"m=
ailto:venture@google.com">venture@google.com</a>&gt;</div><div><br></div><d=
iv>it would work if we reverted that commit.</div><div><br></div><div># ps =
| grep readd</div><div>=C2=A0 =C2=A0 2 root=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00 SW=C2=A0 =C2=A0[kthreadd]</div><div>=C2=A01106 root=C2=A0 =C2=A0 =C2=
=A0 7668 S=C2=A0 =C2=A0 phosphor-hwmon-readd -o /ahb/apb/i2c@1e78a000/i2c-b=
us@1c0/tmp421@4f</div><div><br></div><div>Can anyone give the suggestion?</=
div><div><br></div><div>Thanks.</div><div><br></div></div></div></div></div=
></div></div></div></div>

--00000000000044a4e0058469bc58--
