Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::22d; helo=mail-it0-x22d.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pW+qXSDt"; 
 dkim-atps=neutral
Received: from mail-it0-x22d.google.com (mail-it0-x22d.google.com
 [IPv6:2607:f8b0:4001:c0b::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 423fvJ6kHQzF399
 for <openbmc@lists.ozlabs.org>; Mon,  3 Sep 2018 16:19:39 +1000 (AEST)
Received: by mail-it0-x22d.google.com with SMTP id u13-v6so14158222iti.1
 for <openbmc@lists.ozlabs.org>; Sun, 02 Sep 2018 23:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oHuSHJY9oNTb+7CCHH/av7IoRqLvD75KCwglm3HHP+M=;
 b=pW+qXSDtPacrToG74H+23QAr2vbL3Td1beAVxxDINEnZ6k7WAR2G3/rXa2VUMvbfPg
 zbUcRWDOyVcbQx32ExtnsWXOFShwl6aoMxGwHLC/ZBRsFDOauXn1dRmf7iIRvgcWJXAd
 wQMtaTlpK0FU7pvC1NK3vjBSHjxDhvBtAbE/c1acyTDkgNWNDWwwJCaMIgRscQCQBZ4F
 JK4iNWFscGnUZ51vsGE3CUxO1hE5eOnAMPDAz2XKQMNkhEFg4Y7Mgq87/5ZHq4GQ0B1z
 niuzmolSUN2oultp2DTgI8n8LgmrGte6zL4D44kdJDkwACVO46ne3RViy1/R46SM9CYd
 C4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oHuSHJY9oNTb+7CCHH/av7IoRqLvD75KCwglm3HHP+M=;
 b=V2GiRpzwOWL0eWvvF/Utr80OfExMrrDPBlIBrHihxkXojNVhhxVy0MgSMZd1N0eAKk
 7HG+PJ0qnJUuCjkwsWbTkUukntiSMSoASTjRke6/gdKpttyzvhVe9D0tanalBeFcU60y
 Ou196a9Nvc+kCHlx1WlmZgEFtAYEGu0ZD/KhfvnNLUAoDkTHcYUfYUQ50v0nlADQoyeb
 1e9Eyev2c4SMa0tLlZLioNze6hqeEnn2L3eOmUDpC/ry9m7uRBvG2KH4kUexvd5ognCj
 hWTCAKScHzxFFz4IMqZ/W05nY5HLfy6yK3aSIVIp6HsOuW33PmBAL1fLXAl/Tc1syo+y
 b//w==
X-Gm-Message-State: APzg51AokztJX/F/SraOtgH8wqxim9uvN+sWyu4fNzhSU8aY7yiUCUWJ
 i79lG5kFDcRg9B1DGiPxZgRvK63+ULAGTMmFPuY=
X-Google-Smtp-Source: ANB0VdZQRiNnQit012MYZu3+jbdez05QARcBFxJ9LYhZ18zgAOLhfSZ2hv9h1xfQ3tDglKNDPxzFDipNyrd1ZKA5fyE=
X-Received: by 2002:a24:14d8:: with SMTP id
 207-v6mr3887264itg.41.1535955577498; 
 Sun, 02 Sep 2018 23:19:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAE33tLG+MZOg8-O76kXruUYeC=c=pLUEU4UuV8+bO4sqhegTJA@mail.gmail.com>
In-Reply-To: <CAE33tLG+MZOg8-O76kXruUYeC=c=pLUEU4UuV8+bO4sqhegTJA@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Mon, 3 Sep 2018 14:19:26 +0800
Message-ID: <CAARXrtk9YPLQJ9NUwjaFYLhaz9K4+hU44HwBtt4WuUTxhtksCw@mail.gmail.com>
Subject: Re: Temperature Sensor not showing up.
To: akashgj91@gmail.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Sep 2018 06:19:42 -0000

Hi Akash,

The sensors need to be configured at build time.
Please refer to:
https://github.com/openbmc/docs/blob/master/sensor-architecture.md
or
https://github.com/mine260309/openbmc-intro/blob/master/Porting_Guide.md#hwmon-sensors

Thanks!

On Mon, Sep 3, 2018 at 2:03 PM AKASH G J <akashgj91@gmail.com> wrote:
>
> Hi Team,
>
> I built OpenBMC Linux using Zaius configuration and booted on BMC Aspeed AST-2500. The board we are using have a temperature sensor in I2C interface.
>
> When I am executing the command curl -b jcar -k http://root:0penBmc@169.254.8.221:18080/xyz/openbmc_project/sensors/temperature it is giving reply as curl: (52) Empty reply from server
>
> Ipmitool command: ipmitool -I dbus sdr elist full also not showing the temperature sensor and its reading
>
> Please someone help to resolve the problem.
>
>
> Thanks and Regards,
>
> Akash
