Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="i8P9mxEr"; 
 dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43zRDt6LvJzDq5c
 for <openbmc@lists.ozlabs.org>; Wed, 13 Feb 2019 02:20:46 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id g9so1456881plo.3
 for <openbmc@lists.ozlabs.org>; Tue, 12 Feb 2019 07:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=NkiLQAsvJma7SgKLB3/OojjFYD9dCBUis9z2NKtnjTY=;
 b=i8P9mxErbnZPskr5jfB74v86YNA1GoK4y1H/VfhDrfySbD9aDlmOJjbdO0hBJk1VS8
 CqByCHc8FpP8Oz7dK6ElQJSly3f2BNLY6NanUs2XWaItnL1lGt2XG/6GUrGIB5UCG9c/
 qBxl56YASlJ9sWtE++LY+n6+jujayEBM+e3ZMk/vtsBMGRib6flOnegCUNf7ZilArkae
 O6vDsRXbrUI0z3V38IVtTSmzPqpI8NGqa75uTTTFeFkDz4yWwY+iUCpnHFz8UT5W4JXP
 xrOoLyVZ0gekUXj1XL/xhVQtF2IT6KEEjyxKPy6Z51o+XVOSIdn8Uer6hroemBpkJbUf
 /cmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=NkiLQAsvJma7SgKLB3/OojjFYD9dCBUis9z2NKtnjTY=;
 b=kNIEVc1dU/6TPH1wNwzZLvX+IttP7DD6SF+2EFddp481BeKfpWMBfEca7hzPTx0mTZ
 MJiDr3735XT5sm1NWGxioS5qIXCVAO3Vvu+Od1m5Cr1kUIHWztbRKctJXv+izzfaDz7w
 MqOw6sU5udxpBnoVcRNzED2CiCpOeKrh6+n1bDqyf1LsZg02rqp6ddbx4+LcZwNoL6ZD
 NHpExKjQiEYXmWiKXFflOrcaIbNGXM7Jf0XKc0zmWnuL8wK/A/h9J6dAJstKYP2dkc3N
 /ZToXvgHs7qVNH1Wmwy2ECRWzclvzk7M0QTZD17uQ2fBidTF38v6CGGrGCJUDEnp6pia
 IaOQ==
X-Gm-Message-State: AHQUAuY4fdy04UJx4zP88R8/Y6W1JyheVyo3uLmSrqzF/8uLmO6fejiv
 eQ6cqF0UQiQc+9VJhFXhP7/YZ5dfNPUJUHdoD0aMhkGK8KK+eQ==
X-Google-Smtp-Source: AHgI3IaWz/L2QyvZ7OIWXuxCMeUD6jqk2HX8J/RLqVhSwJwfAspMDSuTaZ2CfYXbzU+LQbw+6CmxEIPEljhiOTkTtvw=
X-Received: by 2002:a17:902:503:: with SMTP id 3mr4552080plf.233.1549984843483; 
 Tue, 12 Feb 2019 07:20:43 -0800 (PST)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Tue, 12 Feb 2019 07:20:31 -0800
Message-ID: <CAO=notwO6vByDi29oQVK+3wC0nWRq7zyU-uJDzXZG9hnux9daA@mail.gmail.com>
Subject: gitsm and own-mirror lead to unhappiness
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Tue, 12 Feb 2019 15:20:48 -0000

Has anyone else run into this issue?

openbmcbmc works fine when building zaius as phosphor:

PREMIRRORS=3D"bzr://.*/.*
http://downloads.yoctoproject.org/mirror/sources/ \n cvs://.*/.*
http://downloads.yoctoproject.org/mirror/sources/ \n git://.*/.*
http://downloads.yoctoproject.org/mirror/sources/ \n gitsm://.*/.*
http://downloads.yoctoproject.org/mirror/sources/ \n hg://.*/.*
http://downloads.yoctoproject.org/mirror/sources/ \n osc://.*/.*
http://downloads.yoctoproject.org/mirror/sources/ \n p4://.*/.*
http://downloads.yoctoproject.org/mirror/sources/ \n svn://.*/.*
http://downloads.yoctoproject.org/mirror/sources/ \n"

when using a mirror via the own-mirror class it has (and fails):

PREMIRRORS=3D" cvs://.*/.*
file:///google/data/ro/teams/gbmc/mirror/sources/ \n svn://.*/.*
file:///google/data/ro/teams/gbmc/mirror/sources/ \n git://.*/.*
file:///google/data/ro/teams/gbmc/mirror/sources/ \n gitsm://.*/.*
file:///google/data/ro/teams/gbmc/mirror/sources/ \n hg://.*/.*
file:///google/data/ro/teams/gbmc/mirror/sources/ \n bzr://.*/.*
file:///google/data/ro/teams/gbmc/mirror/sources/ \n p4://.*/.*
file:///google/data/ro/teams/gbmc/mirror/sources/ \n osc://.*/.*
file:///google/data/ro/teams/gbmc/mirror/sources/ \n https?\$://.*/.*
file:///google/data/ro/teams/gbmc/mirror/sources/ \n ftp://.*/.*
file:///google/data/ro/teams/gbmc/mirror/sources/ \n npm://.*/?.*
file:///google/data/ro/teams/gbmc/mirror/sources/ \n bzr://.*/.*
http://downloads.yoctoproject.org/mirror/sources/ \n cvs://.*/.*
http://downloads.yoctoproject.org/mirror/sources/ \n git://.*/.*
http://downloads.yoctoproject.org/mirror/sources/ \n gitsm://.*/.*
http://downloads.yoctoproject.org/mirror/sources/ \n hg://.*/.*
http://downloads.yoctoproject.org/mirror/sources/ \n osc://.*/.*
http://downloads.yoctoproject.org/mirror/sources/ \n p4://.*/.*
http://downloads.yoctoproject.org/mirror/sources/ \n svn://.*/.*
http://downloads.yoctoproject.org/mirror/sources/ \n"

Here's the error:

ERROR: dbus-broker-16+gitAUTOINC+fc874afa09-r0 do_unpack: Fetcher
failure: Fetch command export PSEUDO_DISABLED=3D1; export
P4CONFIG=3D".p4config"; export
DBUS_SESSION_BUS_ADDRESS=3D"unix:abstract=3D/tmp/dbus-ikQVQidiXM,guid=3D017=
a369eba1bf971869460b55c475ed9";
export SSH_AGENT_PID=3D"64102"; export
SSH_AUTH_SOCK=3D"/tmp/ssh-lw8WN8I9mmbS/agent.63979"; export
PATH=3D"/usr/local/google/git/workspaces/building_rebase_failure/build/tmp/=
work/armv5e-openbmc-linux-gnueabi/dbus-broker/16+gitAUTOINC+fc874afa09-r0/r=
ecipe-sysroot-native/usr/bin/python3-native:/usr/local/google/git/workspace=
s/building_rebase_failure/scripts:/usr/local/google/git/workspaces/building=
_rebase_failure/build/tmp/work/armv5e-openbmc-linux-gnueabi/dbus-broker/16+=
gitAUTOINC+fc874afa09-r0/recipe-sysroot-native/usr/bin/arm-openbmc-linux-gn=
ueabi:/usr/local/google/git/workspaces/building_rebase_failure/build/tmp/wo=
rk/armv5e-openbmc-linux-gnueabi/dbus-broker/16+gitAUTOINC+fc874afa09-r0/rec=
ipe-sysroot/usr/bin/crossscripts:/usr/local/google/git/workspaces/building_=
rebase_failure/build/tmp/work/armv5e-openbmc-linux-gnueabi/dbus-broker/16+g=
itAUTOINC+fc874afa09-r0/recipe-sysroot-native/usr/sbin:/usr/local/google/gi=
t/workspaces/building_rebase_failure/build/tmp/work/armv5e-openbmc-linux-gn=
ueabi/dbus-broker/16+gitAUTOINC+fc874afa09-r0/recipe-sysroot-native/usr/bin=
:/usr/local/google/git/workspaces/building_rebase_failure/build/tmp/work/ar=
mv5e-openbmc-linux-gnueabi/dbus-broker/16+gitAUTOINC+fc874afa09-r0/recipe-s=
ysroot-native/sbin:/usr/local/google/git/workspaces/building_rebase_failure=
/build/tmp/work/armv5e-openbmc-linux-gnueabi/dbus-broker/16+gitAUTOINC+fc87=
4afa09-r0/recipe-sysroot-native/bin:/usr/local/google/git/workspaces/buildi=
ng_rebase_failure/poky/bitbake/bin:/usr/local/google/git/workspaces/buildin=
g_rebase_failure/build/tmp/hosttools";
export HOME=3D"/usr/local/google/home/venture"; cp -fpLR
/usr/local/google/git/workspaces/building_rebase_failure/build/downloads/gi=
t2/github.com.bus1.dbus-broker/modules/subprojects/c-dvar
/usr/local/google/git/workspaces/building_rebase_failure/build/tmp/work/arm=
v5e-openbmc-linux-gnueabi/dbus-broker/16+gitAUTOINC+fc874afa09-r0/git/.git/=
modules/subprojects/c-dvar
failed with exit code 1, output:
cp: cannot stat
'/usr/local/google/git/workspaces/building_rebase_failure/build/downloads/g=
it2/github.com.bus1.dbus-broker/modules/subprojects/c-dvar/modules/subproje=
cts/c-utf8':
No such file or directory

ERROR: dbus-broker-16+gitAUTOINC+fc874afa09-r0 do_unpack: Function
failed: base_do_unpack
ERROR: Logfile of failure stored in:
/usr/local/google/git/workspaces/building_rebase_failure/build/tmp/work/arm=
v5e-openbmc-linux-gnueabi/dbus-broker/16+gitAUTOINC+fc874afa09-r0/temp/log.=
do_unpack.86989
ERROR: Task (/usr/local/google/git/workspaces/building_rebase_failure/meta-=
openembedded/meta-oe/recipes-core/dbus/dbus-broker_git.bb:do_unpack)
failed with exit code '1'
NOTE: Tasks Summary: Attempted 1317 tasks of which 0 didn't need to be
rerun and 1 failed.



Patrick
