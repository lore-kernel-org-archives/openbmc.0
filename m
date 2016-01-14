Return-Path: <dja@axtens.net>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E10581A009A
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jan 2016 09:34:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b=kf7khjud; 
 dkim-atps=neutral
Received: by mail-pf0-x241.google.com with SMTP id 65so7819765pff.2
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jan 2016 14:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:subject:in-reply-to:references:user-agent:date:message-id
 :mime-version:content-type;
 bh=kML1BWRZAhyCU2qs+W4pZto0Ota1OC56b4rC9ni1wvI=;
 b=kf7khjudS9Cd3+qMo/YBZigVJcRNyuBwK1SQbxHLtpMR4PKGhCl4CwxDxVWPlaWsNl
 RyABWRmmn0V8uqUbo5m4dW3D6+Fuvmtm/3cJYbotOkUCMobHUQSqS3a/XCIuH/ML64gQ
 gDerLiAXR4twYI6oT3i8qUTbPeI2H666movfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:subject:in-reply-to:references
 :user-agent:date:message-id:mime-version:content-type;
 bh=kML1BWRZAhyCU2qs+W4pZto0Ota1OC56b4rC9ni1wvI=;
 b=VlwFGEQK2jXo+MfrO7pml7aA1Yd06OtguSYOmCJTmjO8PaYEKNLtwkOvyoENE2dejB
 y0j5ayMrpwSr3uhU2mOKMEij4Unj1OHJcAJstdH1o3jUrZ2qwd1LAeIiAAuZs9sceTIh
 CmiZksAquHsp19LQVO/2BWQRIwiJ1Q4o7Ghg3mgsQNWs9lvH1JizZ2uoBMGY7GiLnVkI
 NYluhN02nt9GrtL4W9EeofbHOyx0nf3tKFtQ8wVozednQqTvMZjQ/EnfPqKhuc75s8nU
 mvoven1D6MqEivfqEElGNLKPFcfJbsvYsBa0eFrLi7pQUMF9u5Bl0xskPVfCT6Ihri+p
 t0XQ==
X-Gm-Message-State: ALoCoQmycZxP89h19sMywYvi/CAHEpYvKgN31naZfbubXMJ2CRCwt0tH+PKD3+F9ALQyS2fafbL79Ni3TEFbjUT4sbEXtxfniw==
X-Received: by 10.98.89.73 with SMTP id n70mr9923522pfb.68.1452810864816;
 Thu, 14 Jan 2016 14:34:24 -0800 (PST)
Received: from localhost ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id m87sm11483866pfi.47.2016.01.14.14.34.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 14 Jan 2016 14:34:24 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH docs] Add doc for contribution guidelines
In-Reply-To: <1452762609-724-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1452762609-724-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1452762609-724-2-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-pc-linux-gnu)
Date: Fri, 15 Jan 2016 09:34:20 +1100
Message-ID: <87y4br4wpf.fsf@gamma.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
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
X-List-Received-Date: Thu, 14 Jan 2016 22:34:27 -0000

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:

> From: Jeremy Kerr <jk@ozlabs.org>
>
> Start somewhere to document our development conventions.

This indeed looks like an excellent start! :)

> +  - Opening braces on the end of a line, except for functions

Huh, I had forgotten that... Good to be reminded!

Regards,
Daniel Axtens
