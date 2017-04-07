Return-Path: <raltherr@google.com>
Received: from mail-wm0-x232.google.com (mail-wm0-x232.google.com
 [IPv6:2a00:1450:400c:c09::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w03ww0bvPzDqHl
 for <openbmc@lists.ozlabs.org>; Sat,  8 Apr 2017 01:51:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="fCl+3N14"; 
 dkim-atps=neutral
Received: by mail-wm0-x232.google.com with SMTP id w64so1891426wma.0
 for <openbmc@lists.ozlabs.org>; Fri, 07 Apr 2017 08:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=SaBNjHrtntCdfHpGBuU51ALT/DCEN7y4Op2be0WQnig=;
 b=fCl+3N14PgeVty17/4iFuWmBVU/a/Y0Rl/GZyeGUAStMPwCl4+ImrPZeMX00N8W0VD
 ibsY1pve/hKTlCdDti0Y3y7LH18IoV6GtbmeFaIIkaHUeJDsFdNAoqXS+fhLQEZh7KhP
 Wn/u+XlaFKcZu2f7jDYQAbZwvV6y48wH22iMIWuCduUylViLq7cW1bVD0b5PF8xKKehG
 G4XUJ36cl91trPceXINmhXUvkTDT03ytzsrjjhAyrcgZF2a5CrnB63WZgI0brZ/miA+2
 vpanJTnz2FJSqGBZ/nTPm8R5r/YpZ9GY1qrG5KyLNzSEleZbIubXA8ST0NItKKtOLql6
 bCgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=SaBNjHrtntCdfHpGBuU51ALT/DCEN7y4Op2be0WQnig=;
 b=UkMRFBK90jx5Cn84pOQtVYPZfTWK2Bfpm1VtdpFyWfo/ZCM9PxsaUGRMDv1WWhecl5
 HsiO8H3Llhou/aIlDmOt/RAGv4mtB63sSjuB7f01YL33H6VONfvn8CG5+Bwj3yUpE0Eb
 716FII5hRXMW6QbIrjfzKrTXzk7M8EnEwvrhC4DjZQeVdkEWJnH9SKCNjZiyMejsRLn/
 EypsuF5VIv6m79zGmvmXwijDZK4mdlO8NyaeEulwy9x289c3iSZ2unznAZ7fSTt6B3Yn
 HYhLdSBzcXUPxj0oYhxa1pZyWaKC8VXQzBwF03V7UmyYEsom1fyxi+o3O/o83qwFrsh2
 4GFg==
X-Gm-Message-State: AN3rC/4H+59vIgZMWJPnS8dbnkcGRXhK66+O+Kh2wN9rnsYvKeqbcuvo
 YA3PLbK62Ye0glXpumX7/EYMY0zN/mvw
X-Received: by 10.28.45.212 with SMTP id t203mr29510wmt.37.1491580316697; Fri,
 07 Apr 2017 08:51:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.169.8 with HTTP; Fri, 7 Apr 2017 08:51:56 -0700 (PDT)
In-Reply-To: <CACPK8XfnZN6j85b+YfNMvh4RkiT3mtMxw5GHX5Javo4-ZBXbuQ@mail.gmail.com>
References: <CACPK8XfnZN6j85b+YfNMvh4RkiT3mtMxw5GHX5Javo4-ZBXbuQ@mail.gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Fri, 7 Apr 2017 08:51:56 -0700
Message-ID: <CAPLgG==Z9O2AQvx8vAok0vJg_A_2T+jAGFTwP1ZOG9yBa1xnxQ@mail.gmail.com>
Subject: Re: Aspeed for-next pushed for 4.12
To: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Fri, 07 Apr 2017 15:52:00 -0000

Changes look good.  Regarding AHB reset for the ADC to work, I also
see that 1e6e2004 has a bit to hold the ADC in reset.  I didn't do
anything in the ADC driver to take it out of reset.  Do we do that in
aspeed_init_early as well?

On Fri, Apr 7, 2017 at 3:28 AM, Joel Stanley <joel@jms.id.au> wrote:
> Here's a merge of the changes I will be sending to the arm maintainers for
> inclusion in 4.12.
>
> https://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git/log/?h=for-next
>
> I've done plenty of testing of this merged into linux-next. Feel free to
> take a look and/or use it in your testing.
>
> If you're booting this kernel from a cold power on, note that the ADC driver
> won't work without resetting the AHB bridge:
>
> devmem 0x1e6e200c 32 0x2
>
> On the dev- kernels we have a reset in the aspeed_init_early code path. We
> need to work out why that's the case, and add it to upstream if it's
> required.
>
> Cheers,
>
> Joel
