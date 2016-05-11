Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r4PgY3gxSzDqCK
 for <openbmc@lists.ozlabs.org>; Wed, 11 May 2016 15:24:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=FVv0wqGs; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=Mt9wnu5F; 
 dkim-atps=neutral
Received: by mail-oi0-x241.google.com with SMTP id d139so5121431oig.1
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2016 22:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=5y6zpQv2AAnFlFlydUpxS6D9EN63tiFdUfdxxgdCSZ8=;
 b=FVv0wqGs3Mz0cBENadjd0E2/YqkLFq35svZf4E+iyi304rPP1EEDpKzfaxGyxTCiY6
 kz7IgJxyaI+aOBYCOC8zKJ3iK2TgLwayGXch4wVgcWwBw8aPrD/6KLKJp0E8vmLJ11FF
 noIxioeYdmQ/iEZ9LAbpgRWBgalzNZSM3QPerqU/IzlM+RX8HonL0omzHb0/nLe1G3Kb
 tp/Y77TmjkzArRxgdLkeDlwpRaWtC+ttdcqIIw0ISi2wsRpqDiT/o1j3JuMUa6LGgQNs
 GhdNwVGc2fyaGjnxgLJ1C++nnhN5E55VpoWoH/rtHLlSWe0NFURsTXArx1WMzynxy13E
 TX+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=5y6zpQv2AAnFlFlydUpxS6D9EN63tiFdUfdxxgdCSZ8=;
 b=Mt9wnu5FEt6UINgDwFuiI1TQ/YLIsfqK2rt0NLmZnB4+AqJlJX3/GBJoPLNl0cayvG
 xnww+mc+6+WJ/WFl9/7EMUT6XYhidcon1yiCEK7VKSrdgEH1JsthyqTzpsBVSwXaz5wb
 x8mKDO/8tW3MnBRj7XuCDJMbwF4fQw05YChFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=5y6zpQv2AAnFlFlydUpxS6D9EN63tiFdUfdxxgdCSZ8=;
 b=VOz9RNd8zRMFyJXEvFKjzGuV0+unY1CuzCQcdfy2dcW3A67sT0DqZXuPKqDwZoA91y
 HyYqy7qNxsn0bNL0dL6AZmUO+xYCAOO2+nXBCqEPkyOGUNOcdwQBS7xUbwsYpHzfeOPl
 LAtFaHILeXM+DhFkpp/yAGajG7mNPm2Ks+/7nNY/C6AGxX3kJEOjI2YCkl/VssX9bUJw
 uvz64fnxotOnEt1xJpuPdzxOnL01g5V0J+MJV3RTGcksnZvyG1bxZVy4gA7ZeDwEtsHd
 QeAuj3e9w0fh3vQAXIwezL2vfI9mbxNboz/4P2BeEtkLqfgov67Q4yPnaUu2QSSA2RuY
 eVKQ==
X-Gm-Message-State: AOPr4FV/sAwLGMtIl67ffbpedIGxfjX/v7dKUA/CpiNoL1u5upj70BZPsrjjv/f2GEV3iH7h1A0wqkf6UkfpKw==
X-Received: by 10.202.230.137 with SMTP id d131mr792307oih.168.1462944263219; 
 Tue, 10 May 2016 22:24:23 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.3.102 with HTTP; Tue, 10 May 2016 22:24:03 -0700 (PDT)
In-Reply-To: <1462939860-27192-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1462939860-27192-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1462939860-27192-2-git-send-email-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 11 May 2016 14:54:03 +0930
X-Google-Sender-Auth: fNGVHWUdLMh1JTkmsc6J6J0pzso
Message-ID: <CACPK8XcurT0aRWQefw1hwy347DS0VhGgjHqZjBcjNHLzBDGMbA@mail.gmail.com>
Subject: Re: [PATCH linux] [hwmon pmbus]: Enable adm1278 VOUT sampling
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 11 May 2016 05:24:26 -0000

Hello Yi,

On Wed, May 11, 2016 at 1:41 PM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Yi Li <adamliyi@msn.com>
>
> The reset value of ADM1278 PMON_CONFIG register does not enable VOUT sampling.
> This patch enables VOUT sampling in ADM1278 PMON_CONFIG register.
>
> The patch fixes issue: https://github.com/openbmc/linux/issues/71.

This looks good. Great work!

I've applied it to the the dev-4.4 branch
https://github.com/openbmc/linux/commit/5911270d537dc6c2becc7ec414aa963504e94232

Cheers,

Joel

> Signed-off-by: Yi Li <adamliyi@msn.com>
> ---
>  drivers/hwmon/pmbus/adm1275.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
