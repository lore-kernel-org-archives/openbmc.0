Return-Path: <benjaminfair@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::731; helo=mail-qk1-x731.google.com;
 envelope-from=benjaminfair@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="sdo9NpSE"; 
 dkim-atps=neutral
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43Zdhl5QKnzDqZD
 for <openbmc@lists.ozlabs.org>; Thu, 10 Jan 2019 05:59:19 +1100 (AEDT)
Received: by mail-qk1-x731.google.com with SMTP id o8so5031584qkk.11
 for <openbmc@lists.ozlabs.org>; Wed, 09 Jan 2019 10:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K0lvANgnScPRP3rjTJ16XrxA4ZgitvvDmcphhYqenFk=;
 b=sdo9NpSEOE3p1yEzgi2MVIM0rU6ZscazvruH6YCOmQfibinfJq2Zv+nHirBHgoGWUG
 MEU+i3chfn5sDdNF47ksjCjyrSgiSjwEQTCMZpauTa6hzEiqOmCAsD5XGufHKfCju1kd
 +ap8A865acXWHqpMBpzWtBHs55FKsLoYspz8MMqip+MRhzx7f8SznHfahY8pxt6Yt4iF
 xb4NugqaAVAmRv5KseTMe+t2rtqJBmcbQ0d7Oldv8roqlJrrQLzPhX0O1FH4LN6oFPz1
 h7L0x/LpYEhzLr3KRqv1Aawbfh0LyTa0y+EhfLWypPS2xm02dR7dCpxoedB00a/zQJLa
 bEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K0lvANgnScPRP3rjTJ16XrxA4ZgitvvDmcphhYqenFk=;
 b=Rrubr3TYtX6Ypm5olV9aiZsrSjeDIASJFAY8wQHz4Z2vFzs/UeKpIk8YzvzZGGZOZy
 jZdnd+cdoumpLxaPwtrPrIfnnn85DCU6+9V4YQuu+Ebh2rpvD0HDSkofAXVvP1NaMkmj
 p2F1wNlKpL7MAnh6lNPdf0ZsdtqgXGxKZ8LsLlCjwT2tj/1OL0hhWOjBvuWDwifw7Q3b
 YgJkwPqmSnJryr4KtZbFfWI9vkIu9sKnGO+raP+ZYOveJg6Ul8DwKAxFKvy9uRD0hoA8
 ZvM7oaSM3gT92iJJfU1ttNhEmend+Lb8ODRJ+vW2uuxLHulhGNhzegmpAws3jZqzZb3H
 VByw==
X-Gm-Message-State: AJcUukddkjveXz/to0CvxTgFofAOmEj9/dt9f4qrNe2S6Vm0GvZjiX4y
 TiFWmxJPmrGPFZ+Jwl6FFC65Beh6hXdn/ZjC/C0Y1w==
X-Google-Smtp-Source: ALg8bN59Gg1WfZ0jzKOmwGe+bVuV5lc8BH4CyC0f+Tbci6yDueG5pArZ+c43YozrHp7+o20MPTsZScMgdhVfxELGSHs=
X-Received: by 2002:a37:6442:: with SMTP id y63mr6461703qkb.119.1547060356133; 
 Wed, 09 Jan 2019 10:59:16 -0800 (PST)
MIME-Version: 1.0
References: <CAG4=AL-mZMe5iySguXGm9Nk2qXOtDvrj-9Acf+8eSMpX=MhbKA@mail.gmail.com>
 <CAO=notxSSvD2V_1tV+MBbfPqRD7qfSMvsOY2-6Q-aY0JzW-R9Q@mail.gmail.com>
In-Reply-To: <CAO=notxSSvD2V_1tV+MBbfPqRD7qfSMvsOY2-6Q-aY0JzW-R9Q@mail.gmail.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Wed, 9 Jan 2019 10:58:40 -0800
Message-ID: <CADKL2t5pdQ5zNEnn4S+Y9nEUR+XMBv5R2DdvoQLXZ4YNrz0dag@mail.gmail.com>
Subject: Re: do_cofigure fail
To: Patrick Venture <venture@google.com>
Cc: Sheldon 13 <tssheldonpotter@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 09 Jan 2019 18:59:20 -0000

On Wed, Jan 9, 2019 at 10:05 AM Patrick Venture <venture@google.com> wrote:
>
> On Wed, Jan 9, 2019 at 12:16 AM Sheldon 13 <tssheldonpotter@gmail.com> wrote:
> >
> > After I add a new application (such as sdbus or phosphor-fan-presence) using DEVTOOL, I build it with BITBAKE, but it always get error like this:

Why are you adding a new recipe for these applications? You should be
able to use the existing recipes that have already been written.

Here's the one for sdbusplus for instance:
https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-extended/sdbusplus/sdbusplus_git.bb

> > ##########################################################
> > NOTE: Executing RunQueue Tasks
> > ERROR: sdbusplus-1.0+git999-r0 do_configure: configure failed
> > ERROR: sdbusplus-1.0+git999-r0 do_configure: Function failed: do_configure (log file is located at /home/sheldon13/dev/openbmc-2.2/build/tmp/work/armv5e-openbmc-linux-gnueabi/sdbusplus/1.0+git999-r0/temp/log.do_configure.114229)
> > ERROR: Logfile of failure stored in: /home/sheldon13/dev/openbmc-2.2/build/tmp/work/armv5e-openbmc-linux-gnueabi/sdbusplus/1.0+git999-r0/temp/log.do_configure.114229
> > Log data follows:
> > | DEBUG: Executing python function externalsrc_configure_prefunc
> > ############################################################
> >
> >
> >
> > My recipe file sdbusplus_git.bb was automatically generated by the DEVTOOL command ,it is like this:
> > ##################################################################################################################
> > # Recipe created by recipetool
> > # This is the basis of a recipe and may need further editing in order to be fully functional.
> > # (Feel free to remove these comments when editing.)
> >
> > # WARNING: the following LICENSE and LIC_FILES_CHKSUM values are best guesses - it is
> > # your responsibility to verify that the values are complete and correct.
> > #
> > # The following license files were not able to be identified and are
> > # represented as "Unknown" below, you will need to check them yourself:
> > #   LICENSE
> > LICENSE = "Unknown"
> > LIC_FILES_CHKSUM = "file://LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"
> >
> > SRC_URI = "git://github.com/openbmc/sdbusplus.git;protocol=https"
> >
> > # Modify these as desired
> > PV = "1.0+git${SRCPV}"
> > SRCREV = "09c981700d7bd98eed54a670e959a424585dcd84"
> >
> > S = "${WORKDIR}/git"
> >
> > # NOTE: the following library dependencies are unknown, ignoring: gtest gmock
> > #       (this is based on recipes that have previously been built and packaged)
> > DEPENDS = "gtest systemd"
> >
> > # NOTE: if this software is not capable of being built in a separate build directory
> > # from the source, you should replace autotools with autotools-brokensep in the
> > # inherit line
> > inherit pkgconfig pythonnative autotools
> >
> > # Specify any options you want to pass to the configure script using EXTRA_OECONF:
> > EXTRA_OECONF = ""
> > ###############################################################################################################
> > and I didn't change the recipe and didn't know how to change it. Can you help me build my project?
>
> Can you provide your full steps to reproduce your workspace, such as,
> git clone openbmc, git clone sdbusplus, and so on, as I haven't had
> issues recently with devtool.

Can you also describe what you're trying to accomplish? Feel free to
join the IRC channel #openbmc on freenode.net if that's easier.

Benjamin
