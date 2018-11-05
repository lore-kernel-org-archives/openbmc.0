Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Hmgq+EBh"; 
 dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42pdbh2H3vzDqfW
 for <openbmc@lists.ozlabs.org>; Tue,  6 Nov 2018 03:36:16 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id o19-v6so4696632pll.12
 for <openbmc@lists.ozlabs.org>; Mon, 05 Nov 2018 08:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=lUWV+MLIXBFeYpJk7ILrGBT6vfZ7Icxd/kQ9qa2eo7g=;
 b=Hmgq+EBhsVIH8CJSD3izJalmTsLAaTV9Lm0+rWwE5OEK7TG98MhkZXZ30nLt/FYnnR
 BSS7pWk0bpkrDn2lCDEbXJQ9FfoKTkTaAfFqFznj5LqozUCb7vpUD/vxEBDQ6MPl17Tn
 4YZgD4ttaw66BqN+a3q5lBIR7zqft476Ek75BrlpcdIukBVG5FxXJUL7ckhMtLi9Fpu4
 zaVYtOxVaSfmHPZ6UJlRBXZPkp2BEkqR5gNOT+Kd0zDQs0BAKQCHpVGVmN7iDw8E17a4
 kCYUxWyXWQ9XemPN2D9Rl5cvwPtkqdWO5jSUjYixMipoqZMHsnXxiP1/yzJUkEmIseP7
 Arsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=lUWV+MLIXBFeYpJk7ILrGBT6vfZ7Icxd/kQ9qa2eo7g=;
 b=Ts9Yv3VtCjsDcYhWkOS777tOiMWBNSUELIN4apt899wi5p2GbQrROhhXcTcSJgGG1H
 yYEh9e/08ZRUxW2UGtwyi622/dDgkO97YIPQw5Mb9v2soIhFiA1m6ecT4s6DOhje+FCO
 9ZudMshSGJ61i0vAtaIcTQgQdplqyOlFb8NPdOy2Qkb9TOi9qn8M+7kDXZqAkOCKA/Oe
 gLqZxRPDqxmESA0YY6AQ22/qX6Uvlk0R7JPO++YNZE9MZNWJWODAluPOJj42EiOp6Dq5
 MqGWGA11ZsFHYNvgDcgUbvR+0m0d/XyUd5dXYf7F/40Ync1rAhpMIDiqPQMWGR7HTOVR
 8bQg==
X-Gm-Message-State: AGRZ1gKQpHUE/q529aHywrST1qo5K39RpOrYnxM/iky9TDtefdCE0xDZ
 3cRAZMvfEbvSQK3Fexj3lwtiLyBBoWcB+aunepjMF1twbok=
X-Google-Smtp-Source: AJdET5fry4okzZX2+CohCftJSGhxhUmM30xA0qrWdCMJXwWaWNHzEVH9zyjcs6g3ZjVh27iSf4mMokoRWyvqJ4xWiS0=
X-Received: by 2002:a17:902:b612:: with SMTP id
 b18-v6mr23170542pls.205.1541435772006; 
 Mon, 05 Nov 2018 08:36:12 -0800 (PST)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Mon, 5 Nov 2018 08:36:00 -0800
Message-ID: <CAO=notzHPoyzg1+_rMO5Ddu29YcFDCFXtNo-Fch2tPTfcn67eg@mail.gmail.com>
Subject: palmetto 2400 vs q71l 2400
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 "Tanous, Ed" <ed.tanous@intel.com>
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
X-List-Received-Date: Mon, 05 Nov 2018 16:36:17 -0000

Ed,

For whatever reason, the q71l only has 128 MiB of RAM.  I checked the
dts for the palmetto ast2400 and it has 512.  So, I don't think
they're comparable 2400 systems.

As far as an upstream recipe to reduce the image for the quanta board.
I do periodic build testing of it, but nothing more in terms of
run-time testing.  I have a downstream Google recipe that strips out
nearly all image_features and extra applications to a minimal run-time
image.  However, now that's even too big.  I haven't had cycles to
trace out the run-time memory differences between the older 1.99.10
image and the 2.4 image.  The biggest differences appear in the kernel
though and not userspace.

Patrick
