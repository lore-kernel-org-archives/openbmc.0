Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::22d; helo=mail-it0-x22d.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="N9A9iqXr"; 
 dkim-atps=neutral
Received: from mail-it0-x22d.google.com (mail-it0-x22d.google.com
 [IPv6:2607:f8b0:4001:c0b::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42FQNH0jTKzF3JJ
 for <openbmc@lists.ozlabs.org>; Wed, 19 Sep 2018 13:30:06 +1000 (AEST)
Received: by mail-it0-x22d.google.com with SMTP id j81-v6so6400455ite.0
 for <openbmc@lists.ozlabs.org>; Tue, 18 Sep 2018 20:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=zs44957XOBVfuJ9XYYOC6V9bj57FRA0a/x9gKLE6a+E=;
 b=N9A9iqXrAtyzwM6axtJNEN3a1oBUh1fYVjNc1ncgxMelOh1SxzLqtijTT6SvvlauHw
 GjUlwAQi7w3In7Oieec5/WipcgtB+ZDUjsX+okoByWcDSSwPIIduDMtwgZQ9MjD+Ixn2
 clD5KhXwPUC/W5Pw9078x6p7HV5g/SG5Bzurm2bUm6BxkDWi4kTIB5T77U9s8VeR5SvB
 YSqLup3M/z4DGqPDMDOqjYHykmz+anvjFvnV4KQmUVcTzQrVw2jFS2TLo19l7zfWOVSV
 2048lua5V0vqDQW/7BVhOyLwsWbDN0OCz8SDzX9bP9gloJZd1/UkQrg+5PX9dIMmVx4r
 LYqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=zs44957XOBVfuJ9XYYOC6V9bj57FRA0a/x9gKLE6a+E=;
 b=bwYAm6eYPhNatK/TUKuhvy8Hr3iN47zJpNzH7gsp2ZLWjjCZt+zV8nFN0o1vpYfMYt
 OnpfcuzRQpomnMYvxFTVJ1eO5kw20Uo1XFM2uWRcMe8+fqRzshyKmxnfqMUv3JuLgdZ7
 feurIzli3MDjFz5kKp2U3NxUSEPRJCJruofEO5WEsflrqcty5zZRDUExeK0iwhVvpP/Z
 8OMSVCw+/tsB4hWiUaBP3g2ozm8Al+64ub6s6BOdjXeXRUHrD4uTTvYFnCGwmgfTxj4w
 Y3VJmoBsLMJaag8yMj6WT0LN77yX7Bnf/0fhBGMAstxAKs/JgJIGcnIxPlyCRwMRzaHJ
 IbWA==
X-Gm-Message-State: APzg51CahgxWJW432q8uMaiTU0sLa7Cm2d0SWgXjg+eb00lDcd/esmLX
 89RwMmVGY9UVn6ICo+WLDBxi79P1woBZkvLiXKkphR+qVsQ=
X-Google-Smtp-Source: ANB0VdZCeYZF4MzLEutu2yjC2jpaLb9dzjN43sFglWpMy2A5WU4uRqvFfVGJibiXeXZTkwy7rlSpsdMqlClDd7WxtWc=
X-Received: by 2002:a24:85c6:: with SMTP id
 r189-v6mr20970970itd.83.1537327803797; 
 Tue, 18 Sep 2018 20:30:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAARXrt=u1NYt4BLy0M5jiBVSWE9LwQ6ytuygXChVNbqApcPf3Q@mail.gmail.com>
In-Reply-To: <CAARXrt=u1NYt4BLy0M5jiBVSWE9LwQ6ytuygXChVNbqApcPf3Q@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 19 Sep 2018 11:29:49 +0800
Message-ID: <CAARXrtm=pLikfGz=t007hk0cSVRv5gKFV0wygrsA-nXH3g5yaQ@mail.gmail.com>
Subject: Re: Problem on static libraries enabled with LinkTimeOptimization
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 19 Sep 2018 03:30:08 -0000

An update on this about a "better" workaround.

To use gcc-ar gcc-ranlib with autoconf, we could "define" the tools in
configure.ac before `AM_PROG_AR` to override the default ones.

    AC_SUBST([AR], [${ac_tool_prefix}gcc-ar])
    AC_SUBST([RANLIB], [${ac_tool_prefix}gcc-ranlib])

See an example at
https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-fan-presence/+/12962/

This change is smaller and does not involves bitbake recipes anymore.

Any feedback/comment is welcome :D

On Wed, Sep 12, 2018 at 5:26 PM Lei YU <mine260309@gmail.com> wrote:
>
> This email is to describe a problem about static libraries enabled with
> LinkTimeOptimization (-flto), and asking for suggestions how to fix the
> problem.
>
> ## Background
>
> When a repo enables lto, and if the repo builds a static library, it gets
> build error, e.g. for [phosphor-fan-presence#11][1]
>
>     arm-openbmc-linux-gnueabi-ar: .libs/libfan_la-utility.o: plugin
> needed to handle lto object
>     arm-openbmc-linux-gnueabi-ar: .libs/libfan_la-timer.o: plugin
> needed to handle lto object
>     arm-openbmc-linux-gnueabi-libtool: link:
> arm-openbmc-linux-gnueabi-ranlib .libs/libfan.a
>     arm-openbmc-linux-gnueabi-ranlib:
> .libs/libfan.a(libfan_la-utility.o): plugin needed to handle lto
> object
>     arm-openbmc-linux-gnueabi-ranlib:
> .libs/libfan.a(libfan_la-timer.o): plugin needed to handle lto object
>
> And eventually it causes undefined references during linking.
> The same for phosphor-time-manager.
>
>
> ## Root Cause
>
> ar needs to load liblto_plugin to handle lto objects, and our build
> environment does not tell ar to load the plugin.
>
> According to https://gcc.gnu.org/wiki/LinkTimeOptimizationFAQ:
> > In order to handle archives of these objects you have to use the gcc
> > wrappers: gcc-ar, gcc-nm and gcc-ranlib.
>
> So the simplest way to load the plugin is to use gcc-ar instead of ar.
>
>
> ## Question
>
> Most of phosphor repos in OpenBMC uses autotool to configure, and it depends
> on environment variables to configure the repo.
> By default, AR is defined as `${TARGET_PREFIX}ar`, I do not find a way to
> change it.
>
> So my question is, how to handle this case? E.g. how to specify gcc-ar in
> autoconf?
>
>
> ## References
>
> * I have an *ugly* workaround to override AR by define it in `EXTRA_OECONF`,
>    see https://gerrit.openbmc-project.xyz/#/c/openbmc/openbmc/+/12721/ for
>    details.
> * bmcweb uses CMake and it specifies gcc-ar in [CMakefiles][2].
>
> [1]: https://github.com/openbmc/phosphor-fan-presence/issues/11
> [2]: https://github.com/openbmc/bmcweb/blob/master/CMakeLists.txt#L70
