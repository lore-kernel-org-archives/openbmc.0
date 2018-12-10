Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="cnY7j370"; 
 dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43DFwl4jhFzDqdq
 for <openbmc@lists.ozlabs.org>; Tue, 11 Dec 2018 08:05:58 +1100 (AEDT)
Received: by mail-pg1-x52e.google.com with SMTP id w6so5536449pgl.6
 for <openbmc@lists.ozlabs.org>; Mon, 10 Dec 2018 13:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2olUJuu2q9I4tclkcjLvUgbybGql0VooopY8AnCXzh4=;
 b=cnY7j370rcJl+0q5jajsgUez1Y2A1q0TwkjZg8w6iqL/tvTn0wavQ2JC9lYPHpn1uB
 YzpbF9AY9htpfCexrZwAlCfRBJiLcSOdHg+GhJjm7FUC22lrqWAH3qCm3x5MremBFF6m
 OrkHIM94SXbQXRKb4EUoWESAFuNpzCcQWQQYNijaYFAa8Zkv/ayRYujf5v9QLYuDoSqZ
 +dersqohKXcBLwY9FDJCc4pVT0+9wMuXzrZnawV1g8y4y8IgcSU9OSSr3e/91pb14+KH
 PTZe0o3toqqra/mD+qQFObaGmf9kGgonV8RTasnfcWAufdnOY+4A52qtghFSBxwdjjRj
 I23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2olUJuu2q9I4tclkcjLvUgbybGql0VooopY8AnCXzh4=;
 b=BVCzUvpn9rwpXI73pYDPXlRAK5mDzBOPaMkRILMUAnMM69MATmsd0qT9TCCxZPyB0Y
 KnSMrrzVkO4BeDJmnDiujKtUzX7DFYRBJBSRLm0wbsc1CycbeQygIKaV6lsaDpIySaW3
 KjoY9tH+CKSg90kL5wGWPoNs1DPGUuMp4I0MchQK+HrLeyHgJpGJCpC+b8muHHkcjB1n
 fj3VIBSMrLb+NG5YzMuAynBrHdNUbdTaD5a11M62khmnBsaxoAY8j5H13uSAR0g+c8ca
 lVtZT33CwV7Y22OBmsyVOYffr91UWc3eyBpKinKxQ+fFvjTGP8IYibo3Q8nuOD79jKZJ
 zqLA==
X-Gm-Message-State: AA+aEWYIXsiZ9AbMPd+Px1E02uqrL0csvJXdDsWoJKFiTrfRQeLx2psM
 HLMAO1oKNdZStPIFoSKIT899XkvqEJ9RgRuP8TVQxqUuJoaOUg==
X-Google-Smtp-Source: AFSGD/URflJlDjYhquLaxuLgHeFJq27+i58tz6RTdCfduqs1tRTcYptNy9RWugbhbFFFiFicZlZGYCXJB77Q0oWx4VE=
X-Received: by 2002:a63:4044:: with SMTP id n65mr11830100pga.90.1544475955757; 
 Mon, 10 Dec 2018 13:05:55 -0800 (PST)
MIME-Version: 1.0
References: <CAO=notwGziS7LeKh-g_G6Q-yTj7tmsGjiHMUv6uk5ic8hXxq5A@mail.gmail.com>
 <20181210202422.GI8064@mauery.jf.intel.com>
 <CAO=notxhnK9MSpffPh0cAHQhQG3GdXUO5WqoDhJAyXpGhL+w-g@mail.gmail.com>
In-Reply-To: <CAO=notxhnK9MSpffPh0cAHQhQG3GdXUO5WqoDhJAyXpGhL+w-g@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 10 Dec 2018 13:05:44 -0800
Message-ID: <CAO=notyM+2o0Ktwz7Oqz9qCPWQUeHDAhhX37L-V12TEhoYvMtw@mail.gmail.com>
Subject: Re: PTAL - phosphor-host-ipmid build warnings/errors
To: Vernon Mauery <vernon.mauery@linux.intel.com>,
 William Kennington <wak@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Emily Shaffer <emilyshaffer@google.com>, tomjoseph@in.ibm.com
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 10 Dec 2018 21:06:00 -0000

On Mon, Dec 10, 2018 at 12:50 PM Patrick Venture <venture@google.com> wrote:
>
> On Mon, Dec 10, 2018 at 12:24 PM Vernon Mauery
> <vernon.mauery@linux.intel.com> wrote:
> >
> > On 10-Dec-2018 11:24 AM, Patrick Venture wrote:
> > >I've noticed recently a lot of build warnings since v2.4 on phosphor-host-ipmid:
> > >
> > >DEBUG: Executing python function externalsrc_compile_prefunc
> > >NOTE: phosphor-ipmi-host: compiling from external source tree
> > >/usr/local/google/git/workspaces/rebasing_daemons/gbmc-host-ipmid
> >
> > I have a patch that removes some of these "notes". They aren't warnings
> > because phosphor-host-ipmid builds with -Werror, which would cause it to
> > fail if there were actually warnings. But the note messages are
> > annoying. Digging into it, it looks like they spawn from an ABI
> > difference between gcc 6 and gcc 7+. This is to notify people that are
> > building new binaries to run on systems that have libraries built with
> > an old gcc that they may not work as expected. Since all of our binaries
> > are built with the same compiler, these notes can safely be ignored. For
> > now, some of them can be removed with -Wno-psabi .
>
> Thanks. I'm seeing an error at some point, with a couple extra patches
> and I think I pointed my finger at the wrong line!

When I enable:
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-host-ipmid/+/16486

It now fails to install, due to:

WARNING: phosphor-ipmi-host-1.0+git999-r1 do_install: install_file:
/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/image//usr/lib/ipmid-providers/libipmi20.so.?
<--- my debug to see what's missing
ERROR: phosphor-ipmi-host-1.0+git999-r1 do_install: Error executing a
python function in exec_python_func() autogenerated:

The stack trace of python calls that resulted in this exception/failure was:
File: 'exec_python_func() autogenerated', lineno: 2, function: <module>
     0001:
 *** 0002:symlink_create_postinstall(d)
     0003:
File: '/usr/local/google/git/workspaces/building_24_rebase/meta-phosphor/classes/obmc-phosphor-ipmiprovider-symlink.bbclass',
lineno: 38, function: symlink_create_postinstall
     0034:        os.symlink(source, os.path.join(install_dir, file))
     0035:
     0036:    for libname in listvar_to_list(d, 'HOSTIPMI_PROVIDER_LIBRARY'):
     0037:        install_dir = d.getVar('HOSTIPMI_LIBDIR', True)
 *** 0038:        install_symlink(d, libname, install_dir)
     0039:
     0040:    for libname in listvar_to_list(d, 'NETIPMI_PROVIDER_LIBRARY'):
     0041:        install_dir = d.getVar('NETIPMI_LIBDIR', True)
     0042:        install_symlink(d, libname, install_dir)
File: '/usr/local/google/git/workspaces/building_24_rebase/meta-phosphor/classes/obmc-phosphor-ipmiprovider-symlink.bbclass',
lineno: 30, function: install_symlink
     0026:
     0027:        filelist = glob.glob(install_file);
     0028:
     0029:        # get the library name
 *** 0030:        path, file = os.path.split(filelist[0])
     0031:        source = "../ipmid-providers/" + file
     0032:
     0033:        # create the symlink
     0034:        os.symlink(source, os.path.join(install_dir, file))
Exception: IndexError: list index out of range

ERROR: phosphor-ipmi-host-1.0+git999-r1 do_install: Function failed:
symlink_create_postinstall
ERROR: Logfile of failure stored in:
/usr/local/google/git/workspaces/building_24_rebase/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/temp/log.do_install.53590
ERROR: Task (/usr/local/google/git/workspaces/building_24_rebase/meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-host_git.bb:do_install)
failed with exit code '1'
NOTE: Tasks Summary: Attempted 4982 tasks of which 4974 didn't need to
be rerun and 1 failed.

I added the no-warning you suggested, I see the warnings now only on linking.

And it appears to be building the libipmi20 library:

find ./tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/
-iname "libipmi20*so*"
./tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/phosphor-ipmi-host-1.0+git999/libipmi20_la-sensorhandler.lo
./tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/phosphor-ipmi-host-1.0+git999/.libs/libipmi20_la-sensor-gen.o
./tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/phosphor-ipmi-host-1.0+git999/.libs/libipmi20.so
./tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/phosphor-ipmi-host-1.0+git999/.libs/libipmi20.so.0.0.0
./tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/phosphor-ipmi-host-1.0+git999/.libs/libipmi20_la-sensorhandler.o
./tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/phosphor-ipmi-host-1.0+git999/.libs/libipmi20.so.0
./tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/phosphor-ipmi-host-1.0+git999/.libs/libipmi20_la-ipmisensor.o
./tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/phosphor-ipmi-host-1.0+git999/.libs/libipmi20_la-inventory-sensor-gen.o
./tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/phosphor-ipmi-host-1.0+git999/.libs/libipmi20_la-sensordatahandler.o
./tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/phosphor-ipmi-host-1.0+git999/libipmi20_la-ipmisensor.lo
./tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/phosphor-ipmi-host-1.0+git999/libipmi20_la-inventory-sensor-gen.lo
./tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/phosphor-ipmi-host-1.0+git999/libipmi20_la-sensordatahandler.lo
./tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/phosphor-ipmi-host-1.0+git999/libipmi20_la-sensor-gen.lo

:/usr/local/google/git/workspaces/building_24_rebase/build$ ll
tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/image/usr/lib/
total 10248
drwxr-xr-x 4 venture primarygroup     4096 Dec 10 12:57 ./
drwxr-xr-x 5 venture primarygroup     4096 Dec 10 12:57 ../
drwxr-xr-x 2 venture primarygroup     4096 Dec 10 12:57 host-ipmid/
drwxr-xr-x 2 venture primarygroup     4096 Dec 10 12:57 ipmid-providers/
lrwxrwxrwx 1 venture primarygroup       21 Dec 10 12:57
libuserlayer.so -> libuserlayer.so.0.0.0*
lrwxrwxrwx 1 venture primarygroup       21 Dec 10 12:57
libuserlayer.so.0 -> libuserlayer.so.0.0.0*
-rwxr-xr-x 1 venture primarygroup 10474976 Dec 10 12:57 libuserlayer.so.0.0.0*

:/usr/local/google/git/workspaces/building_24_rebase/build$ ll
tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/image/usr/lib/ipmid-providers/
total 120
drwxr-xr-x 2 venture primarygroup   4096 Dec 10 12:57 ./
drwxr-xr-x 4 venture primarygroup   4096 Dec 10 12:57 ../
lrwxrwxrwx 1 venture primarygroup     23 Dec 10 12:57
libsysintfcmds.so -> libsysintfcmds.so.0.0.0*
lrwxrwxrwx 1 venture primarygroup     23 Dec 10 12:57
libsysintfcmds.so.0 -> libsysintfcmds.so.0.0.0*
-rwxr-xr-x 1 venture primarygroup 111512 Dec 10 12:57 libsysintfcmds.so.0.0.0*

So it's definitely not there now.  Without the relink ordering patch,
it ends up there:

ll tmp/work/armv6-openbmc-linux-gnueabi/phosphor-ipmi-host/1.0+git999-r1/image/usr/lib/ipmid-providers/;
total 5220
drwxr-xr-x 2 venture primarygroup    4096 Dec 10 13:05 ./
drwxr-xr-x 5 venture primarygroup    4096 Dec 10 13:05 ../
lrwxrwxrwx 1 venture primarygroup      18 Dec 10 13:05 libipmi20.so ->
libipmi20.so.0.0.0*
lrwxrwxrwx 1 venture primarygroup      18 Dec 10 13:05 libipmi20.so.0
-> libipmi20.so.0.0.0*
-rwxr-xr-x 1 venture primarygroup 5218452 Dec 10 13:05 libipmi20.so.0.0.0*
lrwxrwxrwx 1 venture primarygroup      23 Dec 10 13:05
libsysintfcmds.so -> libsysintfcmds.so.0.0.0*
lrwxrwxrwx 1 venture primarygroup      23 Dec 10 13:05
libsysintfcmds.so.0 -> libsysintfcmds.so.0.0.0*
-rwxr-xr-x 1 venture primarygroup  111512 Dec 10 13:05 libsysintfcmds.so.0.0.0*
