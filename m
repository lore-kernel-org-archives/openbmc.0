Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::244; helo=mail-qt0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="NulQ6M2Q"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="gUaL1sm8"; 
 dkim-atps=neutral
Received: from mail-qt0-x244.google.com (mail-qt0-x244.google.com
 [IPv6:2607:f8b0:400d:c0d::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41GRCf1xTMzF1LQ;
 Thu, 28 Jun 2018 14:10:53 +1000 (AEST)
Received: by mail-qt0-x244.google.com with SMTP id i18-v6so3602582qtp.12;
 Wed, 27 Jun 2018 21:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=ddqzPl+2FdM/pYTJ5wcVoNklu71q5uAAoz8OEGTkthE=;
 b=NulQ6M2Q+Pp6belU2OCV140gTMJ5egdaBSVZ16lNm62hFpmooX2x1I86rfh0vLuaCV
 ZK1btxrL7sYvK7U7VU3aUlnm8doSc1vkjLoGRB+ozZKsOGlc/ZxpcZZqDUEQLux3ll+A
 ay97XRi3I6h1gxMvuN2d9NaTUrRVs79AQi5rKKCLxDJ0zqgttDH7BfRl8iH/38lStBkt
 OzQSBA4LjlIUBMAT+k9/WA2z8UdyYDgftXLp+HQLMw1eKsQKwy/PaYsGbk9dbXt4unNR
 zbVETnodi3+c2H1bcEeUg76xvMs6QuPREkZvBPlpK1wZYK9jVzQGtZ1iQb/ah7WZVTXe
 TlpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=ddqzPl+2FdM/pYTJ5wcVoNklu71q5uAAoz8OEGTkthE=;
 b=gUaL1sm8X4JpCggUAWRQO//5bSg4LVxLp2CJ0lBSDY4lBoEcHuGk1uxy7I3mXfQKHL
 ar8ykNoMInL9MDv1K7PIQ+TRoNxIvPaLn9rcUP2ZoFe1wy8+YwqPus6G3+SKjTNZVqZ3
 sqNfy/enMlB5fKB7UMSnhX9V4jQG5hcGafXl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=ddqzPl+2FdM/pYTJ5wcVoNklu71q5uAAoz8OEGTkthE=;
 b=DBvQ77U0AgyaUtBK/l6PGnTblSl47hLMT9JZoRsVu4P6rc+kBGMaTXcdHF/dWs3Q4C
 /fV9jSOhloKeIEUURGUiwRNDTsVA2bcMOfpZMJSws+cr7QWFQofGznRlLLiENpkx2YYv
 +Eu83milBo/RMy0q446EvwdQbApv44P0886jrqldZMcwDQNujOQ6q879Y/UqdElLndfm
 Iq4okMFtXDQdHhHK7feQaeK255UR4JSeik6XTR3hONSS5Om656dABRGg61UlAuYCAb6T
 JubVc+JjIZoRod27v0w4us5uZXaFQFG4GI4FSyyXZMTnuH9CZJ5s7Z/BzDLhcwf6DaMK
 GAkA==
X-Gm-Message-State: APt69E1u0L7wGDneZHHPH9/5g8Md8NBCCcCC06oCBqAiWrs7QIPJEbOO
 UyJlj2m5jalYPGMT1XQnHK5RKz2+Zdt4bSzemCw=
X-Google-Smtp-Source: AAOMgpdMHBBFK2tQ/TgLCSMJj30Zf9LGFzRiKs8yUgr52IO87ba5FCa1zKGNe+pWEyho5X8QPr1u4koiytHImqurGok=
X-Received: by 2002:aed:24f0:: with SMTP id
 u45-v6mr448065qtc.340.1530159051164; 
 Wed, 27 Jun 2018 21:10:51 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 2002:ac8:169d:0:0:0:0:0 with HTTP; Wed, 27 Jun 2018 21:10:30
 -0700 (PDT)
In-Reply-To: <20180626232109.10944-2-benh@kernel.crashing.org>
References: <20180626232109.10944-1-benh@kernel.crashing.org>
 <20180626232109.10944-2-benh@kernel.crashing.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 28 Jun 2018 13:40:30 +0930
X-Google-Sender-Auth: 4r2TP0yUQ8ArdqVnY_tVqgqFqjE
Message-ID: <CACPK8XcoW6HCkpYYhFvyVkjzDrWYAzRLcXpnLVpaR+8wcjrhqA@mail.gmail.com>
Subject: Re: [PATCH 01/14] devres: Add devm_of_iomap()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linux-aspeed@lists.ozlabs.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 devicetree <devicetree@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>, 
 linux-kernel@vger.kernel.org-v2
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
X-List-Received-Date: Thu, 28 Jun 2018 04:10:55 -0000

On 27 June 2018 at 08:50, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> There are still quite a few cases where a device might want
> to get to a different node of the device-tree, obtain the
> resources and map them.
>
> We have of_iomap() and of_io_request_and_map() but they both
> have shortcomings, such as not returning the size of the
> resource found (which can be useful) and not being "managed".
>
> This adds a devm_of_iomap() that provides all of these and
> should probably replace uses of the above in most drivers.
>
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
