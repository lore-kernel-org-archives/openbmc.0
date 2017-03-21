Return-Path: <sjg@google.com>
Received: from mail-vk0-x236.google.com (mail-vk0-x236.google.com
 [IPv6:2607:f8b0:400c:c05::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vnplH0gYPzDqZY
 for <openbmc@lists.ozlabs.org>; Wed, 22 Mar 2017 10:23:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="aY5UGKcJ"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="ONjGCOKB";
 dkim-atps=neutral
Received: by mail-vk0-x236.google.com with SMTP id j64so96022392vkg.3
 for <openbmc@lists.ozlabs.org>; Tue, 21 Mar 2017 16:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=1whxGlZU8cjZMr0OCWRCr2wcKhn4HCOXgn9whkwXEPs=;
 b=aY5UGKcJdSOFvI1lb2YRqX7jAoO8zKSjPxa2j3pVkkrsFts1194Qll/9Er0DCs9hd4
 3Ap0TiGGw5sMFzLxm4bJ8RpaW8kog+0/UuKX4t3g3D3tbmrm3hU1hrKX06cZS3niwNg+
 r9/+eZMDE5MCLzPw6hDb8cDn7fC13j9BBLISqlsEs00mNGcCR8IlVRqwGJ0SH3m+Yqok
 A0X7Om7J924Yfs29msoZakAmzP5E0pI/e8qodvGPWzagqxhhm+vadp7qxIM4T38eBx+d
 g17TAhnEiHQlEMWAeHHg1okQAcSHVVl8CYlZKeMhN/JBPNB25PvRmLPzFA1nuux5j0tD
 n4HA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=1whxGlZU8cjZMr0OCWRCr2wcKhn4HCOXgn9whkwXEPs=;
 b=ONjGCOKBeEKXt6sf5EyiToBKeWrb+57pd/Vwltksye7Pv4oBmpvgXtCb3g4bzt+7Jd
 BqEkxYidAIaPxC978heo/rb0ziTT7Q1T6RJVrRMFQuaYpigLg+sC7AzYMMt2ZEpH88dG
 Rk4EbyNYqfus4mUDAh6MhaPNfNw6JRPJF32uE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=1whxGlZU8cjZMr0OCWRCr2wcKhn4HCOXgn9whkwXEPs=;
 b=XEeC3OmTMVYRcN9CVzjEmttHvrLN0GDsntURbaQHrmERKYj/7iHfnhOmha9fcR73gQ
 oZwXkj00CwGVxtuGI4wF2HBXxzfYROC/if/nb3XqVJuj9MkyLnxdmrdHVkllW6ayiJ8e
 rRXlevj54rh9i1XWC1Rx5cRelMD5lL/JvWS6sZ+DVXpT6K4rs2l/qY/BGUI+Jr/+WNEy
 233DhKIhVgm63g5tYPcLploH7+vYQwwrjegQMOt/x48KE1XkDxjWuu7JZfCYolNiE3Cr
 9GoFQFz+rnrrpJqBmsU/il6ijwqAD0Hshwr1Eq//+hmL8opNRd77hcD5Rz8dItjHSsnb
 OOBg==
X-Gm-Message-State: AFeK/H3FW65FtfHo5f4uEiVye7pOcBDUlIiTUUZUEb4BqQBhjK3jcLU3NxCsbA3fADJ7Oocw8cZe9ruWdfBx5vrX
X-Received: by 10.176.7.10 with SMTP id h10mr16652249uah.46.1490138584849;
 Tue, 21 Mar 2017 16:23:04 -0700 (PDT)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.159.35.108 with HTTP; Tue, 21 Mar 2017 16:22:44 -0700 (PDT)
In-Reply-To: <20170316213624.140344-18-maxims@google.com>
References: <20170316213624.140344-1-maxims@google.com>
 <20170316213624.140344-18-maxims@google.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 21 Mar 2017 17:22:44 -0600
X-Google-Sender-Auth: s_0axVpDkxI0KzPqyILiJqUpdEc
Message-ID: <CAPnjgZ3WqcjsjZMGyEtf1K8UAr1HP=eMDiVgmPg=DMC5mW0aiA@mail.gmail.com>
Subject: Re: [PATCH 17/17] aspeed: Network Driver configuration for EVB
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
X-List-Received-Date: Tue, 21 Mar 2017 23:23:07 -0000

On 16 March 2017 at 15:36, Maxim Sloyko <maxims@google.com> wrote:
> Enable Network Driver along with network related commands -- ping, dhcp,
> mii -- in ast2500 Eval Board's defconfig.
>
> Add MAC devices' configuration to Eval Board Device Tree.
>
> Signed-off-by: Maxim Sloyko <maxims@google.com>
>
> ---
>
>
> ---
>  arch/arm/dts/ast2500-evb.dts  | 14 ++++++++++++++
>  configs/evb-ast2500_defconfig |  7 +++++++
>  2 files changed, 21 insertions(+)

Reviewed-by: Simon Glass <sjg@chromium.org>

Does this come from Linux? It should mention the version or commit.
