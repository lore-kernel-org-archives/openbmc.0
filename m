Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::22c; helo=mail-oi1-x22c.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ljHC/ZL1"; 
 dkim-atps=neutral
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43bkPB3nwCzDqq8
 for <openbmc@lists.ozlabs.org>; Sat, 12 Jan 2019 00:34:38 +1100 (AEDT)
Received: by mail-oi1-x22c.google.com with SMTP id u18so12181773oie.10
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jan 2019 05:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HWQWEO5puyGNYZDuWvwXlGLcCqw5q5yTUhy589FgxrM=;
 b=ljHC/ZL1adxyyqXdGq79iGhPrpy5Ss7ENN8BBuorBz2xCQSzAFtpSORhe67WET7q9p
 0td4jBgSIowhdURSTMpDEy0yIhCVjygcCGF5KOislKmZchGkT6TCpbY418jxICRwwwjG
 sAup6/n5yD9YzNeQDg/GQLARyytjksgo+xfAIm448VCk3vOkipm84SRJML1aCqcUwfJP
 CwCYVJJfvn9in/WX0RNWqhNwkZuWLHxg2zrPIYDo4h8DewgY1Zy0czK+xVlXaDd5HHaU
 hJ24VUZVGi/UzZYtX3aGPUjbazJcCgzkjd8n9e3psGYtyMKtjJ2utOevw2njBRR0DR41
 xf5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HWQWEO5puyGNYZDuWvwXlGLcCqw5q5yTUhy589FgxrM=;
 b=Iu7qAMV1a3fMpv/uWYj9og+zm6y4XWg6I5kb/dECjufaPYub/G9cyVGXWHrWJQVmE7
 sdD7skqJzcynB4GeDtabkh7hsmVdrcXta2aypCsNGp4M3Lp7yzL+f6FHt0gPx9egstzj
 yUFFDeKnyGQnavAlVhvMBK0mOk/wAPdwkO08Yjdqv34hVrx6I3CKSAz44vvEb9ykE4qM
 opmlEBR8EbJXxhz47q3zJ2Mag0aqchjfTFuGZK+18hYIz4e2UzR3Tg+V7pQZWZ1gEVmx
 STHQyqKV9Ir2HknCV2UUWjzIc4d9pNEwx9QNqlDQGwUkjHd41azwLUe6FJnY27ibPmqo
 AsaQ==
X-Gm-Message-State: AJcUukc0qkxnmqZwWjzeGhPZc2tP4cbs+pjD2I5he21d0NK9zL4YvtTm
 sO/ZrL4kBCjxIxAr1YT9DbkEx4zHH5Lw79tezq0=
X-Google-Smtp-Source: ALg8bN5zLnwBflaQQSRbxB1+nTSWIOOk2yNz3PeO4bGsej3rHR7+6VH7zYwiwoxIsK9/4jVcFRkilPrwYJv3sctAZ4k=
X-Received: by 2002:aca:a11:: with SMTP id 17mr8817025oik.15.1547213675607;
 Fri, 11 Jan 2019 05:34:35 -0800 (PST)
MIME-Version: 1.0
References: <CAOSNvHpQqF_7=RCN+jcR7enA+x_ikWfUP70P0rizau7MoZYFbw@mail.gmail.com>
In-Reply-To: <CAOSNvHpQqF_7=RCN+jcR7enA+x_ikWfUP70P0rizau7MoZYFbw@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Fri, 11 Jan 2019 07:34:19 -0600
Message-ID: <CALLMt=q75TCAEhAnLD1sv=cdN8dWdUZwwt3ZjyOK4HeTS9m9zA@mail.gmail.com>
Subject: Re: Build fail - Reg
To: omkar.kuppa@sanmina.com
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
X-List-Received-Date: Fri, 11 Jan 2019 13:34:39 -0000

On Fri, Jan 11, 2019 at 6:12 AM Omkar Kuppa <omkar.kuppa@sanmina.com> wrote=
:
>
> Hi all,
> I've downloaded the openbmc project from github. While building the proje=
ct, I'm facing the following error.
>
> Build Configuration:
> BB_VERSION           =3D "1.40.0"
> BUILD_SYS            =3D "i686-linux"
> NATIVELSBSTRING      =3D "ubuntu-14.04"
> TARGET_SYS           =3D "arm-openbmc-linux-gnueabi"
> MACHINE              =3D "zaius"
> DISTRO               =3D "openbmc-phosphor"
> DISTRO_VERSION       =3D "0.1.0"
> TUNE_FEATURES        =3D "arm armv6 thumb arm1176jzs"
> TARGET_FPU           =3D "soft"
> meta-zaius           =3D "master:1a4b7ee28bf7413af6513fb45ad0d0736048f866=
"
>
> ERROR: dbus-broker-16+gitAUTOINC+fc874afa09-r0 do_fetch: Fetcher failure:=
 Fetch command export PSEUDO_DISABLED=3D1; export DBUS_SESSION_BUS_ADDRESS=
=3D"unix:abstract=3D/tmp/dbus-4MEPus6gYW"; export SSH_AUTH_SOCK=3D"/run/use=
r/1000/keyring-5RCWfK/ssh"; export PATH=3D"/../openbmc/build/tmp/work/armv6=
-openbmc-linux-gnueabi/dbus-broker/16+gitAUTOINC+fc874afa09-r0/recipe-sysro=
ot-native/usr/bin/python3-native:/../openbmc/scripts:/../openbmc/build/tmp/=
work/armv6-openbmc-linux-gnueabi/dbus-broker/16+gitAUTOINC+fc874afa09-r0/re=
cipe-sysroot-native/usr/bin/arm-openbmc-linux-gnueabi:/../openbmc/build/tmp=
/work/armv6-openbmc-linux-gnueabi/dbus-broker/16+gitAUTOINC+fc874afa09-r0/r=
ecipe-sysroot/usr/bin/crossscripts:/../openbmc/build/tmp/work/armv6-openbmc=
-linux-gnueabi/dbus-broker/16+gitAUTOINC+fc874afa09-r0/recipe-sysroot-nativ=
e/usr/sbin:/../openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/dbus-brok=
er/16+gitAUTOINC+fc874afa09-r0/recipe-sysroot-native/usr/bin:/../openbmc/bu=
ild/tmp/work/armv6-openbmc-linux-gnueabi/dbus-broker/16+gitAUTOINC+fc874afa=
09-r0/recipe-sysroot-native/sbin:/../openbmc/build/tmp/work/armv6-openbmc-l=
inux-gnueabi/dbus-broker/16+gitAUTOINC+fc874afa09-r0/recipe-sysroot-native/=
bin:/../openbmc/poky/bitbake/bin:/../openbmc/build/tmp/hosttools"; export H=
OME=3D"/home/omkar"; LANG=3DC git -c core.fsyncobjectfiles=3D0 clone --bare=
 --mirror git://github.com/bus1/dbus-broker /../openbmc/build/downloads/git=
2/github.com.bus1.dbus-broker --progress failed with exit code 128, output:
> Cloning into bare repository '/../openbmc/build/downloads/git2/github.com=
.bus1.dbus-broker'...
> fatal: unable to connect to github.com:
> github.com[0: 52.74.223.119]: errno=3DConnection timed out
> github.com[1: 13.250.177.223]: errno=3DConnection timed out
> github.com[2: 13.229.188.59]: errno=3DConnection timed out

These certainly looks suspicious. Intermittent github connection issues?
Did you try rebuilding a few times? The initial build requires a lot
of network based downloads.

>
> ERROR: dbus-broker-16+gitAUTOINC+fc874afa09-r0 do_fetch: Fetcher failure =
for URL: 'gitsm://github.com/bus1/dbus-broker;protocol=3Dgit'. Unable to fe=
tch URL from any source.
> ERROR: dbus-broker-16+gitAUTOINC+fc874afa09-r0 do_fetch: Function failed:=
 base_do_fetch
> ERROR: Logfile of failure stored in: /../openbmc/build/tmp/work/armv6-ope=
nbmc-linux-gnueabi/dbus-broker/16+gitAUTOINC+fc874afa09-r0/temp/log.do_fetc=
h.2531
> ERROR: Task (/../openbmc/meta-openembedded/meta-oe/recipes-core/dbus/dbus=
-broker_git.bb:do_fetch) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 2757 tasks of which 2756 didn't need to be=
 rerun and 1 failed.
>
> Summary: 1 task failed:
>   /../openbmc/meta-openembedded/meta-oe/recipes-core/dbus/dbus-broker_git=
.bb:do_fetch
>
> I'm trying to build the open bmc project for the first time. I tried to b=
uild for Romulus, Palmetto and Zaius. Each build failed with a different er=
ror. I don't have the errors for other builds. Please let me know how to re=
solve this error.
>
> Thanks in advance,
> Omkar
>
> CONFIDENTIALITY
> This e-mail message and any attachments thereto, is intended only for use=
 by the addressee(s) named herein and may contain legally privileged and/or=
 confidential information. If you are not the intended recipient of this e-=
mail message, you are hereby notified that any dissemination, distribution =
or copying of this e-mail message, and any attachments thereto, is strictly=
 prohibited. If you have received this e-mail message in error, please imme=
diately notify the sender and permanently delete the original and any copie=
s of this email and any prints thereof.
> ABSENT AN EXPRESS STATEMENT TO THE CONTRARY HEREINABOVE, THIS E-MAIL IS N=
OT INTENDED AS A SUBSTITUTE FOR A WRITING. Notwithstanding the Uniform Elec=
tronic Transactions Act or the applicability of any other law of similar su=
bstance and effect, absent an express statement to the contrary hereinabove=
, this e-mail message its contents, and any attachments hereto are not inte=
nded to represent an offer or acceptance to enter into a contract and are n=
ot otherwise intended to bind the sender, Sanmina Corporation (or any of it=
s subsidiaries), or any other person or entity.
