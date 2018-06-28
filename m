Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::243; helo=mail-qk0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HNM/7cHC"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="Pzyx58dr"; 
 dkim-atps=neutral
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41GRDL3Q9GzF1Mm;
 Thu, 28 Jun 2018 14:11:30 +1000 (AEST)
Received: by mail-qk0-x243.google.com with SMTP id u62-v6so2278962qkf.9;
 Wed, 27 Jun 2018 21:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=pwmu5VbTU7r9MRIb5co9ELs3eI4XSGhnCbOvZl/zLIU=;
 b=HNM/7cHC5j6iGDR+p7p2o1FL7FCN+ZaCCeF5BY/5SjwO7xw1nBi9cZrvGnZMT0zel/
 IMw2APtQGEtC1Nbh8VM+TZsTXEWz9JK9cRX7CpVAzUY2fhMSm9/+adyJJRnueTsemm36
 DIlTAgrbPs9n5YIUDhtedktuPNr05eeC8s+lvA7He3aNcPF0A3kS0e7UGKzmlXUbLWYg
 x6kP8smAGxMfvLqtKgNDjPv2dF3BLOkgXz/+7oRTvspMxcvLdfrUNCarQzSH80unwCfp
 HpaKcheLBao3hwg+w5D6RT8i1I00KjWGOjiRVZJXAK6ot/h+Do2oLKisDHl6wNnuyAL5
 Pf6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=pwmu5VbTU7r9MRIb5co9ELs3eI4XSGhnCbOvZl/zLIU=;
 b=Pzyx58dr+ZowZBBWSNCuuvHzFM0TtgOTOBNywkG2hmwTwB1wvk4wjjPNSo5lVEUkPi
 mJRQ+yRiH9dBkvd4jaRN3ZaOKaKYUi8U/gK8xF4FgYNSGgMhYe2xY5gQxNWUaZRaLJxo
 zJl75ZDvQVyQ7UCSoFNs1NxctLjsDpPgYN0VA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=pwmu5VbTU7r9MRIb5co9ELs3eI4XSGhnCbOvZl/zLIU=;
 b=I2TCseIPJAwO+wMGAbFK3n8u/YmhLoj87GJCQAitUnwAkj8arOLAKZ7JtUfYvOBWjQ
 2Toz7cVWwV9h4NOyh0X3Vp3pBLhmPx/FqdskcBgTaPTcA/0fs4YObACHBzb1Jfal1SS0
 SaS2coa6qGDyrspdF1llXamcoOSkpEv7kZesmSLDFhIw5MguhJGcx0ijJX5HdV0d/Tv2
 Rb2SZYQnVZz8khhsfX3ajXHY5fDQdYln4mQko7ZHQUYaTxEIgIkI6tk3pZtetiQFBpIg
 CEmq6peu96lvAx3+1iXYKIe8zcANDMB4eun5F64ECMGNIzNjr7BY6YJQv/PoNd4D/eIG
 AVGw==
X-Gm-Message-State: APt69E2E44sXiISUnxnH2kT5Q29D/fmjCoJdDKVOVyLQo12VsAt3B59z
 nE4Ligy6/TB67x4lFT4nQ8chA+pEMuwlHUr0HL0=
X-Google-Smtp-Source: AAOMgpca7EzNjrGe7cRgmQeqGGzu2KfHWlzUay/a8/68TiVbHK2G/+f+/Aawp/o5sv+AcDUg9CtoogYeqlnw7NjMko0=
X-Received: by 2002:a37:6983:: with SMTP id
 e125-v6mr7367376qkc.352.1530159088126; 
 Wed, 27 Jun 2018 21:11:28 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 2002:ac8:169d:0:0:0:0:0 with HTTP; Wed, 27 Jun 2018 21:11:07
 -0700 (PDT)
In-Reply-To: <20180626232605.13420-6-benh@kernel.crashing.org>
References: <20180626232605.13420-1-benh@kernel.crashing.org>
 <20180626232605.13420-6-benh@kernel.crashing.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 28 Jun 2018 13:41:07 +0930
X-Google-Sender-Auth: jbj58KcwQ1MLeR3iuI8AzeHK0T8
Message-ID: <CACPK8Xdm4QGq4eRR9RMhYLFeD9yGUbDkB-3=J_tOcsfOj=TiZg@mail.gmail.com>
Subject: Re: [PATCH 05/14] fsi: master-gpio: Add support for link_config
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linux-aspeed@lists.ozlabs.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 devicetree <devicetree@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Jun 2018 04:11:30 -0000

On 27 June 2018 at 08:55, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> To configure the send and echo delays
>
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
