Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="saRN7NFW"; 
 dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43zSxM2nBszDqNQ
 for <openbmc@lists.ozlabs.org>; Wed, 13 Feb 2019 03:37:26 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id v28so1484027pgk.10
 for <openbmc@lists.ozlabs.org>; Tue, 12 Feb 2019 08:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FO7/3r8p3sVaKKELNmstzmL+rF3o3N5IPbi+4f4ktJc=;
 b=saRN7NFWiPWDJHblGoIY8I4w/hrdVpfm6zRoIzMKolFicoidqRCYcTlJE42JLOLjF1
 O+kLVvt3UYcKkaiTXioJl7Uwrh+oQAwc5t7g5u9qv7444nCm1RwqLft5ByG6zNULrHTs
 h4fiU8KFCXvGAXZoLN1phsyVi9KfHvnttzpLWPJjL4CSz2fXF/NM8C5GfBz7gIAEkDHl
 xKIge1LWqExYIQsfJIKGXxK3KUQIGr8ux9SoTsKJtWAfskOHCqGsu8lw+p/P04whl4Hy
 LY4gZtuJhAIkyoDVyLAxLLFqcJlL/eoEbKAjqh4BPGIjLJTJsSRk0QJ+JDtuEO+yUi8C
 SpqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FO7/3r8p3sVaKKELNmstzmL+rF3o3N5IPbi+4f4ktJc=;
 b=jMNbv22VNYqpFVb5qcZtlniSiWglQ6+wUsEZpspxU26U34x/gMuZBODPPb0xDdUGUs
 4Hu/YpGy2TehgfObjF7LdyNkVwyFfzq6iC1RrsPLb7RxqWPaPxLM0Q87a2Pm+ulFyKiP
 6J77QwQoF+Ep1PS7aLOg/SMzcX5e26faOk4T65Pow4qBZH1bRJQo9jz/a1zJmLeZeJlC
 4a+fYbdjzixkm53/e+CTljsTZPZCXDXXRzz4mBPTM4gpXp+MWYaSmGRfAC+VIy6JoCKM
 GkRj+4dCfJuzRxjVEEvrQsGd5qaTgYEx1E9lPnn3OFlCFt5E4RIQ7pRqrDn7DFrx8poD
 etcg==
X-Gm-Message-State: AHQUAubYXdU9Sjl2YNSpr0DMNtqeLztcXlGPFyxa1qPQWFgAmRh6Mmh2
 P1kM8C6G4VKOXgMMgAvJrBnYHEmmtANq4fyGTfWj3Q==
X-Google-Smtp-Source: AHgI3IalM0L9lQvz46jfrl2iBl4fmOSmD1jwH0CXcH3o1Aa0lDtnaGmXAozmpeEIu0c356UNt2rUjdROnC38Op0AV6M=
X-Received: by 2002:a63:f74c:: with SMTP id f12mr4420089pgk.195.1549989438124; 
 Tue, 12 Feb 2019 08:37:18 -0800 (PST)
MIME-Version: 1.0
References: <CAO=notwO6vByDi29oQVK+3wC0nWRq7zyU-uJDzXZG9hnux9daA@mail.gmail.com>
 <CALLMt=onoQGU=kHS4zAkQWm7KbpC=EhrT8y2qrVDhC30m5RAqA@mail.gmail.com>
In-Reply-To: <CALLMt=onoQGU=kHS4zAkQWm7KbpC=EhrT8y2qrVDhC30m5RAqA@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 12 Feb 2019 08:37:05 -0800
Message-ID: <CAO=notyLYuxYmgetaVFm8Z8vhZne5p0QBTug57uKh_eYvXKHLw@mail.gmail.com>
Subject: Re: gitsm and own-mirror lead to unhappiness
To: Andrew Geissler <geissonator@gmail.com>
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
X-List-Received-Date: Tue, 12 Feb 2019 16:37:28 -0000

On Tue, Feb 12, 2019 at 7:53 AM Andrew Geissler <geissonator@gmail.com> wro=
te:
>
> On Tue, Feb 12, 2019 at 9:21 AM Patrick Venture <venture@google.com> wrot=
e:
> >
> > Has anyone else run into this issue?
> >
> > openbmcbmc works fine when building zaius as phosphor:
> >
> > PREMIRRORS=3D"bzr://.*/.*
> > http://downloads.yoctoproject.org/mirror/sources/ \n cvs://.*/.*
> > http://downloads.yoctoproject.org/mirror/sources/ \n git://.*/.*
> > http://downloads.yoctoproject.org/mirror/sources/ \n gitsm://.*/.*
> > http://downloads.yoctoproject.org/mirror/sources/ \n hg://.*/.*
> > http://downloads.yoctoproject.org/mirror/sources/ \n osc://.*/.*
> > http://downloads.yoctoproject.org/mirror/sources/ \n p4://.*/.*
> > http://downloads.yoctoproject.org/mirror/sources/ \n svn://.*/.*
> > http://downloads.yoctoproject.org/mirror/sources/ \n"
> >
> > when using a mirror via the own-mirror class it has (and fails):
> >
> > PREMIRRORS=3D" cvs://.*/.*
> > file:///google/data/ro/teams/gbmc/mirror/sources/ \n svn://.*/.*
> > file:///google/data/ro/teams/gbmc/mirror/sources/ \n git://.*/.*
> > file:///google/data/ro/teams/gbmc/mirror/sources/ \n gitsm://.*/.*
> > file:///google/data/ro/teams/gbmc/mirror/sources/ \n hg://.*/.*
> > file:///google/data/ro/teams/gbmc/mirror/sources/ \n bzr://.*/.*
> > file:///google/data/ro/teams/gbmc/mirror/sources/ \n p4://.*/.*
> > file:///google/data/ro/teams/gbmc/mirror/sources/ \n osc://.*/.*
> > file:///google/data/ro/teams/gbmc/mirror/sources/ \n https?\$://.*/.*
> > file:///google/data/ro/teams/gbmc/mirror/sources/ \n ftp://.*/.*
> > file:///google/data/ro/teams/gbmc/mirror/sources/ \n npm://.*/?.*
> > file:///google/data/ro/teams/gbmc/mirror/sources/ \n bzr://.*/.*
> > http://downloads.yoctoproject.org/mirror/sources/ \n cvs://.*/.*
> > http://downloads.yoctoproject.org/mirror/sources/ \n git://.*/.*
> > http://downloads.yoctoproject.org/mirror/sources/ \n gitsm://.*/.*
> > http://downloads.yoctoproject.org/mirror/sources/ \n hg://.*/.*
> > http://downloads.yoctoproject.org/mirror/sources/ \n osc://.*/.*
> > http://downloads.yoctoproject.org/mirror/sources/ \n p4://.*/.*
> > http://downloads.yoctoproject.org/mirror/sources/ \n svn://.*/.*
> > http://downloads.yoctoproject.org/mirror/sources/ \n"
> >
> > Here's the error:
> >
> > ERROR: dbus-broker-16+gitAUTOINC+fc874afa09-r0 do_unpack: Fetcher
> > failure: Fetch command export PSEUDO_DISABLED=3D1; export
> > P4CONFIG=3D".p4config"; export
> > DBUS_SESSION_BUS_ADDRESS=3D"unix:abstract=3D/tmp/dbus-ikQVQidiXM,guid=
=3D017a369eba1bf971869460b55c475ed9";
> > export SSH_AGENT_PID=3D"64102"; export
> > SSH_AUTH_SOCK=3D"/tmp/ssh-lw8WN8I9mmbS/agent.63979"; export
> > PATH=3D"/usr/local/google/git/workspaces/building_rebase_failure/build/=
tmp/work/armv5e-openbmc-linux-gnueabi/dbus-broker/16+gitAUTOINC+fc874afa09-=
r0/recipe-sysroot-native/usr/bin/python3-native:/usr/local/google/git/works=
paces/building_rebase_failure/scripts:/usr/local/google/git/workspaces/buil=
ding_rebase_failure/build/tmp/work/armv5e-openbmc-linux-gnueabi/dbus-broker=
/16+gitAUTOINC+fc874afa09-r0/recipe-sysroot-native/usr/bin/arm-openbmc-linu=
x-gnueabi:/usr/local/google/git/workspaces/building_rebase_failure/build/tm=
p/work/armv5e-openbmc-linux-gnueabi/dbus-broker/16+gitAUTOINC+fc874afa09-r0=
/recipe-sysroot/usr/bin/crossscripts:/usr/local/google/git/workspaces/build=
ing_rebase_failure/build/tmp/work/armv5e-openbmc-linux-gnueabi/dbus-broker/=
16+gitAUTOINC+fc874afa09-r0/recipe-sysroot-native/usr/sbin:/usr/local/googl=
e/git/workspaces/building_rebase_failure/build/tmp/work/armv5e-openbmc-linu=
x-gnueabi/dbus-broker/16+gitAUTOINC+fc874afa09-r0/recipe-sysroot-native/usr=
/bin:/usr/local/google/git/workspaces/building_rebase_failure/build/tmp/wor=
k/armv5e-openbmc-linux-gnueabi/dbus-broker/16+gitAUTOINC+fc874afa09-r0/reci=
pe-sysroot-native/sbin:/usr/local/google/git/workspaces/building_rebase_fai=
lure/build/tmp/work/armv5e-openbmc-linux-gnueabi/dbus-broker/16+gitAUTOINC+=
fc874afa09-r0/recipe-sysroot-native/bin:/usr/local/google/git/workspaces/bu=
ilding_rebase_failure/poky/bitbake/bin:/usr/local/google/git/workspaces/bui=
lding_rebase_failure/build/tmp/hosttools";
> > export HOME=3D"/usr/local/google/home/venture"; cp -fpLR
> > /usr/local/google/git/workspaces/building_rebase_failure/build/download=
s/git2/github.com.bus1.dbus-broker/modules/subprojects/c-dvar
> > /usr/local/google/git/workspaces/building_rebase_failure/build/tmp/work=
/armv5e-openbmc-linux-gnueabi/dbus-broker/16+gitAUTOINC+fc874afa09-r0/git/.=
git/modules/subprojects/c-dvar
> > failed with exit code 1, output:
> > cp: cannot stat
> > '/usr/local/google/git/workspaces/building_rebase_failure/build/downloa=
ds/git2/github.com.bus1.dbus-broker/modules/subprojects/c-dvar/modules/subp=
rojects/c-utf8':
> > No such file or directory
> >
> > ERROR: dbus-broker-16+gitAUTOINC+fc874afa09-r0 do_unpack: Function
> > failed: base_do_unpack
> > ERROR: Logfile of failure stored in:
> > /usr/local/google/git/workspaces/building_rebase_failure/build/tmp/work=
/armv5e-openbmc-linux-gnueabi/dbus-broker/16+gitAUTOINC+fc874afa09-r0/temp/=
log.do_unpack.86989
> > ERROR: Task (/usr/local/google/git/workspaces/building_rebase_failure/m=
eta-openembedded/meta-oe/recipes-core/dbus/dbus-broker_git.bb:do_unpack)
> > failed with exit code '1'
> > NOTE: Tasks Summary: Attempted 1317 tasks of which 0 didn't need to be
> > rerun and 1 failed.
>
> Yeah, we've seen this on a few of our builder machines and some
> internal machines - https://github.com/openbmc/openbmc/issues/3480
>
> Sometimes rebuilding a few times fixes it, but sometimes it's a hard
> failure (builder4 is offline due to this).

Interesting. So, our failures are not identical but symptomatically
similar -- unable to get submodules.  It's frustrating to say the
least.  I'll try doing the rebuilds you suggested.  If it builds once,
perhaps and i have the tarball built, it'll work for the future --
since it's a host-specific issue for you, it makes me think perhaps
it's a git version issue or related to some package on which it
depends varying between systems.  However, I imagine the build systems
are identical except for architecture.  We're seeing the failure
building on x86-64.

>
> Andrew
>
> >
> >
> >
> > Patrick
