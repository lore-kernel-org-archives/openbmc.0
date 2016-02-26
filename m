Return-Path: <cyrilbur@gmail.com>
Received: from mail-pa0-x242.google.com (mail-pa0-x242.google.com
 [IPv6:2607:f8b0:400e:c03::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A90441A04B8
 for <openbmc@lists.ozlabs.org>; Fri, 26 Feb 2016 16:36:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=ouaJdDzh; 
 dkim-atps=neutral
Received: by mail-pa0-x242.google.com with SMTP id a7so2616488pax.3
 for <openbmc@lists.ozlabs.org>; Thu, 25 Feb 2016 21:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding;
 bh=gwFpxjbgj51G+SmTyaDlS8jR3yIm1E+sgEfW4nMkj/M=;
 b=ouaJdDzh9Ct28Km5lafrG4Zq/9G36b90grBIaQxkRdc8Tf56iO41jO8BkoL6kkAwU+
 0gv/Yol0Y1R6V9ttLHVuoRTjs0AZZEQ8IxCzUV6MFD+NEeggHN4XrRDPJ7qrPqkKkL2i
 AjVqqH+3//9ytMcF5Iuc0F+yVdKH130nQW1HceIfSPVhbVe5xudw7CMh9GXQ9Y36c0zP
 MLZK5LHHH+JmF0Tjn1dQOBvLkFbjnRPFI53Vq0kD0llyLZmFESE8DyXUobeRdbuvXFkE
 UJycS5Zt9ptGsS/ySqUlZu4czc9DktIt+upy5uYfS/6DX8TqXM0j1JpDQN/I1MF5IdSk
 L6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-type:content-transfer-encoding;
 bh=gwFpxjbgj51G+SmTyaDlS8jR3yIm1E+sgEfW4nMkj/M=;
 b=LuUOV5y0PFObZt9sqvLR4Ld1V7vMYnjhQdnp8T0EigM/KpFoM//wMPCWGFMDcWnV+D
 UcdhlC943UzvzAxARvJaAMKqwxxtwbLkVlWAL7RvfQ3PwhSx7vf3mlIcDSpoBLXqQsDC
 /OfNycSRmTFZUTRxI4Z0T6sGRd0SEGUQKEZhW33CupGiJDp0y4OreLuKQIo3+/azA3NA
 3rUSe+VRW+7tuBIK0t8jPfUMRCrF/bsh7Bn/v8GjPpSmZs/hMsV+DyXdUONhgNisQhrM
 JWt4G2oG1HfTckpIlwangs2Z/4EyHqdMVjp8aKRPaPcKCIyLFGDn6Ycquqo7rM5uFSXe
 2IIA==
X-Gm-Message-State: AG10YORpiPuvZt93o5vUvGhPL632MNsEOPkheNTY0lAOwiy7cvW/Q1UfXpzyxcINnq09fw==
X-Received: by 10.66.222.101 with SMTP id ql5mr68982375pac.144.1456464980195; 
 Thu, 25 Feb 2016 21:36:20 -0800 (PST)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id o184sm15966640pfo.36.2016.02.25.21.36.18
 (version=TLSv1/SSLv3 cipher=OTHER);
 Thu, 25 Feb 2016 21:36:20 -0800 (PST)
Date: Fri, 26 Feb 2016 16:36:12 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH linux] net/ncsi: Fix possible deadlock caught with lockdep
Message-ID: <20160226163612.4491a525@camb691>
In-Reply-To: <CACPK8Xf2LmYJ+bjd3EY-RRm_VW4mOXhTAYC_aMuf-nnPHQNuog@mail.gmail.com>
References: <1456370426-11311-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1456370426-11311-2-git-send-email-openbmc-patches@stwcx.xyz>
 <CACPK8Xf2LmYJ+bjd3EY-RRm_VW4mOXhTAYC_aMuf-nnPHQNuog@mail.gmail.com>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.29; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Fri, 26 Feb 2016 05:36:23 -0000

On Thu, 25 Feb 2016 14:01:28 +1030
Joel Stanley <joel@jms.id.au> wrote:

> On Thu, Feb 25, 2016 at 1:50 PM, OpenBMC Patches
> <openbmc-patches@stwcx.xyz> wrote:
> > From: Cyril Bur <cyrilbur@gmail.com>
> >  
> 
> Can we have a commit message describing why, and how?
> 

Sure.

In completely unrelated news is there a way we can fix that pressing reply to
all doesn't send any notification to the author of the patch...

> Cheers,
> 
> Joel
