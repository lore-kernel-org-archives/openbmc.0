Return-Path: <sjg@google.com>
Received: from mail-vk0-x236.google.com (mail-vk0-x236.google.com
 [IPv6:2607:f8b0:400c:c05::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vnpkm5k9wzDqZf
 for <openbmc@lists.ozlabs.org>; Wed, 22 Mar 2017 10:22:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ej93tN4Q"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="M87zJ/Wm";
 dkim-atps=neutral
Received: by mail-vk0-x236.google.com with SMTP id z204so53494046vkd.1
 for <openbmc@lists.ozlabs.org>; Tue, 21 Mar 2017 16:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=YvpuWzR872Gf87pQE2T4jBiR+J1OEXY86ppxciNKQ9M=;
 b=ej93tN4QuKLaCWI6fcE80HAq3uMNYM2RKPR1o2L8xjkUDVsezEb/0wJRMZT0GEyGbK
 9xvIJj5UZJq2q8Orc+BUcsnNQxB/XRJoCLqWq9fmdqhywOPVXC+z/qbNv3/+6Pf5MV6w
 beH69R9OianSCs055uP2uZXEb8qklJsSZgFOCmLlG+Mt5UHAHJSp/rkA5ICEmwctpifw
 BiO2iA4lhW7Nh2+IXQPy0FlsCfxsQny40rXgL5LTvXbN/mS9DKZzKRFuYZQdcVLWI/6a
 aPUC9xBRlgBwPkLP+VErJD4q47btkr5FTyWMcAfyoVFr6aYqZIJ9Cyad7yHSh5cmII8v
 n6DA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=YvpuWzR872Gf87pQE2T4jBiR+J1OEXY86ppxciNKQ9M=;
 b=M87zJ/WmmQz7jKVtNNDUz04sfBMyGpucebE+mX8P8S2dVNVdjUsnFzmPoJ7mRHHeW1
 Kc2QEbQPjanDlCHsUx1nM8HWMA0xAKs7h3/uPzdXMPPF6CNRFnyZLQwc4VAn+nu5nvkn
 5qIAXEr8Pt2q9nnN2aJYSOomUVsNRzGATvuSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=YvpuWzR872Gf87pQE2T4jBiR+J1OEXY86ppxciNKQ9M=;
 b=ON2wIOdnthbY4fDG+JC14s+xC71G7gK+7SmHCnnOP97Q6whWGbRZqEXuCDDkiDA+S4
 +7Sp9Iiy2q4oJWa0vujEGsP+B1wcxIz6MgED+duG6cdpceH5IsDoj/EvAK1pDGt73GHF
 5ZOoQos5CS9D5uoIIw/A68Anf4DdT7b4fYYcv9G7mRiterokCYQI7RI5E/YfqZ8bhfBC
 eTlstLRVzdfIpGfkg7kk3Wt1oMwKWBXPPkZfwBHCwDHuJaEvRu7FrPXjP1hjco3VwT/C
 Q5xYQ2W2GqVRjRaNYjSm2bkc32Z/cieAyUO66bKmgHMHyATWHXU31STSZO/UDLMpyjca
 dbjQ==
X-Gm-Message-State: AFeK/H0e7FfuNJzm4GyEAbSwvFZ5V3IVIYze91yyXUFN6mcfrQdYOTe4CVsjilZmdbXUw1cqHGvP7pfLQADuFolV
X-Received: by 10.31.228.193 with SMTP id b184mr15709403vkh.77.1490138558563; 
 Tue, 21 Mar 2017 16:22:38 -0700 (PDT)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.159.35.108 with HTTP; Tue, 21 Mar 2017 16:22:17 -0700 (PDT)
In-Reply-To: <20170316213624.140344-7-maxims@google.com>
References: <20170316213624.140344-1-maxims@google.com>
 <20170316213624.140344-7-maxims@google.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 21 Mar 2017 17:22:17 -0600
X-Google-Sender-Auth: UYV7E88x0qLXEKtEdHotM6nX1kU
Message-ID: <CAPnjgZ02N5q7SVb07MTrtbbBRmD5rBv3tYf0buxwXCbt9s6ZzQ@mail.gmail.com>
Subject: Re: [PATCH 06/17] aspeed: Device Tree configuration for Reset Driver
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
X-List-Received-Date: Tue, 21 Mar 2017 23:22:41 -0000

On 16 March 2017 at 15:36, Maxim Sloyko <maxims@google.com> wrote:
> Add Reset Driver configuration to ast2500 SoC Device Tree and bindings
> for various reset signals
>
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> ---
>
>  arch/arm/dts/ast2500-evb.dts              | 15 +++++++++++
>  arch/arm/dts/ast2500-u-boot.dtsi          | 10 +++++++
>  include/dt-bindings/reset/ast2500-reset.h | 45 +++++++++++++++++++++++++++++++
>  3 files changed, 70 insertions(+)
>  create mode 100644 include/dt-bindings/reset/ast2500-reset.h

Reviewed-by: Simon Glass <sjg@chromium.org>
