Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-it0-x242.google.com (mail-it0-x242.google.com
 [IPv6:2607:f8b0:4001:c0b::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t09pS6D6GzDvWt
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 01:16:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=gEESxCdE; 
 dkim-atps=neutral
Received: by mail-it0-x242.google.com with SMTP id 66so6130201itl.3
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 07:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=SPwarK2hfRaK5azFXls8PR0EtZifpUHXCCuAGBAe0Qg=;
 b=gEESxCdEOTyWwiro0HSZ+H8SRztwps/o1mozsCbaWjXsQ6J1xngElIqkXTnumtXAXL
 9eVkpdRkDVlN/voiSJNNjOxrCIWgqbNGBCmlXMrbSzyJPba3rXWRvN+y7xMnTgCiMnuG
 bvcOwBWmgrQBuo8LXsQF5/m0cUS/reey/Pk+8VZx39PoDqa4zrCoTW+W2gYGbZ+DoEQm
 PNstr4RX5zMCCEJgiGDEV2QgUsZ6Rh5V7VVHQT1T+v/R0aXs56kCs/XMXjkg8oGyuIFI
 nWTYpPmmHJzl2iiFtWp4PQcdro/N9FEKrPO/4SW9+/LrymIw1OGe9gJk1yoU049mt6Dx
 WAgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=SPwarK2hfRaK5azFXls8PR0EtZifpUHXCCuAGBAe0Qg=;
 b=F5ORhKFIGwN+sAKOJNSZE5Ebm6mygAw/XiQZeyjOft1QQeIvTMHks4hr8SRhZcBclp
 7w2tir9ID3GjBhz0teSNEpDJshhiOCwtE69J4kYDqz1uS+m1JXD0lOwiHSaozn6d9c0Z
 QO7vbD3edwMaJA9eq5kSCxGtRwwjWrlpUcl6vsMioh4Oc5wi0JbeLOFFEbtqdujeCpTl
 iZaTvku6YbXO19CPjjrA9zCwxIU3oTJkcts1QvbIqEHKL2nVAI9qfHPFxrCyEl9z6tdf
 OGiLMXvuj+yEqyRRl/Q2Hp7CfrS/B2jKLtfU7IKsmKwpqBuBquhyE5/E6Zm7rxgBx+PP
 dIBA==
X-Gm-Message-State: ABUngvfiKBblCD2Lzm90Q31BsqJcWmM2BXj6SNMymRbHYaG3ZtYcrZHGCGCS0Tjx8YKljExStpGsaYN/OWj/3Q==
X-Received: by 10.157.34.106 with SMTP id o97mr387562ota.134.1476972974823;
 Thu, 20 Oct 2016 07:16:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.221.9 with HTTP; Thu, 20 Oct 2016 07:16:13 -0700 (PDT)
In-Reply-To: <CACPK8XcDZ_Swiy_vYWS2VpYLj2PyFzZ=C3Z6kvW5Pj-imCO8_A@mail.gmail.com>
References: <1476918586-13475-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1476918586-13475-14-git-send-email-christopher.lee.bostic@gmail.com>
 <b76314f4-9bcc-7e51-41dc-1e31c326142e@ozlabs.org>
 <CACPK8XcDZ_Swiy_vYWS2VpYLj2PyFzZ=C3Z6kvW5Pj-imCO8_A@mail.gmail.com>
From: Christopher Bostic <christopher.lee.bostic@gmail.com>
Date: Thu, 20 Oct 2016 09:16:13 -0500
Message-ID: <CAA0LjjXs1HcPLYy9NXm29Mm9rw_+k-Cqhw8aq4LyyY7pVmHrKg@mail.gmail.com>
Subject: Re: [PATCH linux v5 13/18] drivers/fsi: Set up links for slave
 communication
To: Joel Stanley <joel@jms.id.au>
Cc: Jeremy Kerr <jk@ozlabs.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 xxpetri@de.ibm.com, zahrens@us.ibm.com
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
X-List-Received-Date: Thu, 20 Oct 2016 14:16:17 -0000

On Wed, Oct 19, 2016 at 7:10 PM, Joel Stanley <joel@jms.id.au> wrote:
> Hey Chris,
>
> On Thu, Oct 20, 2016 at 10:09 AM, Jeremy Kerr <jk@ozlabs.org> wrote:
>>> Enable each link and send a break command in preparation
>>> for scanning each link for slaves.
>>
>> Looks good!
>>
>> Acked-by: Jeremy Kerr <jk@ozlabs.org>
>
> Woot! Your first ack. This is a great milestone. Congratulations to
> you and Jeremy for your persistence in getting to this point.
>
> You can add the ack to the commit message of this patch (providing you
> don't change the code again).
>

Hi Joel,

The only thing I'd need to do is modify the commit message to relocate the
version history log.  Would that prevent me from adding an ack at this
point?

> I was wondering, is this good to go on hardware? If so, I will fire up
> a palmetto and give it a spin.
>

This code as it exists in the patch set hasn't been fully tested.  I'm
in process
of doing that now.

Thanks,
Chris

> Cheers,
>
> Joel
