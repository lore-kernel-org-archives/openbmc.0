Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x242.google.com (mail-yw0-x242.google.com
 [IPv6:2607:f8b0:4002:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wHC8J5BS4zDqBQ
 for <openbmc@lists.ozlabs.org>; Tue,  2 May 2017 17:09:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="BcljA1RE"; 
 dkim-atps=neutral
Received: by mail-yw0-x242.google.com with SMTP id u70so11006943ywe.1
 for <openbmc@lists.ozlabs.org>; Tue, 02 May 2017 00:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=+ObQwzYRmnhmsTwsvQ0QJ336jemtN671ZZrSI3nBKSI=;
 b=BcljA1RE6fLkS2myV3cRufF/pVOiZfdSMNObxsIa1x63GXXWreueXYrPWQ9zxo6O1K
 hMmBb+LLQnyjZ92dV6Uetb4Fxr2eUWIU8a6ELkNYFnRdxKlUvCiQkZjayg3xJkeyr3IB
 HPS+74fcTTWxj/oSVK9GKD9E6GJ73dKeJnnXA930x3ufWi9MXK2443uHkxVlp7twdTVx
 aD/RTPmxmTMzG9W7kkhs9LaDYAuB3pFy5xFUZrtvNCP2G464gYFcM3TXMxv2+sc4Grhk
 KtL5NlfoS7I9KFIQkdiyvpAjYDyUbh/ckqus4PBCq+0iKtErzcl6axyE5bjWWudnh/Xg
 jNDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=+ObQwzYRmnhmsTwsvQ0QJ336jemtN671ZZrSI3nBKSI=;
 b=n/0BC7qK4kOS+GtrUavDVrGny9BrVL6fbeLmLHNaK+oUgJKOpF/KJn7vVLbNMn5AmC
 cLRBO9g8An+Be12wrjPBfPJzOF7PGZ2Hh1d19s2wiCntKiNEaMo3ZJHzRq0ftZQDj9ed
 XYFsAG8voEF6GGy83jynrk5heXRem/mHfos/RQhL3p6s7MLRfLN/uTtt4PJ0JY6LdbdB
 20zVT7HCjcm/bfdFseGgQNF9OT55URl8L9ZpbaDAc+ITTJODRaWINP+P1vtIPnpXwW0V
 i8rl1qrX6mrGtSLwLD/FiW8e5TL22rV7wNemiLRIWIWIrwMThhekHnkJR8VgzrSE95st
 v3fQ==
X-Gm-Message-State: AN3rC/5mJp41bm1fSl9BTuhsI3YGVtNAixtyeEIlzW/wIqCFYABf7aho
 07nQ2KlRozM33mK0INW/WdIWfM8Ynw==
X-Received: by 10.13.225.193 with SMTP id k184mr22776714ywe.178.1493708958394; 
 Tue, 02 May 2017 00:09:18 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.171.70 with HTTP; Tue, 2 May 2017 00:08:57 -0700 (PDT)
In-Reply-To: <CAPH-5w6Cjv1b0iExwhYqPhOz+2BKsOV6v2z2-KWnNtGeDu+h0w@mail.gmail.com>
References: <20170428071043.1355-1-andrew@aj.id.au>
 <20170428071043.1355-2-andrew@aj.id.au>
 <CAPH-5w6Cjv1b0iExwhYqPhOz+2BKsOV6v2z2-KWnNtGeDu+h0w@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 2 May 2017 16:38:57 +0930
X-Google-Sender-Auth: On-H3c-6rcEi4EhPM3uL07L71OA
Message-ID: <CACPK8XfWohiZ3_QeFMiUB0g0PvzUJXLcojUUc2AYigW2sJZ4nQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v2 01/11] aspeed: g4: Move pinctrl subnodes
 to improve readability
To: Xo Wang <xow@google.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Mine <mine260309@gmail.com>, 
 Rick Altherr <raltherr@google.com>
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
X-List-Received-Date: Tue, 02 May 2017 07:09:21 -0000

On Sat, Apr 29, 2017 at 5:57 AM, Xo Wang <xow@google.com> wrote:
> On Fri, Apr 28, 2017 at 12:10 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
>> Moving the subnodes out of the pinctrl node declaration to a reference
>> allows easier access to the remaining parts of the devicetree.
>>
>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>> ---
>
> +OpenBMC list
>
> Reviewed-by: Xo Wang <xow@google.com>

Applied to dev-4.10.

Cheers,

Joel
