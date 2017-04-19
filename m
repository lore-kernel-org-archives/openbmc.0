Return-Path: <sjg@google.com>
Received: from mail-ua0-x236.google.com (mail-ua0-x236.google.com
 [IPv6:2607:f8b0:400c:c08::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w72WS56kgzDq8t
 for <openbmc@lists.ozlabs.org>; Wed, 19 Apr 2017 10:12:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="KvHCmX8H"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="kvSC8AXR";
 dkim-atps=neutral
Received: by mail-ua0-x236.google.com with SMTP id f10so5203813uaa.2
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 17:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=yfsH6D3Swc2SdE4pxntltFrcbamMO4gBGw0x0oc+6p0=;
 b=KvHCmX8HlQG1qkGh/2dap2CGt3nlxBhv8sQp9wNhr6mcJB2coAUO4GKxF+XNXQys63
 14OqMzqNAEPGY/sfJIr0/C/16PJA8DtSs0Vt+OUi8IGMhinOtzNjvjAdO3o1KglCimH9
 yPYw5S2TxnAf4sqrdKY6MOEzfRJnlH+oO38L80eWFiipr/ZJrxORbeZM1iBc4vXtwCs2
 ZPwm44/VIYoMeHmH5PORPmB9Jz2Z85ecT9Z8kWUw931wFGmQUwE3m7LimIKFspiQABWa
 F3Io1brdznJ2ECj8cyORRC/Y2RRcKYkIzJYPhDyMSvszz+aI8rtqpwmC5DWbWGbx2wHB
 hsMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=yfsH6D3Swc2SdE4pxntltFrcbamMO4gBGw0x0oc+6p0=;
 b=kvSC8AXRRwZH6AHZ98i5lFVtPmeYNmFzMznf2N+3fIsBBwkVTdPspLjSASkIX1J4zp
 dgJlUVKu4WrkIRYvGxaOPkAd7ynwfO69SbHIkZRUJ2oCDPo8xrI3gaDW5XWjmVJiNSTC
 hrEoJGVTDToSd4lrbWiWJ5zQc5EYcWFszDy8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=yfsH6D3Swc2SdE4pxntltFrcbamMO4gBGw0x0oc+6p0=;
 b=sQxXEv3nZmxU4bEMvyc5HxYXxypDfopgCJYhDm/owe+GQvyirBHFcKd4S2Xk8XoOBD
 GAfQVB15p6i+VPpa91OtVHEU1As+Wena0oM+1xkABpFD2ugHmegCdZg3onOiUMDCrbk1
 uSKEfRo1VLx5r/fB4A1ss7VeC2shJxErmjxCML847ffRk++ZK9gz5WwR3bx6cjli1kSk
 8qe0xAmmk6xlhTH/zDM1kq4zLhgrbka0eumB3UdB0R/bFCVLYHwZmsaUdZKt/mkCLY2+
 s0Bxjhn5j4TEVglt5FpwadXphYw6h73eqSrYjB0TK91OsQIiWAVBXgZaAFUKytVwG0lj
 eWBQ==
X-Gm-Message-State: AN3rC/62L6zMe//punDoYhzQOaxgbGazaAI10Xi6u2T2JKKOue0q7Fsr
 hJ1livF2KzmU3ofb9I/CWMaIlTe3XsKr
X-Received: by 10.176.9.129 with SMTP id x1mr43663uag.96.1492560754586; Tue,
 18 Apr 2017 17:12:34 -0700 (PDT)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.176.17.106 with HTTP; Tue, 18 Apr 2017 17:12:14 -0700 (PDT)
In-Reply-To: <20170417190034.71945-16-maxims@google.com>
References: <20170417190034.71945-1-maxims@google.com>
 <20170417190034.71945-16-maxims@google.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 18 Apr 2017 18:12:14 -0600
X-Google-Sender-Auth: hAHm2BkfpjAmAvt09naXI-mvXLA
Message-ID: <CAPnjgZ3C3CxD1Z6M08EnRrPE=44oik3Lo_6KOJ5J3NfKRK4EUQ@mail.gmail.com>
Subject: Re: [PATCH v1 15/15] aspeed: Cleanup ast2500-u-boot.dtsi Device Tree
To: Maxim Sloyko <maxims@google.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Albert Aribaud <albert.u.boot@aribaud.net>
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
X-List-Received-Date: Wed, 19 Apr 2017 00:12:37 -0000

On 17 April 2017 at 13:00, Maxim Sloyko <maxims@google.com> wrote:
> Remove unnecessary apb and ahb nodes and just override necessary
> nodes/values.
>
> Signed-off-by: Maxim Sloyko <maxims@google.com>
>
> ---
>
> Changes in v1: None
>
>
> ---
>  arch/arm/dts/ast2500-u-boot.dtsi | 41 ++++++++++++++++++++--------------------
>  1 file changed, 21 insertions(+), 20 deletions(-)
>

Reviewed-by: Simon Glass <sjg@chromium.org>
