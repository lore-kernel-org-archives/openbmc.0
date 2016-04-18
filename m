Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x244.google.com (mail-pf0-x244.google.com
 [IPv6:2607:f8b0:400e:c00::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qp8Wl17qvzDq5g
 for <openbmc@lists.ozlabs.org>; Mon, 18 Apr 2016 10:43:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=w/6L/LhT; 
 dkim-atps=neutral
Received: by mail-pf0-x244.google.com with SMTP id r187so15546678pfr.2
 for <openbmc@lists.ozlabs.org>; Sun, 17 Apr 2016 17:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zBzwI/ndgmYMrWzEMiH03GLjKXRM8ScxIn8gFLYPXo4=;
 b=w/6L/LhT1lzOhNb5fvvuDBLLSvUkMRgxVmG3tXo9JIokUvfQZxnGVLTQ/gZReimX39
 ftgRaYlsqCF43QfpT8ni9hNWQtAyY97rGPs0OaNdxgyeR89pV7AHOfgG/xygQqgATc0l
 6ov7XXlAAK6DFeyZ1Gw6R205NQuwqKg5URVhq7jcJ77LzgaBOFEDH7HaMO7uYIVJKqtD
 j7/ICwMDaF3t+DMdf/QMH0R8ZLje3uE70nZp6FQIUZc32HMKy4aGKVwC2PlMqFWZECRI
 schkosIKQFdKj7GgR/LSFnbQH7n2B0s8st+Tf5DwooUHn+nTgPqqvjBDj1tm9Znb4y4r
 vymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zBzwI/ndgmYMrWzEMiH03GLjKXRM8ScxIn8gFLYPXo4=;
 b=NQOHkuYe4zUXJQcaeVto6RdJrSNjuu84DpXqXR23AL2DexNiVZbrnUhZH1QYVLwHRy
 6rvHNtIlO43SR841jVXFORtV8D+kTUGGJggvKlUlAXGes+p+3ieNHyRj8pnDbOvUY9V+
 MefbzXfMZYDFAWwGXIEDmDfYLJAuESYeQ55XYBKkmdrUfJVyNYS5UIdUxPaLqe2ixcvE
 ov7UtLKDYsI0kzG60eSueQwkNOPuHsCiT6rQcRpcAvrx/sq+wFQ7omxz425DBRVEFzFs
 D/MZBb1/apmDitKHs/5sUf75qusEBBPyDDihn0CF1yPvZP11P3MEQ6aciTMiZmOfDf5y
 WUKQ==
X-Gm-Message-State: AOPr4FU6KuSyCb+NgKhDkESda7zvc2Lyn0ZlxSEpcUSI5xuz1JxwuJxZWcOpxAzDGpVCKg==
X-Received: by 10.98.66.152 with SMTP id h24mr22307795pfd.156.1460940192111;
 Sun, 17 Apr 2016 17:43:12 -0700 (PDT)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id y27sm79049038pfi.11.2016.04.17.17.43.10
 (version=TLSv1/SSLv3 cipher=OTHER);
 Sun, 17 Apr 2016 17:43:11 -0700 (PDT)
Date: Mon, 18 Apr 2016 10:43:03 +1000
From: Cyril Bur <cyrilbur@gmail.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, Brad Bishop
 <bradleyb@us.ibm.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH skeleton 0/5] Remove custom
 org.openbmc.Object.ObjectMapper usage
Message-ID: <20160418104303.35aedd82@camb691>
In-Reply-To: <1460649655-15109-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1460649655-15109-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Apr 2016 00:43:15 -0000

On Thu, 14 Apr 2016 11:00:50 -0500
OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:

Hi Brad,

The series looks good to me but I have a question that I keep asking and I'm
not sure I've ever seen a response.

Is it worth continuing to patch (and in this case cleanup) skeleton code? I was
under the impression that this wouldn't live on and that this was for bringup?

> <!-- Reviewable:start -->
> This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/skeleton/61)
> <!-- Reviewable:end -->
> 
> 
> https://github.com/openbmc/skeleton/pull/61
> 
> Brad Bishop (5):
>   Remove fan control support from Palmetto
>   Add gitignore file
>   Whitespace fixes for objects/*.c
>   Fix compiler warnings for objects/*
>   Remove custom org.openbmc.Object.ObjectMapper
> 
>  .gitignore                      |    6 +
>  Makefile                        |   28 +-
>  bin/Palmetto.py                 |    7 -
>  bin/system_manager.py           |    4 +-
>  includes/object_mapper.c        |   31 --
>  includes/object_mapper.h        |   10 -
>  includes/openbmc.h              |    2 +-
>  objects/board_vpd_obj.c         |  119 ++---
>  objects/button_power_obj.c      |  345 ++++++------
>  objects/button_reset_obj.c      |  180 +++----
>  objects/control_bmc_barreleye.c |  496 +++++++++--------
>  objects/control_bmc_obj.c       |  445 ++++++++--------
>  objects/control_host_obj.c      |  540 +++++++++----------
>  objects/fan_generic_obj.c       |  263 +++++----
>  objects/flash_bios_obj.c        |  838 ++++++++++++++---------------
>  objects/flasher_obj.c           |  877 +++++++++++++++---------------
>  objects/host_watchdog_obj.c     |  365 +++++++------
>  objects/hwmons_barreleye.c      |  433 ++++++++-------
>  objects/hwmons_palmetto.c       |  422 +++++++--------
>  objects/led_controller.c        | 1124 ++++++++++++++++++++-------------------
>  objects/pcie_slot_present_obj.c |  327 ++++++------
>  objects/power_control_obj.c     |  633 +++++++++++-----------
>  22 files changed, 3656 insertions(+), 3839 deletions(-)
>  create mode 100644 .gitignore
>  delete mode 100644 includes/object_mapper.c
>  delete mode 100644 includes/object_mapper.h
>  mode change 100755 => 100644 objects/button_reset_obj.c
>  mode change 100755 => 100644 objects/control_host_obj.c
>  mode change 100755 => 100644 objects/led_controller.c
> 
