Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x234.google.com (mail-yw0-x234.google.com
 [IPv6:2607:f8b0:4002:c05::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wyn1D2vgCzDr4J
 for <openbmc@lists.ozlabs.org>; Thu, 29 Jun 2017 14:36:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Dm+z933L"; 
 dkim-atps=neutral
Received: by mail-yw0-x234.google.com with SMTP id l21so23916019ywb.1
 for <openbmc@lists.ozlabs.org>; Wed, 28 Jun 2017 21:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:from:date:message-id:subject:to:cc;
 bh=GCbrCagFnVheGTQ8tEL/ubYzvQxGDJ5ejf4xpKbv/n8=;
 b=Dm+z933LUQWL+9UhD7thOUwNN775PxUKtvRj8Sky5p5lXJiHH3lMNJOfHeaEO57Z3f
 iiSG2iljU1DuqdSRWTYBMIvUcbc2Q7A6T1JIG+m1Ge6z9RAFr3l4vb6QWn2iVg/gutaC
 4NXJmaG6fN2jIFv7BLsAbP38B/QUQqLFBKSv6rS9Wh2YhWPfnZlCMOfkSyMgkelbMctE
 zCY1jeS3FoJO1mbuS7+topuYr256k84MLQWMYKMa54tyGBhEFAhuTLAZLUDAGIRARfQx
 tQmXH3LxRWV9vut0rmojGjlokUKaguPlzSN0ACOrStsdmS7X/U3/Fa/SSY++rQ7K3IvW
 0M0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
 :to:cc;
 bh=GCbrCagFnVheGTQ8tEL/ubYzvQxGDJ5ejf4xpKbv/n8=;
 b=l40PwfNdcNcfST/fKiUpTvUphiJxDVPrVDTh0/uuiVbqQn7EcQcFXC/2VY0Tl+10j6
 D7ufkFhAKpnkcvJst3Vq7DjLf6RrsFal+n28LPoYyd6eO/Z89zbCS5y1mbg4n+nfgfui
 aC5M8yV9BLLPaN/M1CDo5SURKLOnJORie8E82Nv/X0Zdpe4ErUqT1vcMrq84Kw7wrO6s
 QoRlwyTLNY+KLSssbYxUYOCxJ21IOdL2l8tdmTYCJiG/9UGw50XY9wdx+jgufZI0v8uW
 OH5f/sO9h1jr8jleXPtdrkd5EnXn2rpDwM38L5I4gHDH8adS7HJLr08lGeAesd9yZr0D
 SIiQ==
X-Gm-Message-State: AKS2vOzhPQeAb5ilVmG/CeXXpx5Bct5I4SLD3Z0keuly/wdHCZupRML/
 0Dc4n476B7yPef6aqcI3O4hOPzWfSA==
X-Received: by 10.13.225.5 with SMTP id k5mr10109565ywe.178.1498710990318;
 Wed, 28 Jun 2017 21:36:30 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.177.8 with HTTP; Wed, 28 Jun 2017 21:36:09 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 29 Jun 2017 14:06:09 +0930
X-Google-Sender-Auth: jBWATYG5uGtfwgwry9qzd7vXeho
Message-ID: <CACPK8XfEoxHnj9-UOvSMXwuE=YoXQp21NeT7EsxHk4miNLz-zw@mail.gmail.com>
Subject: Setting timeriomem rng quality
To: Rick Altherr <raltherr@google.com>
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
X-List-Received-Date: Thu, 29 Jun 2017 04:36:33 -0000

Hi Rick,

I saw your patch to allow the device tree to set the timeriomem rng
quality. I was wondering what value that should be set to for the
Aspeed SoCs?

Cheers,

Joel
