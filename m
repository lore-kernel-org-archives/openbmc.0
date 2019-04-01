Return-Path: <wak@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=wak@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="g+7mSa7p"; 
 dkim-atps=neutral
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Y1wp36VyzDq9p
 for <openbmc@lists.ozlabs.org>; Tue,  2 Apr 2019 06:04:25 +1100 (AEDT)
Received: by mail-lj1-x232.google.com with SMTP id k8so840845lja.8
 for <openbmc@lists.ozlabs.org>; Mon, 01 Apr 2019 12:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l2pOaO2PVXTGiCS69ysBjwxrmtfiCmU9PhdDpq25VrQ=;
 b=g+7mSa7p8JLeTOAXxoNwMYvb65PFyfGw0GbYYgGgJkKR8u9NS0ij1aMUHUlBhZzvqy
 fbqnzd5eut9Ye+3qljX+P4V8DYizAucvWm88Ij16cyVG2WB/d1ogvN+udwsMVq6LmMbh
 4pf+YClS07N2e0xorbA8fsDZEwuj4aAIfkH4hn++pfmFGSMDmR6v743ZliNeqBB9rTdT
 edjS0MF5kOOg5oDpNIvJoHK/0FtGiyVcE10y0Q++WvCBsXoI65YpROoTRTwbMKA1+oxb
 q6rvJXxptlCHvIDFSnfsI9blMYJXvv1qlO5sBZ+72suTpW+CfnJ/ELA9h8LLhS7zrxG/
 +71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l2pOaO2PVXTGiCS69ysBjwxrmtfiCmU9PhdDpq25VrQ=;
 b=qNhDSVMDtcH92Cb0ImWeX2bXmFnonw7sThUtN8BCrn2eHUFcWyszgLB9tW2FfuLZ0U
 uI09SvQ4Tq5Jwml/ddfr1oJfMTRdyp/tx9vBrB5m37P2ISrlk8ryx9G69/7/ti0YM5A/
 so6O+Od/Z0Edq4B8ivxjDMdVwBU50rCndr37YayVhqBbr7JM1MFqavfX5Bhp2ShYi1G9
 ZmRaJz4rW+XmQSExzWm1lOfbmxyNcconU6tm9H2Mfshp2U+/4ImKcBIDkgT9oC3DN2Jl
 t+No70FnWFQWpDMiYMv014ntKPIYi1dtiOVv7+PmGPjiOEXGQFV/0OaEmHtkD3K3bVCL
 ZAsA==
X-Gm-Message-State: APjAAAW6a9+2xGfTCJwLOvL+pVwELD2Vo8haRnUS9ncEwqM0VI58swwS
 ENdnX1znEty+No9AK++68TxnCyz6to6XeQOad/3WNQ==
X-Google-Smtp-Source: APXvYqyWfAjxxHZbq4VPaYpE3P5DbQ08heSzs+h/UWwenlvKJuinKT8SxjZ/DzBkGQiC73JCaRQnL4KHSl1aL8CY5LY=
X-Received: by 2002:a2e:4ca:: with SMTP id a71mr31930583ljf.39.1554145460508; 
 Mon, 01 Apr 2019 12:04:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notyEKDUdTWOzJRGiGD_gFycTJbSW=GzF=YCbUW4XJswtpQ@mail.gmail.com>
In-Reply-To: <CAO=notyEKDUdTWOzJRGiGD_gFycTJbSW=GzF=YCbUW4XJswtpQ@mail.gmail.com>
From: William Kennington <wak@google.com>
Date: Mon, 1 Apr 2019 12:04:09 -0700
Message-ID: <CAPnigKkYDQOyPPotS9d_TbtWXB99-bueODsW_an0SZ-FRPiJRQ@mail.gmail.com>
Subject: Re: wantedby target
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Apr 2019 19:04:27 -0000

It's still unclear to me why we even have obmc-standby.target instead
of just using multi-user.target. I think it has something to do with
host power on / off on ibm machines and how they pick which services
to start. We almost certainly don't want to be using the basic.target
as that is reserved for core system services and ordered Before all
targets.

On Mon, Apr 1, 2019 at 8:20 AM Patrick Venture <venture@google.com> wrote:
>
> When moving service files to the repo there is a choice.  To hard-code
> the wanted by information in the service file, or providing a variable
> for it that can be set via configuration (via the recipe).
>
> There's the default which is obmc-standby.target, there's the more
> popular multi-user.target and basic.target -- I was curious if there
> was a consensus or a best practice here?
>
> Thanks,
> Patrick
