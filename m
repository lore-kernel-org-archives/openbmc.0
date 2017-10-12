Return-Path: <geissonator@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::22d; helo=mail-io0-x22d.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="CTrDd2m5"; 
 dkim-atps=neutral
Received: from mail-io0-x22d.google.com (mail-io0-x22d.google.com
 [IPv6:2607:f8b0:4001:c06::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yCl135gk4zDr9F;
 Fri, 13 Oct 2017 08:51:35 +1100 (AEDT)
Received: by mail-io0-x22d.google.com with SMTP id h70so6997606ioi.4;
 Thu, 12 Oct 2017 14:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=VrWEwoLX68MdIybLYDdYlNmF2miAe3oFcWvB6oGJNJU=;
 b=CTrDd2m5zMTCo44ZQju5qUpdbuC3FG5hEF5zHrxbgZm3Y0ffn5QDE17b7zzya1K/7r
 Q2+fzSLDw7IZf4anBWRT7BSP3PT8xLsAeACqc6ZBgoUJyojyrA3EAKeCSSnfOTsUeieT
 yeuDow7mJNpHB94eURYwrrvd28kB6UmFXzlWG/ah6yObHXSR6wKZpjQSNVheETlMlB/4
 y8UMj8Ytl9anyqUah3nd/nYQzPmuF6oQvut0WNr0qoXcSVYehmAK/kMmqGQtxDFIKzNv
 /BHpQ2+Hv9fkgis1Six9ki1ohb4ILlZ5tNNeBObf7Sv34flFtsfqmt3ZyQ0ybM4iOd5X
 lmkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=VrWEwoLX68MdIybLYDdYlNmF2miAe3oFcWvB6oGJNJU=;
 b=Tz/70KhRrWXGucK3diCUD7FgRMuuLwE66UxDTygVtvyQAzprwyiDTxwJ4hriI+QAPM
 jXcLNgTTQol7UpUOJA80VFW74lmJ9yxJnsPPr6xDJwyxqQQAY4yZvrxxDTPxr63tup02
 ibLaS2TrXZkvjXwM/jcWet8u73V0hWOEgSKZNJ8SxMPI1EbF0BxDTtoDxsDm9M9Rl32m
 T0BBQf5F6r3mEsV31KOQrRMxGKs6Cm9MUdYV3a4U5sJiqQnHQGxdRagRPZW74FdsDgcy
 qnNQK1vOZ4LM2oUE0PiCcoc0odDTrbedKE7tzEJRwlUiF5DP/zdFSxlIPfKwQCSf5I7l
 usQA==
X-Gm-Message-State: AMCzsaUUHnWqbEYlOoXsNq2xYnZkmxIp+jZUERxHfnun8u7txE5I+Qgo
 OsEZniQvHcasDgeMxhsILsKrXiBJxXXB1sA/pcg=
X-Google-Smtp-Source: ABhQp+S0FVxjxUiO0PT8fcS2f7Hl9FBCWrGedvm/FzmRjeYLXVkp6FK85gWGJkqtUFrjoWJ8ByTBQweZAqJ/QrrX2vY=
X-Received: by 10.107.51.147 with SMTP id z141mr5100276ioz.146.1507845092811; 
 Thu, 12 Oct 2017 14:51:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.150 with HTTP; Thu, 12 Oct 2017 14:51:32 -0700 (PDT)
In-Reply-To: <1507843946.5452.187.camel@aj.id.au>
References: <1507254940.5452.129.camel@aj.id.au>
 <OFDFEB18C7.4CBB979B-ON002581B1.000FD8A2@LocalDomain>
 <OF921CDA64.CB068039-ON862581B1.00153196-862581B1.0015746A@notes.na.collabserv.com>
 <CALLMt=pT-oPiQr0V0_CQd_eOEkyYsSncH1_dS-Jjhkbd7+VvWw@mail.gmail.com>
 <CAARXrt=tOkNnEoOaUPkQtUVDqOoq__4aqdqrA7tH2y0SXWnddw@mail.gmail.com>
 <1507691558.5452.172.camel@aj.id.au>
 <CAARXrt=O-dNH=Lt+vkQdCH_dF6xtS7aE8pqZn-BNMA7dgTeR9g@mail.gmail.com>
 <CALLMt=ri4td=9C6av3jHchZwckffmPdxYkztj1qCav2WMmd3Jg@mail.gmail.com>
 <1507843946.5452.187.camel@aj.id.au>
From: Andrew Geissler <geissonator@gmail.com>
Date: Thu, 12 Oct 2017 16:51:32 -0500
Message-ID: <CALLMt=q+eTPRh0EhED0KHbU2_F8DfG7p5F9SaNGGKZJefYvH1w@mail.gmail.com>
Subject: Re: OpenBMC helper scripts repositories
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Lei YU <mine260309@gmail.com>, Chris Austen <austenc@us.ibm.com>, 
 openbmc <openbmc-bounces+austenc=us.ibm.com@lists.ozlabs.org>, 
 OpenBMC <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Oct 2017 21:51:36 -0000

On Thu, Oct 12, 2017 at 4:32 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Thu, 2017-10-12 at 12:52 -0500, Andrew Geissler wrote:
>> Lets do this!  Any proposal on the repo name Andrew J?  openbmc-tools?
>
> Sounds reasonable to me, can you create it?
>
> Cheers,
>
> Andrew

https://github.com/openbmc/openbmc-tools created.

Thanks Andrew J!
