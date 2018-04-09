Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::22c; helo=mail-it0-x22c.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="r3imorms"; 
 dkim-atps=neutral
Received: from mail-it0-x22c.google.com (mail-it0-x22c.google.com
 [IPv6:2607:f8b0:4001:c0b::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40KG3x2wN2zDrpX
 for <openbmc@lists.ozlabs.org>; Mon,  9 Apr 2018 13:28:45 +1000 (AEST)
Received: by mail-it0-x22c.google.com with SMTP id 142-v6so9005616itl.5
 for <openbmc@lists.ozlabs.org>; Sun, 08 Apr 2018 20:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=my0syDvgiNrznJ2s0oiiV6MW5rmeAed3WzY7cRfESYc=;
 b=r3imormsqwua1QeMRzaDmaMwHa/SghC+3zgQpgJVL9ms145ql9wtMK3CJpGEJUsIiy
 dZId14jY+lb+hY+ggEJR/ZAjnPUFp+6Ov5KtdAOf8kzoie/4TNE+yI99NDHNJCg0lBNo
 FRjNvd1BxxhSucfthU2e894zrGfOItHiXpktxxam6Sm2poI1nChCxKPvcE6b8SvSmxua
 OugpjpA83cdlNrA44Q92rQm3cVe/Br/nK7U7bXzueRIG8b4rBxdDqekSdQWaEp6ObnFl
 AJFeFUmmUJDtzz8TFM29EcNjJrbjrFTs/hxwui8dAfxTJzM1T9nk5B94zDqmu4EpN70W
 J8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=my0syDvgiNrznJ2s0oiiV6MW5rmeAed3WzY7cRfESYc=;
 b=aXBytpk214QjyP0C4woej09AAapNQ8d90skyrPmVAeOEWR4bnGmkKTA41C/iU2EP/k
 1TFc9frnIPwITmYlbmiZmwOmjy/5PAEpGisETAF5nsK/Mv4hoEKhjznYUlbTJxjpj6wN
 V0sJ3HaRf2njtOaLv/1KvU98PHrpt/fvmtKLv1Y9yLtxyEv8SehkrKf23KezPEvUNNnD
 b8greHO///5DZrIh3bL+uluXdlmdFciEv0ssNMqZsE8sCpRPzQWLNMsqaBNfFsxunTgs
 /HLA0AhXRXhP3dsPSBwj8an+JuXc/DGTZeHkeX24NLHx85I8yH2erWnAjFpVRCVEOZSL
 s9GA==
X-Gm-Message-State: ALQs6tDmxlKyI7Vs/RLup2hQPzsUOz17uXZ8hJklFWf4yhLzHjiLG7U3
 SJMNPGJ6giGxEB2FqjFF0whdgyPJvkYSeWp7tW8=
X-Google-Smtp-Source: AIpwx48uWN+kV0xP75aKZNlJj1uJXC4Mq6eYRBZvseQCQeOjBTyL/caD2jZl/6bAlExGHjUzpVdk/5fmQ9Lk2u1Dyc0=
X-Received: by 2002:a24:a38b:: with SMTP id
 p133-v6mr26338279ite.22.1523244522494; 
 Sun, 08 Apr 2018 20:28:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.142.67 with HTTP; Sun, 8 Apr 2018 20:28:41 -0700 (PDT)
In-Reply-To: <1409586871.2278971.1522976422431@mail.yahoo.com>
References: <1409586871.2278971.1522976422431.ref@mail.yahoo.com>
 <1409586871.2278971.1522976422431@mail.yahoo.com>
From: Lei YU <mine260309@gmail.com>
Date: Mon, 9 Apr 2018 11:28:41 +0800
Message-ID: <CAARXrtk-8TskwQbhiPVfV9Uqm4iLreSuGJMBbJLgdZBVaU+-AQ@mail.gmail.com>
Subject: Re: Questions on openBMC compilation
To: Mam Nag <mam.nagv@yahoo.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Apr 2018 03:28:46 -0000

On Fri, Apr 6, 2018 at 9:00 AM, Mam Nag <mam.nagv@yahoo.com> wrote:
> Hello,
>
>
>
> I am working on supporting new platform which has AST2500. Some of the
> questions I have are:
>
>
>
> 1.       If I want to make changes to any openBMC component for developme=
nt,
> is folder =E2=80=9Copenbmc/build/tmp/work/=E2=80=9D right location to mak=
e changes?
No.
>
> 2.       When I try to build openBMC for AST2500, no option to configure =
the
> linux kernel. If I want to add new driver to the kernel to support new
> sensor chip. Once add the code into kernel
>
> a.       can I know which configuration file to change in the linux kerne=
l
> to enable new driver. In standard kernel this can be done through .config=
.
> However in openBMC we didn=E2=80=99t find .config file.

It depends on the machine for the specific configs.
The common config for AST2500 is at:
meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-kernel/linux/linux-obmc/d=
efconfig
The machine specific config is put at "meta-machine" layer, e.g.
meta-openbmc-machines/meta-openpower/meta-ibm/meta-romulus/recipes-kernel/l=
inux/linux-obmc/romulus.cfg

>
> b.      Once step =E2=80=9Ca=E2=80=9D is done how do I recompile openBMC =
build? . Do I need
> to run =E2=80=9Cbitbake obmc-phosphor-image=E2=80=9D again?. Will this ta=
ke my changes
> done?. FYI: I made small one line change in kernel source code, reran
> =E2=80=9Cbitbake obmc-phosphor-image=E2=80=9D and got message =E2=80=9CNO=
TE: Tasks Summary:
> Attempted 3940 tasks of which 3940 didn't need to be rerun and all
> succeeded=E2=80=9D =E2=80=93 looks like changes are not recognized.

There are several ways to modify a repo, e.g. you can modify the recipe
to point to your own code, or add patches to the recipe.
But I would suggest to use the "devtool" way to modify code.
E.g. to modify the kernel, you actually need to modify the "linux-obmc"
recipe, so you can do:
```
# It will create build/workspace/sources/linux-obmc/ and add linux-obmc's
# bbappend in build/workspace/appends/ automatically
# So when you do build, bitbake will build the code in your workspace
devtool modify linux-obmc

# Do modifications in build/workspace/sources/linux-obmc/

bitbake obmc-phosphor-image # Now build your code
```

>
> 3.       I want add new sensor to =E2=80=9Crecipes-phosphor/sensors/=E2=
=80=9D. (I have gone
> through =E2=80=9Cdocs/sensor-architecture.md=E2=80=9D and couldn=E2=80=99=
t find details for the
> below questions)
>
> a.       Is there any specific rules to name =E2=80=9C.conf=E2=80=9D file=
?
>
Yes, the doc actually mentions this:

    The children of the obmc/hwmon directory should follow the children of =
the
    devicetree/base directory path on the system as defined by the kernel.

In short, the conf file's name and path shall match the device tree.

> b.      If there are multiple sensors inside i2c bus, how are =E2=80=9C.c=
onf=E2=80=9D files
> for each of the sensors defined?

The same as above, each conf file matches the devices tree's specific devic=
e.

>
> c.       How does openBMC/phosphor know which i2c device register it has =
to
> talk to for a specific sensor

The same as above.

>
> 4.       How do I add this sensor to =E2=80=9CDbus=E2=80=9D interface?. D=
oes step 2 cover
> this?

phosphor-hwmon parse the .conf, read the hwmon sensor in sysfs, and create
Dbus objects.
So both step 2 and step 3 are necessary.

>
> 5.       How do I add sensor to =E2=80=9Chwmon=E2=80=9D

The save as above.

>
> 6.       Noticed there are many =E2=80=9Cbin=E2=80=9D files generated aft=
er the build, can I
> know which file to use to flash that has =E2=80=9Cuboot+kernel+openbmc+=
=E2=80=A6=E2=80=9D. Can I
> flash this image on new system, without making any changes to openBMC
> components ?

Please refer to
https://github.com/openbmc/docs/blob/master/code-update/code-update.md

>
>  Thanks in advance for your help.
>
>
