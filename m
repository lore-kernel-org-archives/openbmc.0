Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::32e; helo=mail-ot1-x32e.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="iUl/2kLU"; 
 dkim-atps=neutral
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43zRyR5JzWzDqLB
 for <openbmc@lists.ozlabs.org>; Wed, 13 Feb 2019 02:53:19 +1100 (AEDT)
Received: by mail-ot1-x32e.google.com with SMTP id n8so5178212otl.6
 for <openbmc@lists.ozlabs.org>; Tue, 12 Feb 2019 07:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=q+0PquCknwmCC8Xa/IYMQTwYX+q0vHy6nt8npnUbQds=;
 b=iUl/2kLUusWxbwnxMrXZn8yBG4yGwkAjy9Kfn0Q1CDgFfQtcHJ3QRD11mwlymnUop3
 SgLyBOdLs2qXh2a/xwmMlJSHljxB2XLjpM+9L8I9f1HwyRIQSt/kaDVBYJ8tSglRnAQd
 VSbZKlEqWqN16V0678jDmB3dZjHz0xnZIszllHazW2hh62J5P4kc5gwyThrjr6NLynot
 +p5XIy+O9BHwV1V1LAMBpvLTQb8vUPRNoOWt8Ogci5TXnuDT4V+YoOxxOWGOhB163p9i
 p47DxmPlhcUYEixxx4rDj296sSoKx3PSftSiJupQ3CH4Vm4E+tw5KSIty2B8o1eEUCFH
 yAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=q+0PquCknwmCC8Xa/IYMQTwYX+q0vHy6nt8npnUbQds=;
 b=OLLAlwO475J1ZZbvPNaQ+vp59l9MqEQ4N5UxRCgNu7iTO999JsOdu6B0mNjNxC0wB8
 Hpb14Va7kyG/IYP5VpDCyt4eSTSgE7IOPumoXosGrnvZegyYHTYvgi4ZbmOgCdkeRBPl
 o29acpmXScJPtRaAXmO8hzyRGOmhaQWFbquIo2rHy3o5CgjN8R8gb0gr/7JE+LxKqI2s
 VDIFr5HSeCpUN3prgB7XgQHYzCHPuV2YkZWd9IRWPDzJo/U5UfyfJCdkDXIDcc/dGqwR
 qL7QUo9UPgXh1EtkTO+6i58fUTvDSaxRPL1ueydQeZ7vMiAbwL4fkOBZQgZnuK6cmkYN
 OhbA==
X-Gm-Message-State: AHQUAubv5M+Ayy4PJCitpKMBzXJ4ulWVd9GXCea9K9uj4sYDlkyvaY8v
 yDHJ84fBPrH4m+dT9ydbZ1PZfBHgHJtaIP7GHOA=
X-Google-Smtp-Source: AHgI3Ibc5MVqs2H2Ah38WRRSiZh0QbgIMZGFUy3+FyNw1lGaJJQNPPjms1t2nR7e1m3muFqoXpm1AL4+tp36SMk2s4E=
X-Received: by 2002:a05:6830:1592:: with SMTP id
 i18mr4422607otr.123.1549986797289; 
 Tue, 12 Feb 2019 07:53:17 -0800 (PST)
MIME-Version: 1.0
References: <CAO=notwO6vByDi29oQVK+3wC0nWRq7zyU-uJDzXZG9hnux9daA@mail.gmail.com>
In-Reply-To: <CAO=notwO6vByDi29oQVK+3wC0nWRq7zyU-uJDzXZG9hnux9daA@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 12 Feb 2019 09:53:01 -0600
Message-ID: <CALLMt=onoQGU=kHS4zAkQWm7KbpC=EhrT8y2qrVDhC30m5RAqA@mail.gmail.com>
Subject: Re: gitsm and own-mirror lead to unhappiness
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 12 Feb 2019 15:53:20 -0000

On Tue, Feb 12, 2019 at 9:21 AM Patrick Venture <venture@google.com> wrote:
>
> Has anyone else run into this issue?
>
> openbmcbmc works fine when building zaius as phosphor:
>
> PREMIRRORS=3D"bzr://.*/.*
> http://downloads.yoctoproject.org/mirror/sources/ \n cvs://.*/.*
> http://downloads.yoctoproject.org/mirror/sources/ \n git://.*/.*
> http://downloads.yoctoproject.org/mirror/sources/ \n gitsm://.*/.*
> http://downloads.yoctoproject.org/mirror/sources/ \n hg://.*/.*
> http://downloads.yoctoproject.org/mirror/sources/ \n osc://.*/.*
> http://downloads.yoctoproject.org/mirror/sources/ \n p4://.*/.*
> http://downloads.yoctoproject.org/mirror/sources/ \n svn://.*/.*
> http://downloads.yoctoproject.org/mirror/sources/ \n"
>
> when using a mirror via the own-mirror class it has (and fails):
>
> PREMIRRORS=3D" cvs://.*/.*
> file:///google/data/ro/teams/gbmc/mirror/sources/ \n svn://.*/.*
> file:///google/data/ro/teams/gbmc/mirror/sources/ \n git://.*/.*
> file:///google/data/ro/teams/gbmc/mirror/sources/ \n gitsm://.*/.*
> file:///google/data/ro/teams/gbmc/mirror/sources/ \n hg://.*/.*
> file:///google/data/ro/teams/gbmc/mirror/sources/ \n bzr://.*/.*
> file:///google/data/ro/teams/gbmc/mirror/sources/ \n p4://.*/.*
> file:///google/data/ro/teams/gbmc/mirror/sources/ \n osc://.*/.*
> file:///google/data/ro/teams/gbmc/mirror/sources/ \n https?\$://.*/.*
> file:///google/data/ro/teams/gbmc/mirror/sources/ \n ftp://.*/.*
> file:///google/data/ro/teams/gbmc/mirror/sources/ \n npm://.*/?.*
> file:///google/data/ro/teams/gbmc/mirror/sources/ \n bzr://.*/.*
> http://downloads.yoctoproject.org/mirror/sources/ \n cvs://.*/.*
> http://downloads.yoctoproject.org/mirror/sources/ \n git://.*/.*
> http://downloads.yoctoproject.org/mirror/sources/ \n gitsm://.*/.*
> http://downloads.yoctoproject.org/mirror/sources/ \n hg://.*/.*
> http://downloads.yoctoproject.org/mirror/sources/ \n osc://.*/.*
> http://downloads.yoctoproject.org/mirror/sources/ \n p4://.*/.*
> http://downloads.yoctoproject.org/mirror/sources/ \n svn://.*/.*
> http://downloads.yoctoproject.org/mirror/sources/ \n"
>
> Here's the error:
>
> ERROR: dbus-broker-16+gitAUTOINC+fc874afa09-r0 do_unpack: Fetcher
> failure: Fetch command export PSEUDO_DISABLED=3D1; export
> P4CONFIG=3D".p4config"; export
> DBUS_SESSION_BUS_ADDRESS=3D"unix:abstract=3D/tmp/dbus-ikQVQidiXM,guid=3D0=
17a369eba1bf971869460b55c475ed9";
> export SSH_AGENT_PID=3D"64102"; export
> SSH_AUTH_SOCK=3D"/tmp/ssh-lw8WN8I9mmbS/agent.63979"; export
> PATH=3D"/usr/local/google/git/workspaces/building_rebase_failure/build/tm=
p/work/armv5e-openbmc-linux-gnueabi/dbus-broker/16+gitAUTOINC+fc874afa09-r0=
/recipe-sysroot-native/usr/bin/python3-native:/usr/local/google/git/workspa=
ces/building_rebase_failure/scripts:/usr/local/google/git/workspaces/buildi=
ng_rebase_failure/build/tmp/work/armv5e-openbmc-linux-gnueabi/dbus-broker/1=
6+gitAUTOINC+fc874afa09-r0/recipe-sysroot-native/usr/bin/arm-openbmc-linux-=
gnueabi:/usr/local/google/git/workspaces/building_rebase_failure/build/tmp/=
work/armv5e-openbmc-linux-gnueabi/dbus-broker/16+gitAUTOINC+fc874afa09-r0/r=
ecipe-sysroot/usr/bin/crossscripts:/usr/local/google/git/workspaces/buildin=
g_rebase_failure/build/tmp/work/armv5e-openbmc-linux-gnueabi/dbus-broker/16=
+gitAUTOINC+fc874afa09-r0/recipe-sysroot-native/usr/sbin:/usr/local/google/=
git/workspaces/building_rebase_failure/build/tmp/work/armv5e-openbmc-linux-=
gnueabi/dbus-broker/16+gitAUTOINC+fc874afa09-r0/recipe-sysroot-native/usr/b=
in:/usr/local/google/git/workspaces/building_rebase_failure/build/tmp/work/=
armv5e-openbmc-linux-gnueabi/dbus-broker/16+gitAUTOINC+fc874afa09-r0/recipe=
-sysroot-native/sbin:/usr/local/google/git/workspaces/building_rebase_failu=
re/build/tmp/work/armv5e-openbmc-linux-gnueabi/dbus-broker/16+gitAUTOINC+fc=
874afa09-r0/recipe-sysroot-native/bin:/usr/local/google/git/workspaces/buil=
ding_rebase_failure/poky/bitbake/bin:/usr/local/google/git/workspaces/build=
ing_rebase_failure/build/tmp/hosttools";
> export HOME=3D"/usr/local/google/home/venture"; cp -fpLR
> /usr/local/google/git/workspaces/building_rebase_failure/build/downloads/=
git2/github.com.bus1.dbus-broker/modules/subprojects/c-dvar
> /usr/local/google/git/workspaces/building_rebase_failure/build/tmp/work/a=
rmv5e-openbmc-linux-gnueabi/dbus-broker/16+gitAUTOINC+fc874afa09-r0/git/.gi=
t/modules/subprojects/c-dvar
> failed with exit code 1, output:
> cp: cannot stat
> '/usr/local/google/git/workspaces/building_rebase_failure/build/downloads=
/git2/github.com.bus1.dbus-broker/modules/subprojects/c-dvar/modules/subpro=
jects/c-utf8':
> No such file or directory
>
> ERROR: dbus-broker-16+gitAUTOINC+fc874afa09-r0 do_unpack: Function
> failed: base_do_unpack
> ERROR: Logfile of failure stored in:
> /usr/local/google/git/workspaces/building_rebase_failure/build/tmp/work/a=
rmv5e-openbmc-linux-gnueabi/dbus-broker/16+gitAUTOINC+fc874afa09-r0/temp/lo=
g.do_unpack.86989
> ERROR: Task (/usr/local/google/git/workspaces/building_rebase_failure/met=
a-openembedded/meta-oe/recipes-core/dbus/dbus-broker_git.bb:do_unpack)
> failed with exit code '1'
> NOTE: Tasks Summary: Attempted 1317 tasks of which 0 didn't need to be
> rerun and 1 failed.

Yeah, we've seen this on a few of our builder machines and some
internal machines - https://github.com/openbmc/openbmc/issues/3480

Sometimes rebuilding a few times fixes it, but sometimes it's a hard
failure (builder4 is offline due to this).

Andrew

>
>
>
> Patrick
