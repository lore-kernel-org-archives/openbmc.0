Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::242; helo=mail-oi1-x242.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Jf+g90Wj"; 
 dkim-atps=neutral
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43Zrpn1hywzDqZD
 for <openbmc@lists.ozlabs.org>; Thu, 10 Jan 2019 14:20:16 +1100 (AEDT)
Received: by mail-oi1-x242.google.com with SMTP id t204so8157636oie.7
 for <openbmc@lists.ozlabs.org>; Wed, 09 Jan 2019 19:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zLVcJcUepenbw3yQpuMo61lLmkj1M3Kbsh4zwwUbOzQ=;
 b=Jf+g90WjQta3yfTnnH6WmcJEn0uLKO6meFO+esYCfFOGAujht2onytezxDf4iIwrk5
 9bV8widiG1c8/Ft03jOYKplx5rq3F4ufQT+FSRbOJjbEdboLnG4XGxW33oIyqeoB/ALo
 DWRfpl7BXeQp62NuBo0cOMN91qLe5eVQaHTzGqp20u/PyPinQnLDzoXmxVhsx5d0UkEB
 tL9K5q3ODi/bLjb5Ipb2TE81gM3Tq1cSMk73R3+hIedFDALQWTMDm288WLmKGaik3yN0
 xnzHQiuLOrARxcn3zf83+R/7ROQXSohP8TqKUlAhHvYIHUl9kKv2gyg6EdOHeI1A3HRd
 CRSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zLVcJcUepenbw3yQpuMo61lLmkj1M3Kbsh4zwwUbOzQ=;
 b=mYkjs0UqzCnwdw09WnjGq2XbZ8UaruPdg05DuXd/GwxJCymaD4wyssfBWUz6QZZ/J/
 pKPW9/T50Ji9Ll2V/+GW4r5Ap5PmF0+SftAyyl4Raz71FXve2thj3aMt/TO8aiYMwx93
 lt0yHSpjP3b94Kfgbhif3du7vbEzwhiUZ45Y5/1bsLcSebFNA2IQnsXGiD+lkEb5wPFh
 FSHbOoESgl5QBcXp0+TbvUAC1Fg92EKDVl3XM/jdPecMNSZbcsAFFQACNe96wlru+6+D
 MxG2K+X0B+/1fEIQhLUrT3+S8BAyDHEAMVRHM9uLej49NOGn1hnzkM/GAmndNLz7kaCG
 wl4A==
X-Gm-Message-State: AJcUukfMEVOoZKexe21Z6K/1XMqv/d+3IZiEGZ/xGmcTnY28Fl9pKv5/
 MsAegLBwMgYRRpOE3N4hjOBQUz1wFu5/fC1x/js=
X-Google-Smtp-Source: ALg8bN5oW2JpSrGTZKPa1KFTcAYpoHWgnzRcAjPQmjz27xSoKv+yiDhlRcYPrpmbZcK91YTWCpwlX2DsTS5+2IqEed0=
X-Received: by 2002:aca:b9d6:: with SMTP id j205mr5345218oif.294.1547090414826; 
 Wed, 09 Jan 2019 19:20:14 -0800 (PST)
MIME-Version: 1.0
References: <VI1PR0502MB38698E35D46D139D3298D4CCDD8B0@VI1PR0502MB3869.eurprd05.prod.outlook.com>
In-Reply-To: <VI1PR0502MB38698E35D46D139D3298D4CCDD8B0@VI1PR0502MB3869.eurprd05.prod.outlook.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 9 Jan 2019 21:19:58 -0600
Message-ID: <CALLMt=pTA91WEXfM0mMTZHgQj9zn33hsGMg12ksrG2upd2B-HQ@mail.gmail.com>
Subject: Re: obmcutil: sh vs. python version
To: dthompson@mellanox.com
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
X-List-Received-Date: Thu, 10 Jan 2019 03:20:18 -0000

On Wed, Jan 9, 2019 at 11:58 AM David Thompson <dthompson@mellanox.com> wro=
te:
>
> Does the shell version of =E2=80=98obmcutil=E2=80=99 support the same fea=
tures/options
> that are supported by the python version of =E2=80=98obmcutil=E2=80=99?

Almost, all of them except the chassiskill option. That is still under revi=
ew
in https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-power-control/+/=
16695/.

> Also, based on
> references in =E2=80=98openbmc-test-automation=E2=80=99 the intended dest=
ination of
> =E2=80=98obmcutil=E2=80=99 is =E2=80=98/usr/sbin=E2=80=99.  But, I don=E2=
=80=99t see =E2=80=98obmcutil=E2=80=99 in the target rootfs
> (built for AST2500 EVB on Dec 22 2018) nor do I see any logic within
> OpenBMC that actually installs it.

We still get the python version installed in our openpower systems.
I think meta-phosphor/recipes-phosphor/devtools/obmc-pydevtools_git.bb
is the recipe that brings in the python based one from the skeleton repo.

>
> Can someone comment on =E2=80=98obmcutil=E2=80=99 install and usage?

The plan for our openpower systems is to switch over to the shell
based version so we can remove python from our rootfs. We're
just waiting on the chassiskill support so it will be feature
equivalent with the python version.

>
> David Thompson
>
> Sr. Staff Engineer, System SW
>
> Mellanox Technologies
>
> 1900 West Park Drive, Suite 290
>
> Westborough MA USA 01581
>
> Direct: +1 508-475-6375
>
>
