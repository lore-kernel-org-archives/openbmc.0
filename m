Return-Path: <joel.stan@gmail.com>
Received: from mail-ig0-x22d.google.com (mail-ig0-x22d.google.com
 [IPv6:2607:f8b0:4001:c05::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id ECEFC1A0F5E
 for <openbmc@lists.ozlabs.org>; Thu, 10 Dec 2015 14:16:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=Ln+Vgcwy; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=V582xEp1; 
 dkim-atps=neutral
Received: by igcto18 with SMTP id to18so4495932igc.0
 for <openbmc@lists.ozlabs.org>; Wed, 09 Dec 2015 19:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=g/pHmVHtlIiwih51DzQ46M+gXHZa+SpRTRXUniTrTzo=;
 b=Ln+VgcwyTyPd7ccQ4OfuI+RuJy45bXmgCBLISxdRSVfLEffIIbgI0K9KT/kq2mSkJa
 cMPlP54sAR7qqcLa60ap0Dee2wTXQvaEMhs3Jv/sTMdJK+ZKPkqF+lSbj2dDCKDXzeDb
 XPpYoRLDywkwinrCWW8gU9L3GOWJrMbuJgB6KP75/77vL3Phf5oA3liKlJwXBMv3Qw2+
 JXqWPC2sDZeFaehwq8id1ycMD24PhEP9V/bEsk9NZb/cNYnpn08YC25QBWLE6JWj2f2x
 qQxuaSuxDeLaLfmj/1ZOGwr36g73EC5tKDvHbKygS53d5WaWIo5aFSG2+qHao8ZpIEZ3
 v+mA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=g/pHmVHtlIiwih51DzQ46M+gXHZa+SpRTRXUniTrTzo=;
 b=V582xEp1afUb9u38Mp+bSCBOobQa1MohM6o5iveLZBjfD0emUrUHWwYbs2uzpnGyLk
 zTfK9diUlhPAskvvBbmndOfDFenh+vE8wqHL4J+nkh7unLLp69znK4rgxD/054S4w+mb
 0HAfdRoq5xYt7XKASvDBje9lEPTLhYfcyu1YM=
X-Received: by 10.50.160.5 with SMTP id xg5mr14366507igb.46.1449717363311;
 Wed, 09 Dec 2015 19:16:03 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.79.29.201 with HTTP; Wed, 9 Dec 2015 19:15:43 -0800 (PST)
In-Reply-To: <1449646825-17436-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1449646825-17436-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1449646825-17436-2-git-send-email-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 10 Dec 2015 13:45:43 +1030
X-Google-Sender-Auth: nZrGLZ8Mkxgq5tUTuhYOhUXA_4I
Message-ID: <CACPK8XfFeXauuY7AV-rWRpYmCvPDTwF1Kg+mEDOz0vbje+TsSA@mail.gmail.com>
Subject: Re: [PATCH linux] Temporary AST setup for Palmetto and Barreleye
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Norman James <nkskjames@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Dec 2015 03:16:06 -0000

On Wed, Dec 9, 2015 at 6:10 PM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Norman James <njames@us.ibm.com>
>
> Removed when pinmux driver is ready.

Thanks Norm. Merged as 6da1b0f7943571e825ad06b3cdb990472cc07d2b.

I've got a question below.

> +static void __init do_common_setup(void)
> +{
> +       u32 reg;

This is unused. I fixed it for you.

> +
> +       /* Enable LPC FWH cycles, Enable LPC to AHB bridge */
> +       writel(0x00000500, AST_IO(AST_BASE_LPC | 0x80));

> +static void __init do_barreleye_setup(void)
> +{
> +       u32 reg;
> +       do_common_setup();
> +
> +       /* Setup PNOR address mapping for 64M flash */
> +       writel(0x30000C00, AST_IO(AST_BASE_LPC | 0x88));
> +       writel(0xFC0003FF, AST_IO(AST_BASE_LPC | 0x8C));
> +
> +       /* GPIO setup */
> +       writel(0x9E82FCE7, AST_IO(AST_BASE_GPIO | 0x00));
> +       writel(0x0370E677, AST_IO(AST_BASE_GPIO | 0x04));
> +
> +       /*
> +        * Do read/modify/write on power gpio
> +        * to prevent resetting power on reboot
> +       */

Can you explain to me why we need to do this?

> +       reg = readl(AST_IO(AST_BASE_GPIO | 0x20));
> +       reg |= 0xCFC8F7FD;
> +       writel(reg, AST_IO(AST_BASE_GPIO | 0x20));
> +       writel(0xC738F20A, AST_IO(AST_BASE_GPIO | 0x24));
> +       writel(0x0031FFAF, AST_IO(AST_BASE_GPIO | 0x80));
> +}
