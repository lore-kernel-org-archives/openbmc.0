Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vPkF11ZZ2zDq5x
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 17:50:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="unnh8ROv"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id q71so2724765ywg.3
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 22:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=jaFzmS5pSNwdywIpAVAoo99hIDn0hKx7D3xuOgRlKU0=;
 b=unnh8ROvs5oQFBCl+YICPcK8kMWxbZ4vjYTcbpWJCeiSp/WMLdKsDTAkkYTPvDLrVV
 YbqI1jER0TfLhGZCnJi4wbOdmUT1ZduqcfXUfQiLMaYlkKo6gU+ybxR++coXqd66L4qM
 LjXfd7cbJRPh6Ezt+zjWdbUnUTvSxQzizURK2m75aEPZz4Z3YFdPrHaRLKusCjvc/seI
 MCtaKdJHK6Js3ycEUtF4eZTSgziK2p1yY+K8taJ/iQ6aEtgc/dqUO22DyrOfuc18H57s
 heAhnFxir21PE5y+2Q73J0y/dFMiAK4/pUZ7+wUCbdA2rysnvYj7hRINGfKFGkpbDcIK
 eEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=jaFzmS5pSNwdywIpAVAoo99hIDn0hKx7D3xuOgRlKU0=;
 b=D/RQotBlE104p/DTisfY64iFGAUmWCP0CwSPvRw0+oepzW2hVdjB9KyvA98DJcapPJ
 DcIUBYKTDn3WAMVwDEZ/1SqZeegkrr3qzhPDNCA/OlB1/b5Zh3b6XymfkoWjKxh72pso
 egEN3fo5hzQ31UEFxNUmUhFd4pGIvW0igU40PeZq4pyWpX1Llqb1IxLWnpWFgzxjdvz3
 2fjn6E0eeEP8rAGaxmbrqx3r8GU305taUndHGIOKbT9jSSn3RfPWE1UVr33C7UhD5okq
 mu4R2PgW09oouaG9lSSsggC1MPp0+nx12kahBjRGEfXxL0GuNsvgkeCSYSBihwdqHY/+
 z22A==
X-Gm-Message-State: AMke39nyiDKTDvwUF88uesPNJdLJ2NgiT6Fehxci5+cYU5snRNPHxhGwF1RAODAhcYyZ/DkOyYOcVrsNOU3n+g==
X-Received: by 10.129.91.194 with SMTP id p185mr4624813ywb.50.1487314242869;
 Thu, 16 Feb 2017 22:50:42 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.41 with HTTP; Thu, 16 Feb 2017 22:50:22 -0800 (PST)
In-Reply-To: <1487311780.3661.43.camel@aj.id.au>
References: <20170217042603.25864-1-raltherr@google.com>
 <1487311780.3661.43.camel@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 17 Feb 2017 17:20:22 +1030
X-Google-Sender-Auth: vEDkNKEojHP4boP7A9aZzfji2sM
Message-ID: <CACPK8Xf7J-pJZfKFT0eiUVmCLenAP4GOnoQ_cjkSYFceyfqi=g@mail.gmail.com>
Subject: Re: [PATCH linux] dts: aspeed: Enable MAC1 on Quanta Q71L BMC
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Rick Altherr <raltherr@google.com>,
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
X-List-Received-Date: Fri, 17 Feb 2017 06:50:46 -0000

On Fri, Feb 17, 2017 at 4:39 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Thu, 2017-02-16 at 20:26 -0800, Rick Altherr wrote:
>> Signed-off-by: Rick Altherr <raltherr@google.com>
>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Applied to dev-4.7.

Cheers,

Joel
