Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::130; helo=mail-it1-x130.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ibWwKl/3"; 
 dkim-atps=neutral
Received: from mail-it1-x130.google.com (mail-it1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4306Vm2JySzF3d8
 for <openbmc@lists.ozlabs.org>; Wed, 21 Nov 2018 13:49:51 +1100 (AEDT)
Received: by mail-it1-x130.google.com with SMTP id o19so6660514itg.5
 for <openbmc@lists.ozlabs.org>; Tue, 20 Nov 2018 18:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=uw2igv/Za9DR1xT86TrTd67msa/hillmdr4Q9BUMxQo=;
 b=ibWwKl/3XKvr/0N5dVkhn3doOLgWp2Bln7Iop6R/bSXQhNZeO/Td4cHHFXe1jZsqP4
 dPqRIZk0JAW+EnrqUi5FBSJYqRMOxRT8z3jyQ3eewxHwbaG4n0TQ/41SGyEqHYpPRvzK
 3V2EpXyZkGPIWA9kPR2omGNMZACwBwbXh5XVtNJQgWNYpo0emiyuhDWam0a+83Jn2nVE
 /Yf31P1Wgp+GjzkhE63xgLOnkIVOBtlJGAAODXuk1NwWX97zeq7eCyvNC9fMRbBUK5bt
 1gZyKCq6Ad04s3W12XcGXV+xtigO0cXXyj+cyEToBCKwsxGTaPI4WGeu9bQQRFv78trr
 02IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=uw2igv/Za9DR1xT86TrTd67msa/hillmdr4Q9BUMxQo=;
 b=g2buXXdaTMPY2oGukuXsxnpaHX7A6md0SejQXzh6jdeRW9DvZFIsNUANYJIqP0Imhs
 WStcPFD5T72QnXY22qN946Fp7keBTB0me5jjMJOw58Hx2AoYCJujAE+Z5XYTplq7bu5e
 a8oZZ8IZIoAzSd30q4tcA36gEVn9BYruF9jhrFEJqXWg0hg8BTuxJqQEhyZWLIvJybBo
 Csi/UTt3FzRlk+oulYk7DcuaFb1ptpP2qHWHtAHYIrPwPcSVmgdZGG/FVDlDVYHcsgL0
 8plZAxOvVm/iyLhYZOjigf6gsCXsByyv/rQOC9BHWDvFl0n2A3U7+fRy/ydIfTT/esrm
 y2Nw==
X-Gm-Message-State: AA+aEWbreesJZl1Y+cX5l2H6f4Kg/LQPbEmLRNAYouLZzHT2OBQNpDCW
 wNe0HtxlnuR5Tncdc3K30iyCFq5TcQcQHSSQoSSXR+h8
X-Google-Smtp-Source: AJdET5cX3AYv+ZVVbO7xX0dQiW6vEi0wCbZz/06S3OxsKEXoC4zPPUbSau11g2KHLroNgsnEZhV/Ic1a8eHcdhtunTw=
X-Received: by 2002:a24:3a15:: with SMTP id
 m21-v6mr4182879itm.178.1542768589149; 
 Tue, 20 Nov 2018 18:49:49 -0800 (PST)
MIME-Version: 1.0
References: <CAARXrtmjaQkOH2Cy3nfYYjjvFvREB5N14xgnkYKHFOycEY9qHA@mail.gmail.com>
In-Reply-To: <CAARXrtmjaQkOH2Cy3nfYYjjvFvREB5N14xgnkYKHFOycEY9qHA@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 21 Nov 2018 10:49:34 +0800
Message-ID: <CAARXrt=Mg2OngzVWm3ixAn4Dk-Y=aUA9ZLJv-DzRabY=sNkM0w@mail.gmail.com>
Subject: Re: Discussion: PNOR image verification (and possibly Virtual PNOR)
 on 64MiB flash
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Adriana Kobylak <anoo@linux.vnet.ibm.com>
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
X-List-Received-Date: Wed, 21 Nov 2018 02:49:56 -0000

I would like to bring up this question again, as I got questions from system
vendors about PNOR code update.
For OpenPOWER systems, there are two kinds of PNOR, Virtual PNOR based on
ubi-fs, and static layout PNOR.

1. For Virtual PNOR, openpower-pnor-code-mgmt implemented all the features,
   including:
   1. Version management;
   2. Code update;
   3. Image verification.
2. For static layout PNOR, there is no support in openpower-pnor-code-mgmt.
   Only code update is imlemented by legacy org.openbmc.control.Flash.service.

To support version management and image verification, should we switch to use
virtual PNOR, or keep using static layout (and add code to implement the
missing features?)

See below email for some details and pros/cons of each way.


On Tue, May 29, 2018 at 5:28 PM Lei YU <mine260309@gmail.com> wrote:
>
> This email is to discuss about PNOR image verification on 64MiB flash, and
> possibly it may involve Virtual PNOR feature.
>
> Background:
> Witherspoon has 128MiB flash, enables PNOR image verification and Virtual PNOR
> feature, implemented by openpower-software-manager.
> And it has the assumptions of:
> 1. Enough space for 2 PNOR images, thus physically 128MiB flash chip is
>    needed;
> 2. UBIFS on PNOR;
> 3. PNOR build in squashfs with signatures.
>
> Most OpenPOWER machines uses 64MiB PNOR flash and non-UBIFS, so I would like
> to discuss how to support PNOR image verification on smaller chips.
>
> We have two ways:
> 1. Change to use UBIFS and Virtual PNOR feature with
>    openpower-software-manager;
> 2. Keep current fixed layout, and added new code to support image
>    verification.
>
> For 1, it needs code change to assume there is only space for one PNOR image,
> then we get all the exiting features: PNOR version, image sign verification,
> code update and virtual PNOR.
>
> For 2, quite a lot of changes are needed:
> * Generate signature for the whole pnor image (in op-build);
> * Changes in openpower-software-manager to get version of PNOR;
> * Changes in openpower-software-manager to support code update of fixed PNOR
>    layout;
>
> So I would prefer 1, to make openpower-software-manager support single PNOR
> image.
>
> What do you think?
