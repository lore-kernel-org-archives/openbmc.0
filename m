Return-Path: <kunyi@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::144; helo=mail-it1-x144.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ZNC2BW7M"; 
 dkim-atps=neutral
Received: from mail-it1-x144.google.com (mail-it1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42bgsG15kpzF1Yv
 for <openbmc@lists.ozlabs.org>; Fri, 19 Oct 2018 07:40:01 +1100 (AEDT)
Received: by mail-it1-x144.google.com with SMTP id 74-v6so1983789itw.1
 for <openbmc@lists.ozlabs.org>; Thu, 18 Oct 2018 13:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aLdsCBf34ru96mZk8IQZFBhwXP47jbHuXKRy0BVgJho=;
 b=ZNC2BW7MKRqNjeFKbPe8jcpDAzCuBMgoG7Ky9Fm4H9B9/KQtSPOd2OBEqh7T8JPc0n
 9FMm526vNx8dgCGCStbcSafYLUqQvm6GzRqJLkSn0K1ZyTxqEHJqRLs+Qs6zHcuKpjOq
 zuG1wmTaCq5GBXFuKCFLH1dK8EfU9Tm9ynS3OEyTSFbBp+GYbK+PCRgEkuIqcCpdksoF
 M9RORa+RFkLW8+/p9gLR6VmfG03ciKndPixxHNEMsOtwQBbEEsPnZoosZk2O2Sel65lK
 dNHMmmHP0GXv2XZpd5HqkLgBnqJbnMlfKZjuBTaELHxzFi2RxBbZAU9M4tEuDvgD/Kb5
 YwuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aLdsCBf34ru96mZk8IQZFBhwXP47jbHuXKRy0BVgJho=;
 b=oneMLf8jvjnTLGpWdv0soyVLDD7wVbl6mZeYcjfkiR6MvSvXyPzlnwBF/Hw4w2aSKt
 RNBLmzDBI4NWVrZnr7yD8OKuF3iYOtBGZONPYfrIGkcEs/UDpA2phn6Xf1CzKHk0CEEo
 mIfakZ4OaZjWQOuZUdqlTC6b41bWc4RZcOAr9IXspsKOs6qaGCJT+K+78fhV5hB/R7iO
 /8Xd5aFUwAWpk/xF719SaGchWMJOnL0VtpMHdC1WROE6GZNqaUKQSvXL3bNizKvatGNH
 5Kg4Wd4uDzCs9sDzDPGgpiU3oy2WVUa+PFGumWlkfdfKeWZA77qyim1jLs6hRxKCpsDT
 /MpA==
X-Gm-Message-State: ABuFfoj4WQRoL/vAa+iu2MDRrtWTHVoc6KgQI2PL+Sd/roq+1g27pSJ7
 yuPZMTAjVf5yKRSosXwYObI4oCmWBIpkweJV26GFUg==
X-Google-Smtp-Source: ACcGV62cgpYtjR0MUSTM6kAO/OUGfH+6Af/a51jeOoZJWqLVz5CLT9VfyeJLw5N6qNSmSCarBgaGza10wyFwP+/2KnI=
X-Received: by 2002:a02:ac89:: with SMTP id x9-v6mr110621jan.119.1539895199582; 
 Thu, 18 Oct 2018 13:39:59 -0700 (PDT)
MIME-Version: 1.0
References: <20181017222710.254994-1-kunyi@google.com>
 <20181018194758.GA21705@bogus>
In-Reply-To: <20181018194758.GA21705@bogus>
From: Kun Yi <kunyi@google.com>
Date: Thu, 18 Oct 2018 13:39:32 -0700
Message-ID: <CAGMNF6UY1dS83h+zSauHqjETWM7rzpc3EmAEwNSCr0HW0J=cAg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] dt-bindings: hwmon: Add adm127x documentation
To: robh@kernel.org
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, jdelvare@suse.com, 
 Guenter Roeck <linux@roeck-us.net>, mark.rutland@arm.com,
 linux-hwmon@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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
X-List-Received-Date: Thu, 18 Oct 2018 20:40:03 -0000

On Thu, Oct 18, 2018 at 12:48 PM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, 17 Oct 2018 15:27:09 -0700, Kun Yi wrote:
> > adm127x are hot-swap controllers that allow a circuit board to be removed from
> > or inserted into a live backplane. This patch adds the device tree
> > bindings documentation.
> >
> > Signed-off-by: Kun Yi <kunyi@google.com>
> > ---
> >  .../devicetree/bindings/hwmon/adm1275.txt     | 25 +++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/adm1275.txt
> >
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks a lot for the Review!


-- 
Regards,
Kun
