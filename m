Return-Path: <maxims@google.com>
Received: from mail-yw0-x236.google.com (mail-yw0-x236.google.com
 [IPv6:2607:f8b0:4002:c05::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t4b8j6hkkzDvPR
 for <openbmc@lists.ozlabs.org>; Fri, 28 Oct 2016 05:32:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=mZxISxaa; 
 dkim-atps=neutral
Received: by mail-yw0-x236.google.com with SMTP id p22so38943820ywe.0
 for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2016 11:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:from:date:message-id:subject:to;
 bh=1xBHpt5uEPZLHOToBEPKPTKkl31YgC+xIApDdOEfBqw=;
 b=mZxISxaa/mXjzLCV7DN6d9igKVWB+f8pXT1hgSjTF6Tv7OKu73ObJdNgYbFkzPdDNK
 qxkFKwV7V29dC1QugCs7kggmGd94ERDiyQZRBSItjZThanp8B9UWx3iri3Y9zh8Yt27M
 6NcZaPA02042HIbFmvbRcki/UUS/u2bI9kQZFsj+BoNhCQ+x7vCZvJJPuXr0KOVpsA5o
 xtJNCF2tZ+EVBaDuqcmYbsTU4anjsy8jdwhzxAClvU+C54D7bsWwOESt3Cfk1/08go98
 y4MGel7ALNq1HfHI0WznZMaHTkLRkLtzv4U9ZlNYutSqnFMi/dMoE35K+D4watOHteGp
 8nwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=1xBHpt5uEPZLHOToBEPKPTKkl31YgC+xIApDdOEfBqw=;
 b=i5IrIc/wXLKl84AjEJXKCWStXL4hbwA07seNQtxp/KIDN7Z1j2Foz8zPebtwxjnj3y
 Kg0EJaTL1imPFvFTDYpFkC3EoQps/fDHNM6gRfheV/m8QlyN8qvw5pbamO5mbDx1EZKk
 Itu05ZElkNVY3nY1cyHveP2cLx+CTTeAcAKeW3NBkTPyIIKVpopWCy/aVmkKtatxeOyA
 4JZFynqMBuKQNnFTUbTSyyFn36t7OyF3w4/tuGjro5CzNwTlXwNRxR3a5q0qQF5cUcIY
 Qk/5MAKc18AtcShxtGNiMW5Jf57wNPdqMYKcBuN3t9G3AiuNpO+JMpCEmLRKLMKNlOZg
 BZXA==
X-Gm-Message-State: ABUngvdI+50lukk0i1atq6QoCcM0VtmS/UsYBczYC2lf0I9pCidCBNqdloTL+u6f3S1VtGA4rjiMpJjipSck9rut
X-Received: by 10.13.212.198 with SMTP id w189mr3999498ywd.180.1477593139005; 
 Thu, 27 Oct 2016 11:32:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.56.210 with HTTP; Thu, 27 Oct 2016 11:32:18 -0700 (PDT)
From: Maxim Sloyko <maxims@google.com>
Date: Thu, 27 Oct 2016 11:32:18 -0700
Message-ID: <CAFR_W8pqYspY7kFmm_Re-3Rr5ZuFhkjCu0QRFGM-+rDh0HCxQA@mail.gmail.com>
Subject: U-Boot network driver
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a114fd9cc2ccb68053fdcf65f
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
X-List-Received-Date: Thu, 27 Oct 2016 18:32:22 -0000

--001a114fd9cc2ccb68053fdcf65f
Content-Type: text/plain; charset=UTF-8

Hi all,

Which networking driver are we committed to for U-Boot, is it aspeednic or
ftgmac100?

Thanks.

-- 
*M*axim *S*loyko

--001a114fd9cc2ccb68053fdcf65f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>Which networking driver are we =
committed to for U-Boot, is it aspeednic or ftgmac100?</div><div><br></div>=
<div>Thanks.<br clear=3D"all"><div><br></div>-- <br><div class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature"><div><b>M</b>axim <b>S</b>loyko<=
/div></div>
</div></div>

--001a114fd9cc2ccb68053fdcf65f--
