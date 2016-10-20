Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x243.google.com (mail-vk0-x243.google.com
 [IPv6:2607:f8b0:400c:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3szq375LmHzDt4R
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 11:10:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=vVkckbkJ; 
 dkim-atps=neutral
Received: by mail-vk0-x243.google.com with SMTP id 83so1994773vkd.0
 for <openbmc@lists.ozlabs.org>; Wed, 19 Oct 2016 17:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=w4RUdhfRSqLowS3HlFvtvoOQRschJ5YQzoy3iKe6NC0=;
 b=vVkckbkJNQ+nXexFOhis2AE02cXki1sQ/h1l9uzpOFYD5jGDpCeMOT7Vc53MZo0nr7
 dpwly3syu/b2q8I77oAT4hj0IXhzOaOKL1hPZdirzZGu8Uq1uO+MWgMCKoQIQa1lTH3X
 i91NbQac50+5AuNiTubpLTaAYuGSndW+FPZVi5dWe+TGcd01YTBHAFFAE6/ZpjPOxJJp
 R5JtsSOQuhnUYy38xl+u4adzh/zXh8ju8E+DH5W6DIICwVJVsfV9BUmmAfc6JXf9fneY
 2Stb0UzY8OtnZc7FCMr+4rL9OQfRgPTSosvQn8LWoITFghk5Q20twGuKp8lo693d0zSy
 mH4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=w4RUdhfRSqLowS3HlFvtvoOQRschJ5YQzoy3iKe6NC0=;
 b=SkVScyke8s0vapSiiugqMz1Bio5qp+RD42wTg9ursS/N6b7LkkJcpn2clZLlJ6+r3l
 dO/RtGuaXBaN1xxleZN/U/Q7jyk7/2UA84NFdH3hCvzAzmA3pRgi/6zsKijAxd6KGzZg
 qU/oqUEWxo70G+PE45pAmo+/hrGnNk7zD0twMF0/MsfjP41HJV6h3QhOrEymBeqsFXpg
 ebNgpy71xk7cWGy6y2JRB6aQPDnE/vytQlSxTf5UcCgPoTdHxYFc44AiucYIKlixhDCw
 NSa5dZyR7OaK9LclfN9iRkdbfHazC/UmBJESEsmUfs218iJa6WxkZY0dR2hh3YhpMPAj
 7WZQ==
X-Gm-Message-State: AA6/9RlX0Hqd0C/v2H4P1xqPd1OPuvpA/nzkuinTijwyERwRYLYSJQed6BWMeoO9FYagwfUkJEyFPRvLXx7A6Q==
X-Received: by 10.31.4.207 with SMTP id 198mr7961945vke.82.1476922257420; Wed,
 19 Oct 2016 17:10:57 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Wed, 19 Oct 2016 17:10:37 -0700 (PDT)
In-Reply-To: <b76314f4-9bcc-7e51-41dc-1e31c326142e@ozlabs.org>
References: <1476918586-13475-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1476918586-13475-14-git-send-email-christopher.lee.bostic@gmail.com>
 <b76314f4-9bcc-7e51-41dc-1e31c326142e@ozlabs.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 20 Oct 2016 10:40:37 +1030
X-Google-Sender-Auth: wzsAGQjYSk8-DZlu6qFpFcvUZDs
Message-ID: <CACPK8XcDZ_Swiy_vYWS2VpYLj2PyFzZ=C3Z6kvW5Pj-imCO8_A@mail.gmail.com>
Subject: Re: [PATCH linux v5 13/18] drivers/fsi: Set up links for slave
 communication
To: Jeremy Kerr <jk@ozlabs.org>
Cc: Christopher Bostic <christopher.lee.bostic@gmail.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, xxpetri@de.ibm.com,
 zahrens@us.ibm.com
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
X-List-Received-Date: Thu, 20 Oct 2016 00:11:00 -0000

Hey Chris,

On Thu, Oct 20, 2016 at 10:09 AM, Jeremy Kerr <jk@ozlabs.org> wrote:
>> Enable each link and send a break command in preparation
>> for scanning each link for slaves.
>
> Looks good!
>
> Acked-by: Jeremy Kerr <jk@ozlabs.org>

Woot! Your first ack. This is a great milestone. Congratulations to
you and Jeremy for your persistence in getting to this point.

You can add the ack to the commit message of this patch (providing you
don't change the code again).

I was wondering, is this good to go on hardware? If so, I will fire up
a palmetto and give it a spin.

Cheers,

Joel
