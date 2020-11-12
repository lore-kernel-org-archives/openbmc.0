Return-Path: <SRS0=mMtm=ES=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A677C2D0A3
	for <openbmc@archiver.kernel.org>; Thu, 12 Nov 2020 12:17:05 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15A7B20872
	for <openbmc@archiver.kernel.org>; Thu, 12 Nov 2020 12:17:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j2jqccP1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15A7B20872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CX0vw6dPJzDqGC
	for <openbmc@archiver.kernel.org>; Thu, 12 Nov 2020 23:17:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::92a;
 helo=mail-ua1-x92a.google.com; envelope-from=deepak.kodihalli.83@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=j2jqccP1; dkim-atps=neutral
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com
 [IPv6:2607:f8b0:4864:20::92a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CX0mX0RRVzDqwy
 for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2020 23:10:35 +1100 (AEDT)
Received: by mail-ua1-x92a.google.com with SMTP id t15so1783707ual.6
 for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2020 04:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rrw39jt9S4QbfKShGUlnilbzrWw5616yGWdUruxlbok=;
 b=j2jqccP1W7bTpHyNcHgS5UDt1qaM5YAErzWCxxCUuHM2jsbMrsywH8Rl/oQUAJ62VR
 OcRvEQK9+bGOwYqfkLLiuz2HjHb9WXfmBlPTZJtwKvyzZ0fjrAypxRoZMubaeRR07c6l
 ZaPkOhR6fAmAZKOJP5GppCX6yHRHzwMmeP8Gaen+Ufgkonkv8A4pnV0ZmOTL6gIWnyto
 eHxqaufIqD8W1Ag3+aW1ffadjcH0FjRe9XIb8bHO7Y9LU83uBLzjYEdp2tN94fPV1kv6
 IaIzQYswIuRoMNmnL7RgGMbtVjf9jikXgFTi0iY7wejZrYcw+V34J5l3SmZM98FDQEnk
 H8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rrw39jt9S4QbfKShGUlnilbzrWw5616yGWdUruxlbok=;
 b=gQ1AfdeJZy9JtTecAg0WgCgmDXbM8N6SLGhKLu3VPnATOzsmPH3bMyx63uTKhZBHH8
 fLQlt5e4yIhy+2RuHO+vGi9QPkW+sPtBbs2XQfADRX7dYVs0aEjg3vyuA4CaLjNktqoZ
 jc+6zywepBNLl3FEhWl0unuCkOM0K0v6abi45GwyDZL6kbPXOZJQ7aJIv2Ymv9kqkxkV
 UMYwWdiNK3ZD6bDXyn/sqm+UMCpPVFKGIU3Q+ajSUOqT0GKmAW5Hi4avSJGJMNII5fOD
 VF/0SQMvNvJwzQdexEKTGLwTRmxFmu59g1Bqt0ODUd4lnWWhE0/MQjtf4UqxHhiyPYd2
 cBfw==
X-Gm-Message-State: AOAM532twDUuVF+n/s/BX9X2mAf78KKK9/4uYl3cWD/P1FFHmf7Vxgtf
 C0piGh0dxuhfyNH7OMsRTGYvg5h1rwFFfuUD7hE=
X-Google-Smtp-Source: ABdhPJyUJ98HNACA1Q9j5atQXvhMty/y8aJcnw71JQ554P+GtERiuKg6lQ38PEqe2C+DlNcu0qhfTOLVDSnjQlq3tp8=
X-Received: by 2002:ab0:654a:: with SMTP id x10mr16289177uap.78.1605183031383; 
 Thu, 12 Nov 2020 04:10:31 -0800 (PST)
MIME-Version: 1.0
References: <OF51173777.BBAB38E9-ON0025861E.0014BEED-0025861E.0020A56A@notes.na.collabserv.com>
In-Reply-To: <OF51173777.BBAB38E9-ON0025861E.0014BEED-0025861E.0020A56A@notes.na.collabserv.com>
From: Deepak Kodihalli <deepak.kodihalli.83@gmail.com>
Date: Thu, 12 Nov 2020 17:40:20 +0530
Message-ID: <CAM=TmwVX50x5zJk5gWCcGZhabYx_XhQEmZH_-KUkMHzBhwasHA@mail.gmail.com>
Subject: Re: support NVMe drive health monitoring
To: Jet Li <Jet.Li@ibm.com>, richard.marian.thomaiyar@linux.intel.com, 
 sumanth.bhat@intel.com
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
Cc: andrew@aj.id.au, openbmc@lists.ozlabs.org, ed@tanous.net,
 rashmi.r.v@linux.intel.com
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Hi,

> 8. Intel have forked libmctp (intel-bmc/libmctp) and implemented a further two bindings
>     a. SMBus (DSP0237)
>     b. PCIe VDM (DSP0238)
> 9. Both the SMBus and PCIe VDM binding implementations in intel-bmc/libmctp require kernel patches that only exist in Intel's OpenBMC tree

On a different subject, is there a plan to submit this code to
upstream OpenBMC libmctp and kernel?

Thanks,
Deepak
