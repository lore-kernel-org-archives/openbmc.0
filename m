Return-Path: <venture@google.com>
Received: from mail-ua0-x232.google.com (mail-ua0-x232.google.com
 [IPv6:2607:f8b0:400c:c08::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xkTxj68SXzDqYy
 for <openbmc@lists.ozlabs.org>; Sat,  2 Sep 2017 05:36:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="R3ighwnS"; 
 dkim-atps=neutral
Received: by mail-ua0-x232.google.com with SMTP id j46so3179013uag.5
 for <openbmc@lists.ozlabs.org>; Fri, 01 Sep 2017 12:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=bkpxknLkWKPctx3IkwkMfruiAzeIa4LykKyN3/xLlj4=;
 b=R3ighwnSiLhQlXQvZ4/Tfq2AKwKleh4NT8KVC9Rh+jZZDdqsfN66mQ7OizdSXr+MvG
 dzXSKRji4oc+k7dH7ccxtouS0+j0klC/6TRpOd8sSKjo/sCA4vO+qPznAhbEAjo90DMS
 7YpmItYR/PIvLZA85uSYRcqlB+CU7rAA1I/x4XeNAqV1W51Q7r/aJoYNL4uhrac40KR5
 tr+NLdgZwrKlqv15YUsTFQzASlbhy5Ljs7ppBfzkqstcuUi6UvNzf8+2JKNMMO04HA6I
 WhZg0GoSByoaxngw8k3s8zMPLr05iPCMdIVVL8GCzPFEfP+xymTjC9o4ji6/vadWXLFj
 xF6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=bkpxknLkWKPctx3IkwkMfruiAzeIa4LykKyN3/xLlj4=;
 b=JaL6YuRZsPu4uNrCWMRPG0hqkPdSs1bzfck1GpnGqtqad6d6oIs5atYCSdA4H0o7DN
 b4Zzi7wJt/wJ3khQnsX6qB5HoNuC827G5DjpQfGk+l9lSwYUazwCv4payqBM6SuNXUzd
 Ab4+b6SSjClQGZCl+WMs+2i2kJE8Uyg+mhSaf36HYiViQi47Ke5hXnirczY2hX0Jwpgw
 0bMN9Du31CBKJ7xr/rMbhe7ZLNe+DWzhkn+bFX2RFO0SOlk5QU0vmeGuntLJFfK0fI4u
 djdI9Ob6sKoMuQfg8jsZO/oQ/dyHSdzujPWqnTfJsjahoJuRlKXyxHufCQXjnzHPcaac
 Uogg==
X-Gm-Message-State: AHPjjUiqQuSRIQBGyxKVGM4+IjBQcfXr41Otfoumjjewfl1wv0o9DbY/
 2AXbUWllS/7/bnd7jdqB+X1RPJv06OFO
X-Google-Smtp-Source: ADKCNb7F8wzc+teGgkkq8OK0jVk/NyuBNPw4vIrOkxeSKZdjOw0yIMbMfJX+G80gQZEk/PVf0cJMnTx+gcOH9GzbIuw=
X-Received: by 10.176.86.206 with SMTP id c14mr2071989uab.156.1504294566749;
 Fri, 01 Sep 2017 12:36:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.165.210 with HTTP; Fri, 1 Sep 2017 12:35:46 -0700 (PDT)
In-Reply-To: <OF2D430B1C.0ECB52AA-ON86258177.0076016C-8625818E.005FE1ED@notes.na.collabserv.com>
References: <OF2D430B1C.0ECB52AA-ON86258177.0076016C-8625818E.005FE1ED@notes.na.collabserv.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 1 Sep 2017 12:35:46 -0700
Message-ID: <CAO=notw4J__9WRcK_VjDt=WX1fzGm+JNfVYLPysd0KOkzA_9Gw@mail.gmail.com>
Subject: Re: layers and adding a new system
To: Chris Austen <austenc@us.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Sep 2017 19:36:10 -0000

Chris;

I think this is valuable to point out -- and especially the value of
MACHINE_OVERRIDES.  Because Google is building OpenBMC from a single
bblayer file, all the recipes we pickup need specific overrides.  So
it might be worth emphasizing the danger a little more that even
things in a separate folder that is machine specific may get picked up
depending on how things are organized.

On Fri, Sep 1, 2017 at 10:27 AM, Chris Austen <austenc@us.ibm.com> wrote:
> As the popularity of OpenBMC grows the project will hopefully find itself
> with additional pull requests to support more systems. As I did when I first
> started out you could easily be allured to simply copy/past the entire
> contents of a similar system under meta-openbmc-machines/... and call it
> your own. However scale that to anything greater then a few machines and the
> shier volume of duplicate code will become bulky and unmanageable. Yocto
> recognized this as an issue and has provided support to reduce. I would like
> to build a list of recommendations on how to add new hardware in to the
> OpenBMC Project.
>
>
> For hardware based on a similar design this is...
>
> Not good
> ========
> meta-mfg/meta-redfish/
> meta-mfg/meta-bluefish/
> meta-mfg/meta-yellowfish/
> meta-mfg/meta-greenfish/
>
>
> Good
> ========
> meta-mfg/meta-fish/
>
>
> So how can you do that? With a single variable in your local.conf...
> MACHINE. You change the MACHINE variable per system type but let default and
> use the base platform for common items.
>
> MACHINE = "bluefish"
>
> A bbappend that are specific to the bluefish system you append the _bluefish
>
> FILESEXTRAPATHS_prepend_bluefish := "${THISDIR}/${PN}:"
> SRC_URI_append_bluefish = " file://0001-blueworms.patch"
>
> A bbappend that make a common change to all of the fish type. This means
> anyone adding the meta-fish layer gets this bbappend and the rainbowworms.
>
> FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> SRC_URI_append = " file://0001-rainbowworms.patch"
>
> Machine and default are all good until If you use a bluefish system but you
> have a company policy use the MACHINEOVERRIDES variable
>
> FILESEXTRAPATHS_prepend_orgXfis := "${THISDIR}/${PN}:"
> SRC_URI_append_orgXfis = " file://0001-blueXworms.patch"
>
> Note yocto matches and runs every hit. That means if you add a default,
> machine and machine override in the same bbappend, you get all three files.
> So use with caution...
>
> FILESEXTRAPATHS_prepend_orgXfis := "${THISDIR}/${PN}:"
> SRC_URI_append_orgXfis = " file://0001-blueXworms.patch"
> SRC_URI_append = " file://0001-rainbowworms.patch"
> SRC_URI_append_bluefish = " file://0001-blueworms.patch"
>
> $ ls
> 0001-blueXworms.patch
> 0001-rainbowworms.patch
> 0001-blueworms.patch
>
>
> TBD.. need to add example of something being added, replaced and kernel
> device tree needs.
>
>
> Thoughts?

There is an effort to write up some system component bring-up with
OpenBMC, that's already had some results -- configuring LEDs.  By
adding something, are you referring to adding a new system's
configuration or a new package to OpenBMC?

>
>
>
> Chris Austen
>
