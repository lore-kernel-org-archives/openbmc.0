Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x242.google.com (mail-yw0-x242.google.com
 [IPv6:2607:f8b0:4002:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wh0Jk51nxzDqKp
 for <openbmc@lists.ozlabs.org>; Mon,  5 Jun 2017 13:13:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Zcu0toV4"; 
 dkim-atps=neutral
Received: by mail-yw0-x242.google.com with SMTP id p144so7454299ywp.2
 for <openbmc@lists.ozlabs.org>; Sun, 04 Jun 2017 20:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=R5ShNmSdsWqRM+e/9AetawNUjLg51KA3czLuAPBTjLo=;
 b=Zcu0toV4idFxB8sVepKJziiJQtYrbAcOhZfyISgD0TuWk6NFvZX+E20xrwCj1HKxqO
 jHqSHh6jfsyE1sHGGn85QFyJzgpzUpEfLlwt9DIZV2tHde48me7LQZvspF8NzEmpirXI
 kOaAyCxk51QTO3b26Rcer70ggzBsnCTVQHThWZ9AtquWI5Vw5Ids4dWutKHilDAMm2mz
 Fwpu2FH1A2mm2z87gNNACg2HbiPh4qeY8XucE9tUWZQSk1Eb5r1CuHkSx160177ONhbx
 R5oe2bk3xv26LLOzQLRLM5sPm1Fp7hfW7sx3595KArChmpHvLkvackfNPpQhSskGSRfY
 o/nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=R5ShNmSdsWqRM+e/9AetawNUjLg51KA3czLuAPBTjLo=;
 b=g1hwKWGzz2HIZ9TDEmf2CimMzmYeESvWWaj9sDBamnpv43hs8CGHgzDKbosJq3W4X6
 V3G0jnex8rLqU1qYslrcPf+ktu5xyger2bhiXUEKwZPn3Wnl9OKGGmuEdIPxuEdFeT5H
 LU+IHqVzTMgbynGUlRWRKpRNt9YmmH4gg3oI5FLc9QdpWfCx2goZ2geXPHwAtKBUw1gO
 S0ZqGthyFoQL4FDGAtjgQyFvqA2nYmGO3Go4DoF1V69tj0fz0cDTxTl2RGvgjwnWrtfk
 mh7LLfFHpiCzorGlY0kwnayskOPYGsBwcuHlao6zcus0SV4SE7ZNzq8yh4K3770vm3CI
 x/DA==
X-Gm-Message-State: AODbwcBhdd+/kMnrXzQgBQYvqW6+Q9E/16xrDyFnkY1OszvCqwLzzqHo
 EqL1L9sRcjZXeSfsYmTOhGS+BDBoOQ==
X-Received: by 10.129.46.4 with SMTP id u4mr5329024ywu.219.1496632420243; Sun,
 04 Jun 2017 20:13:40 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.183.7 with HTTP; Sun, 4 Jun 2017 20:13:19 -0700 (PDT)
In-Reply-To: <20170602082844.7370-1-andrew@aj.id.au>
References: <20170602082844.7370-1-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 5 Jun 2017 12:43:19 +0930
X-Google-Sender-Auth: 7UJGlP9dgu2S5RHQVIPT9ogNl60
Message-ID: <CACPK8XefiTwucmgEsRxozCH4M+g4yrCC_EtsbRwD3hKNuETMLw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 0/3] aspeed-g4: Enable mbox and lpc devices
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Adriana Kobylak <anoo@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 05 Jun 2017 03:13:43 -0000

On Fri, Jun 2, 2017 at 5:58 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Hello,
>
> This series is a small piece of enablement work for mboxd on P8, as requested
> by Adriana. The first patch is a cherry-pick of the upstream equivalent, which
> appeared to have been missed in the pinctrl chaos.
>
> The remaining two patches simply copy the g5 LPC nodes into the g4, switch the
> compatible strings, then enable the nodes (and reserve a small amount of
> memory).
>

Thanks, applied to dev-4.10.

Cheers,

Joel
