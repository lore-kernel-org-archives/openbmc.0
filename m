Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::233; helo=mail-vk0-x233.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="CsewtJPx"; 
 dkim-atps=neutral
Received: from mail-vk0-x233.google.com (mail-vk0-x233.google.com
 [IPv6:2607:f8b0:400c:c05::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40WPxS58QczF24H
 for <openbmc@lists.ozlabs.org>; Thu, 26 Apr 2018 01:58:19 +1000 (AEST)
Received: by mail-vk0-x233.google.com with SMTP id w1so14157371vkf.3
 for <openbmc@lists.ozlabs.org>; Wed, 25 Apr 2018 08:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=BK5EvPqAuvVygD/CcNpe6B8t9yrqP++yksOm/2eV668=;
 b=CsewtJPx7Uw/7XL9KAFS9envqeP+uCdRU6Wh44fsndCDLq4CAe1aM5HrVKaNej/9iy
 y7k1dlHxlYtR288+HSE40fvshYUAaere3OWnSb0VxTOgXpsWMxfFHeI6jh6b/5DF4pE2
 40hXZPo7RlxuLlE2f+BsyXTZyzQFOJKRTkwLmXmUW1Sybis/6SHsCMgE1wGWt0v+OVk6
 J1jsQY/mBvl1L+h3TgMIpdi76AXMe4LOrYotv1QrwxWdcw7LES47uV2V6aSpH65RbuRl
 2olksfj5fSEqOqs90ZjKytbS9UGkKirlTn9ICTgiQXRCk2zZNLNoy9FM/QcIxIBRJVzZ
 Iqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=BK5EvPqAuvVygD/CcNpe6B8t9yrqP++yksOm/2eV668=;
 b=I1Z5wNbD97ZvY8+KUGrnwTF0sJhlN6Ay05wN06Li5bn0WK5sxtk3ah0n/0wgW4PYvR
 wpV0ba4xBAmHpOGJ3IU6o8uG2RygJ5mCj/gWheRVE82Zd9gQGlml9H/hBgKEzgV1s0bN
 c3+5q4Re09i+O5R0Rb/VdraiPisAqX8fpyDK6yhaX+botw7RnDL+ksCoHlFCkAEIN80n
 ZeIubMBkf2H2R0BPrbKhFmCR7bx7t6PMciwegLzuu5j4iz9UU9tQ4wQBRQ0iv37dY1DM
 6qhoBrTWP2uv0M1Nr+puZfe7gDc2w4pQPtNRVS+kQ7a73mVoIqzDr7F4QsNN02QQzV06
 tgUQ==
X-Gm-Message-State: ALQs6tAESUe8ab5vM9o5Q+F1McApsfzul+jQLKlzOP3u/iD6cnWxNEnE
 tJ0G8YfaMAVD1jQvpNv+I15+YNSCmmdre0k4ffOlyCPb
X-Google-Smtp-Source: AIpwx4/4IWS9V9qzZc5P9qj1/qXoTzTu6B0LJ4Nbf5FqrDrW6rlbOjJ6nZ4I3S6kfcu0sWiCcj5SvL59PnfXjQCUP7w=
X-Received: by 10.31.114.207 with SMTP id n198mr20810126vkc.149.1524671894058; 
 Wed, 25 Apr 2018 08:58:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.87.198 with HTTP; Wed, 25 Apr 2018 08:57:53 -0700 (PDT)
In-Reply-To: <CAO=notyO-hhCvPY9t5Pa-FWPORkD8XWupPwhxMir+ZCEg6hLcQ@mail.gmail.com>
References: <CAO=notyO-hhCvPY9t5Pa-FWPORkD8XWupPwhxMir+ZCEg6hLcQ@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 25 Apr 2018 08:57:53 -0700
Message-ID: <CAO=notz+ALDanrXAHGrPSwjZtf93aecFujkuj63ekeNGj=XO7w@mail.gmail.com>
Subject: Re: maintaining the quanta-q71l
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, Nancy Yuen <yuenn@google.com>
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
X-List-Received-Date: Wed, 25 Apr 2018 15:58:21 -0000

Quanta-q71l is supported in v2.2, but since nobody will be taking it
over, I'm deprecating it shortly.

Patrick

On Fri, Apr 13, 2018 at 12:41 PM, Patrick Venture <venture@google.com> wrote:
> Hi OpenBMC,
>
> Long-term I'm not able to support the quanta-q71l machine.  I have
> some patches that'll make it build again, but beyond that I don't have
> the cycles to keep it up-to-date as is really required for it to
> continue to exist in the meta-openbmc-machines layer.
>
> Are there any volunteers who are using the platform and have the time?
>
> Patrick
