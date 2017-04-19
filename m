Return-Path: <sjg@google.com>
Received: from mail-ua0-x235.google.com (mail-ua0-x235.google.com
 [IPv6:2607:f8b0:400c:c08::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w72W01pvqzDqCL
 for <openbmc@lists.ozlabs.org>; Wed, 19 Apr 2017 10:12:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="WbEUqE8Y"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="DcmXqmEJ";
 dkim-atps=neutral
Received: by mail-ua0-x235.google.com with SMTP id q26so5287040uaa.0
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 17:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=kPJrBLCFH7ptAHRPg0fk89z3YLSThsQZvUjU4831/YA=;
 b=WbEUqE8YwP+aT8XfeC+Wei1H2zFMMS9/OcC+xgtiH1E1IYU5KHCTozP2Vrq/IIRjpU
 /DIp1UYlXH4S9NBAICR0OWdGdWp1L+MKcIBx7CfcNcZK7QreV6gM43rLkbHRvs7+KAYS
 rUjB4J9V1oXLx049xg1knaPW251AxJ6pDC+9SuQV7R2EdsiYzAzai0IGuY66nOBTUd3f
 a4gAGjaV4eo5b6J9i7ndn3wNDtg57N0TIqgNGeU0s9oZcrEyzPRVYrqUQfKL1YxRA6Ak
 2zCjRuldMQi8R3jhKgpJwVM81OmEju9qaY702ylImFcfG/88v2h3gXhYMTh+sra1ygk3
 0Vsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=kPJrBLCFH7ptAHRPg0fk89z3YLSThsQZvUjU4831/YA=;
 b=DcmXqmEJgH26BArBfOgjNQz0YzFqlqW2mR+BHiwxeku/2gUfEkbJLUH+zuusOfVSMd
 Ddj/spjJ0n3FDlNV+fDb9+DODe845jhAGIPp7NUSBNq1JsehbYKVK5RaiuKPfLrqZvx3
 AWrMt9xjsFwrgQUhesaAFTq2dqGbJpSgfuE+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=kPJrBLCFH7ptAHRPg0fk89z3YLSThsQZvUjU4831/YA=;
 b=bonatS8GMRflYxcG0wg8TWO2nwr6B4ghe7b81VBvffJdPaZWdQSsLBWvG5o86GDp8R
 nqjt2xLLW1BGY5AEy42xooy+Jltwmit386wed0t343qMvpApEBmXqOyy9zE+VEYACRa0
 +M2kglm0ytiDu1OcGtiUzszG9zZxndfFLVp5hnveN3/t9GTSQz4ww2WJ0AWsGUoBPPEL
 oyaABcCilzX0au+lu3Gqu7cytojljUCIbsTkiNvsRbgOcU4cc12B3P6jV+GsQF/dEGSj
 dnr7y5QJiO3Vh+ySd5hK/Azc3GlAqQRlEOvE+See5rsNL4hCpDcGR+JPvmdTUhwvPzrx
 ta5g==
X-Gm-Message-State: AN3rC/4SdLf7I6IzHMzwZEoCfLYSTlCEFbgusGLGWBh0d9qWC2hx4ZeF
 YVZbW15vbeC4519LAQTIUGNMNPiLfDnr
X-Received: by 10.159.35.141 with SMTP id 13mr60014uao.46.1492560729796; Tue,
 18 Apr 2017 17:12:09 -0700 (PDT)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.176.17.106 with HTTP; Tue, 18 Apr 2017 17:11:49 -0700 (PDT)
In-Reply-To: <20170417190034.71945-10-maxims@google.com>
References: <20170417190034.71945-1-maxims@google.com>
 <20170417190034.71945-10-maxims@google.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 18 Apr 2017 18:11:49 -0600
X-Google-Sender-Auth: Qu-w0PMnQv-Q1XBT-AHgOO_8Hm4
Message-ID: <CAPnjgZ0TfCbtAowJuN1fitdTRROaT5xa8oJmXy8PnbbqJ7+n1w@mail.gmail.com>
Subject: Re: [PATCH v1 09/15] aspeed: Enable Pinctrl Driver in AST2500 EVB
To: Maxim Sloyko <maxims@google.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 19 Apr 2017 00:12:12 -0000

On 17 April 2017 at 13:00, Maxim Sloyko <maxims@google.com> wrote:
> Enable Pinctrl Driver in AST2500 Eval Board's defconfig
>
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> ---
>
> Changes in v1: None
>
>  configs/evb-ast2500_defconfig | 1 +
>  1 file changed, 1 insertion(+)
>

Reviewed-by: Simon Glass <sjg@chromium.org>
