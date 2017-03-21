Return-Path: <sjg@google.com>
Received: from mail-vk0-x22a.google.com (mail-vk0-x22a.google.com
 [IPv6:2607:f8b0:400c:c05::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vnpkz6b5LzDqZl
 for <openbmc@lists.ozlabs.org>; Wed, 22 Mar 2017 10:22:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="MBl4GbH8"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="HFkQ7cbA";
 dkim-atps=neutral
Received: by mail-vk0-x22a.google.com with SMTP id d188so110271882vka.0
 for <openbmc@lists.ozlabs.org>; Tue, 21 Mar 2017 16:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=jv7Mn51PlwOIYnJ9G3cWXTPMsUhMtuhFImMunckYVDM=;
 b=MBl4GbH8H5SY9BpQHwcjHjUdql+DYD9jiUEHB2re6WyM2gx4vbtE60en9NEkugYCy7
 TzchH9V/8uZYILOXEu4ZoqVYC/WIkK6K/E8fNLP+JyhkHznqWSvMyKcaUK0wT7nKPTei
 MKjGx4qSyPaZDXDT0rGvRO9fvK+tTy0lHzsXL5U1n2i0uPP1vqsmaxCSLXdp/m+zUjQq
 9IKQgyGTIHGh2tpXKqJ/XiANIdesB9G8wjJ+vz3IS4CrGheqNHd13usdNDxvgMxqr0Y5
 cryUU+Wh872g4Ncgc/wMQXHNXhag3munriDtBlnQCFEVIEO1CgR5XgY2jgUbZB2h6rOU
 83Gw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=jv7Mn51PlwOIYnJ9G3cWXTPMsUhMtuhFImMunckYVDM=;
 b=HFkQ7cbAwTgZgcd3k6JUmg3zxiuSNgvHLClPElj5C08Im22ED5F+wiSNh9HDabZH2U
 E87fNWB+jOLh7a+hUV4T3v0UwuhZqrMbqsUmAw1ELD0dAAZjHNzB8u9c5RayEBIkaVoQ
 CvE+tiMY2GhKM7h11Sy9RzEYfNy/Nm9wWLIzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=jv7Mn51PlwOIYnJ9G3cWXTPMsUhMtuhFImMunckYVDM=;
 b=BKIjborbXk1cbNjoI/A9T1Rjh6a+6AdOFHKiS1203BtR0qnk+tpgrNoMRf2slakwjA
 CyoLR+EHH5EOCzXOfelyVEj9gLdt//GdlOSgDbQBWkjYqIAVDfeo0dpSaJxtL6+er496
 Q3nYgxQ9c0HmA6zPX2vHSBJA0kaZ2rmXv85ykdGm/td0kzsmUzZoxZLvL/F3TNb8bj6B
 JAOswe4fAZ9B4qhd2bjw8LNS5RWfPjWxOr69GsAbCuh7msexGTJ5NBnITqDklPFVuuMh
 q/jSoynOp2YrP6ugLXmBsrIG8qqNp4ciBuhbE5qU+YrQ6cHr+z/1I5uksul53641rPLr
 6fiQ==
X-Gm-Message-State: AFeK/H0tvBFXvUQ3T0nBuJN3vdqfYLbLDggWIgA+kPeBYNV1gSrZFfeqq3ugp/YpmtP6Kme9O5RXkhhCstsDuSmh
X-Received: by 10.176.6.233 with SMTP id g96mr16306343uag.68.1490138569650;
 Tue, 21 Mar 2017 16:22:49 -0700 (PDT)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.159.35.108 with HTTP; Tue, 21 Mar 2017 16:22:29 -0700 (PDT)
In-Reply-To: <20170316213624.140344-10-maxims@google.com>
References: <20170316213624.140344-1-maxims@google.com>
 <20170316213624.140344-10-maxims@google.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 21 Mar 2017 17:22:29 -0600
X-Google-Sender-Auth: vi4z0E6wntyZnYV1rRaaHSjG1jw
Message-ID: <CAPnjgZ07ALGii19aTG72Qyhx8i6cG72Eg3d8RYXbqBRptsF89Q@mail.gmail.com>
Subject: Re: [PATCH 09/17] aspeed: Enable Pinctrl Driver in AST2500 EVB
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
X-List-Received-Date: Tue, 21 Mar 2017 23:22:52 -0000

On 16 March 2017 at 15:36, Maxim Sloyko <maxims@google.com> wrote:
> Enable Pinctrl Driver in AST2500 Eval Board's defconfig
>
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> ---
>
>  configs/evb-ast2500_defconfig | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Simon Glass <sjg@chromium.org>
