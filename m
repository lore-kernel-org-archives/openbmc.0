Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::12f; helo=mail-it1-x12f.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="CbaBfPCa"; 
 dkim-atps=neutral
Received: from mail-it1-x12f.google.com (mail-it1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43Lcr642hXzDr7s
 for <openbmc@lists.ozlabs.org>; Fri, 21 Dec 2018 16:39:02 +1100 (AEDT)
Received: by mail-it1-x12f.google.com with SMTP id c9so5076374itj.1
 for <openbmc@lists.ozlabs.org>; Thu, 20 Dec 2018 21:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bV+Z3Pgd//51S7yGwJvAAUD+zBgGW+Iml3uIMo/NhCs=;
 b=CbaBfPCasg+L/Afmvarvf+X1zMoMx3vuIQzRyS44UceTJrobuZzkAVB+eWvB0Tlr8g
 6J+AMdLwoQll3lwpXBitifVyqa0H+ozZ0MhOF6tKE3F+6ATG6PpOGBEzhbjqMeqZu57Y
 /Q71mKWuynG7kA1jLsO1t6RLTXwmKsesfYiXyeGMKf3t/8ucoYDgs1ljQ0Cnjyhz2xo9
 3FLkU4MWTMEULeFd2vWLUDnbpbhXs1F0r1C3SzLE9qvzE5vZCXxkMQVQYxGW4C6gQWSj
 t6IV/FnDKwssAa6TGQaXAmwbzpmtigojxNd/QF1yMXtdpmgECCcgPrsk3KgUdBn/MMGg
 xJIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bV+Z3Pgd//51S7yGwJvAAUD+zBgGW+Iml3uIMo/NhCs=;
 b=nH10KkMvpRN09AIXg3dYWlHhbbiq5VQM6W1ephcBWjjlLFL2pTJ1kF1bPLcL/UYnJd
 GfeDsIJNKrXhb+MrJ3jzpC+2tt9qhAWerQ5FTujjFPabkSwoaXZlIguLLLoEf39Y+Jmx
 DNzwBwxbiPKYtjClq1XSkLEceoNAIe7E8HYozbKwnYi/882ZxRnRnesJTbk6stW41UyB
 99VHR+gkGqT+5NB6Mv4vdTHGZ61/fh/hGyHrft33UKeERtFsxVvSYlnB4OTIvDQfcDaj
 14sWh4dWdgXMWvzghaPTAVJZbAU8WSkslg2qAsVvsQqLahAJqEHedRqm30dFPdF51bax
 9FoA==
X-Gm-Message-State: AA+aEWYYiVDmgvAarXJ/yYAVfWZXWxP4BLBaCFN2RA92xJo1m6KMuMJU
 36fXj8B6xdVMlIQxA3E2MLGlbOPWTOaP/SczA44=
X-Google-Smtp-Source: AFSGD/VhL2CVIIS2x81g6kJOTJyVA0yQaMN5t3u7o4BJpzNOWwmJt8ob0P+bF0TWH75k2cxlDkK7WqJtoJTEB5rSL4o=
X-Received: by 2002:a24:97c3:: with SMTP id k186mr1220629ite.125.1545370739907; 
 Thu, 20 Dec 2018 21:38:59 -0800 (PST)
MIME-Version: 1.0
References: <CAE33tLHRzGa2_t3AMfAjf4txP7cu=uFBHMuUFAERBkZ9ZoOGCw@mail.gmail.com>
In-Reply-To: <CAE33tLHRzGa2_t3AMfAjf4txP7cu=uFBHMuUFAERBkZ9ZoOGCw@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Fri, 21 Dec 2018 13:38:43 +0800
Message-ID: <CAARXrt=tV3_eaSTotfTLEWkbggaOW-dq3nkE=rUSackwgVWmsA@mail.gmail.com>
Subject: Re: Sensors connected on I2C bus of chipset
To: AKASH G J <akashgj91@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 21 Dec 2018 05:39:03 -0000

On Fri, Dec 21, 2018 at 1:05 PM AKASH G J <akashgj91@gmail.com> wrote:
> I built OpenBMC Linux using Zaius configuration and booted on BMC Aspeed AST-2500. The board we are using have some temperature sensor (TMP75) and voltage sensors (ADM1293) on I2C bus connected to chipset, not to BMC.
>
> How I can monitor the readings using BMC ?
>

Please refer to
https://github.com/openbmc/docs/blob/master/sensor-architecture.md#creating-a-sensor
for how to create a sensor.

Thanks.
