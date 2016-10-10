Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x241.google.com (mail-ua0-x241.google.com
 [IPv6:2607:f8b0:400c:c08::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ssqpG00V6zDsfk
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 17:24:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=FLzxN2D4; 
 dkim-atps=neutral
Received: by mail-ua0-x241.google.com with SMTP id 49so3664123uac.0
 for <openbmc@lists.ozlabs.org>; Sun, 09 Oct 2016 23:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=8pZdY24AQCqp+HV9sNWn1pDqoUMZ2cvxSQabu1msa9A=;
 b=FLzxN2D4rdlDO9oJeOWU0Xz5Ll7EqAAtGDEC4muqpAyh38YcUxHtoOAgGwDTAKK0Lx
 nR8UCnicW9Kwld9NZ9I0I3p992zwxstLfL/KmyYd6g/27uib4hlLht7zfJ9SynRL/mm2
 3HbWo9ElSL5BPWJmHGg9y1sIliwbdbIRIukyK+gJeD9vJo5gaPm0CFpVT8ll0XxxPJ5R
 Spen6EDqg7xWHogAPwKceUsspPc5+IFpGd2VWHNoG8ucdWD67ySOBAg91OTfFcbfYK0v
 6HLAKniLhKGyZgXeBVot16Z1WWI1D5ehYdwxE9fkQCLZfDpjPxlBhE+UVLEi9xQ2aPHZ
 7niA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=8pZdY24AQCqp+HV9sNWn1pDqoUMZ2cvxSQabu1msa9A=;
 b=PHEwDyu/mR5eRAtkDfpeQMIkwcpBCh1Tnpa4Ppsw67TaKXcpA84EpGU6dFVHMIH3qR
 uG3SG64jrcGFzx7aeZVCXVZnQw76MQoClWFwrB8sFH7DYwke56Mb9+fXcfCVMnyE7Oi5
 Uk+0uYxSiyJMbpM2bFQ/RGB4kPdsIM1M8XSBBE3X33e81pG194/Yg+ipll2bpPJKlqD5
 t00cuTY9h4HnJiqjCmbECTFO4/saawKTiIdPsjSIfW2bW9r1LAFGprefKgtK0R/l6UWB
 CwQHgPoYDEjzwijld2iPElERS6ifvaI9/4awDQ53SQPWO+J4+JWbQIkijXrCdNt+3rYr
 LKSA==
X-Gm-Message-State: AA6/9Rm8780CFb/MADA3Oc7qDAGUG9Cm0VPKebfc7hFci0cx1jqfMg+N+nKdzaVPZ2HCyPMlUAd2Xz64UI0FGw==
X-Received: by 10.176.69.210 with SMTP id u76mr18227558uau.177.1476080644154; 
 Sun, 09 Oct 2016 23:24:04 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Sun, 9 Oct 2016 23:23:43 -0700 (PDT)
In-Reply-To: <1475789205-19618-11-git-send-email-clg@kaod.org>
References: <1475789205-19618-1-git-send-email-clg@kaod.org>
 <1475789205-19618-11-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 10 Oct 2016 17:23:43 +1100
X-Google-Sender-Auth: QJbt67lqUCnRoqnHwHw0Swh8rvc
Message-ID: <CACPK8XdvPrsxQZLipEPLAfK3VJ=XaTFrAcQz1G9XK30z9=26XQ@mail.gmail.com>
Subject: Re: [PATCH u-boot 10/12] aspeed: remove CONFIG_PHY_MAX_ADDR
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Mon, 10 Oct 2016 06:24:06 -0000

On Fri, Oct 7, 2016 at 8:26 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> PHY_MAX_ADDR has the same value
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/net/ftgmac100.c      | 3 ++-
>  include/configs/ast-g4-phy.h | 2 --
>  include/configs/ast-g5-phy.h | 1 -
>  3 files changed, 2 insertions(+), 4 deletions(-)
