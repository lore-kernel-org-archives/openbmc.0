Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x230.google.com (mail-oi0-x230.google.com
 [IPv6:2607:f8b0:4003:c06::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t46tR6m91zDt2s
 for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2016 11:18:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=yeH485if; 
 dkim-atps=neutral
Received: by mail-oi0-x230.google.com with SMTP id y2so21059955oie.0
 for <openbmc@lists.ozlabs.org>; Wed, 26 Oct 2016 17:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=5zqBcskwrbb8DTwQcr715EYrEEwPZzG7P+5UKIVimbE=;
 b=yeH485if1dYvWwGGilR4VfoP3RKTE/21HPoMrKfmy5eHL+94W2yVhjiR0S3m3M9cxu
 YvE9APEup6Y2E7oMxgDe+fPE4a/qijAgGqVmivasl2xAjdHx3WS5Sv4Jdl4TARxvepOu
 sROB5HUY7Wd3jR5hRadI1rm4PHH4S1dhKGMFoRc+aJVf/DCt6PE9GKGPc1xdo+hO8qJg
 Zvq467ijozuc6unYfriy7KJLrInz/m03y6ktXDT67MWxyBaIDwCUOhsDAK6bogz45nWc
 gaCTdhVZ3EiROsAn6eJRIdEnmou38cTLk75viwsXbK/UpZ8UUXrpOL5TMbVuoNSjpL6G
 IEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=5zqBcskwrbb8DTwQcr715EYrEEwPZzG7P+5UKIVimbE=;
 b=U/m6n4hAOUT5u0O5hE9yfMKqKdnTP4T9Ct5SWsKwaGZQJKlmQAwNfWIkl0aON8xrlc
 tkjuIpjyb+cj9EEPlh1kTkHoC8yW+3qglgzeuDhCvTblhIAzlULsF/eooJmhlXNr+hzn
 Dmj678UR5tLvjlrxYDwf7qDRb7vK3smUDyV3XDTC0vvUy8MieERkJdrAXGKrDWrXTnsU
 lmUq6K8QZvJXmkhKAzYOKmx1IU7/8hcmBEFmHfK6csJtTldSqnixDNFNuX0qhCKVd3hQ
 rY9dZvd5Org9c+/kJycja3o3/MWX3eIfZ1SwS3NMu9/iV1P65v7F3R70LAC8sBKbxesU
 bpIg==
X-Gm-Message-State: ABUngvfcSHLwQtpCQesx30uvzO9tBNBLhz7XyX+14TmEkTuY6g9q8ePkgso2SIf8HRtzxGhJSD8BuujA5UB/iw==
X-Received: by 10.157.8.204 with SMTP id 70mr3948200otf.74.1477527502057; Wed,
 26 Oct 2016 17:18:22 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.107.226 with HTTP; Wed, 26 Oct 2016 17:18:01 -0700 (PDT)
In-Reply-To: <20161026065509.GA10287@distroguy.com>
References: <20161026065509.GA10287@distroguy.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 27 Oct 2016 10:48:01 +1030
X-Google-Sender-Auth: bPWKo4svkzwPI29c523Ue363UMA
Message-ID: <CACPK8XfM_24R6wAa92cMNtfWhL_JZ_zBwCnDza=sutbwJA_c0Q@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: witherspoon: add Epson RX8900CE RTC module
To: Chris Smart <chris@distroguy.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 27 Oct 2016 00:18:24 -0000

Hey Chris,

On Wed, Oct 26, 2016 at 5:25 PM, Chris Smart <chris@distroguy.com> wrote:
>         /* RTC */
> +       rtc@32 {
> +               compatible = "epson,rx8900"
> +               reg = <0x32>;

Did you try building this?

Cheers,

Joel
